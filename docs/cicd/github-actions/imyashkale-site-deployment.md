# Build and Deploy Portfolio Workflow

This workflow automates the process of building and deploying a portfolio website using GitHub Actions. It assumes you have a Git repository for your portfolio with a `master` branch.

## Workflow Trigger

This workflow is triggered whenever there is a push to the `master` branch of your repository.

## Environment Variables

1. `PYTHON_VERSION`: Set to `'3.x'` to specify the Python version.
2. `AWS_REGION`: Set to `'ap-south-1'` to specify the AWS region.
3. `S3_BUCKET_NAME`: Set to your S3 bucket name where the website will be deployed.

```yaml
env:
  PYTHON_VERSION: '3.x' 
  AWS_REGION: 'ap-south-1'
  S3_BUCKET_NAME: 'imyashkale-portfolio' ## Bucket Name

```

## Jobs

### Build Stage

This job is responsible for building the MkDocs site and uploading it as an artifact.

**Step 1**: Checkout Repository

```yaml
- name: Checkout Repository
  uses: actions/checkout@v3
```

This code block checks out the Git repository, making its contents available for further actions.

**Step 2**: Set up Python

```yaml
- name: Set up Python
  uses: actions/setup-python@v4.7.1
  with:
    python-version: ${{ env.PYTHON_VERSION }}
```

Here, Python is set up with the specified version (`3.x`) from the environment variable.

**Step 3**: Install Dependencies

```yaml
- name: Install Dependencies
  run: |
    pip install mkdocs mkdocs-material pymdown-extensions
```

This code block installs necessary Python packages for MkDocs.

**Step 4**: Build MkDocs Site

```yaml
- name: Build MkDocs Site
  run: |
    mkdocs build
```

The MkDocs site is built using the `mkdocs build` command.

**Step 5**: Upload Site to Artifact Storage

```yaml
- name: Upload Site to Artifact Storage
  uses: actions/upload-artifact@v3.1.3
  with:
    name: site
    path: site/
```

This step uploads the contents of the `site/` directory as an artifact named 'site.'

### Deploy Stage

This job deploys the MkDocs site to AWS S3 and invalidates the CloudFront distribution.

**Step 1**: Checkout Repository

```yaml
- name: Checkout Repository
  uses: actions/checkout@v3
```

**Step 2**: Download Site from Artifact Storage

```yaml
- name: Download Site from Artifact Storage
  uses: actions/download-artifact@v3.0.2
  with:
    name: site
    path: site
```

**Step 3**: Configure AWS Credentials

```yaml
- name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v4.0.1
  with:
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    aws-region: ${{ env.AWS_REGION }}
```

**Step 4**: Sync Directory to S3

```yaml
- name: Sync Directory to S3
  run: |
    aws s3 sync site/ s3://${{ env.S3_BUCKET_NAME }}/ --delete
```

**Step 5**: Invalidate CloudFront Distribution

```yaml
- name: Invalidate CloudFront Distribution
  run: |
    aws cloudfront create-invalidation --distribution-id ${{ secrets.CLOUDFRONT_DISTRIBUTION_ID }} --paths "/*"
```

## Complete YAML Workflow File

Here's the complete YAML file for this workflow:

```yaml
name: Build and Deploy Portfilio

on:
  push:
    branches:
      - master

env:
  PYTHON_VERSION: '3.x' 
  AWS_REGION: 'ap-south-1'
  S3_BUCKET_NAME: 'imyashkale-portfolio'

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4.7.1
      with:
        python-version: ${{ env.PYTHON_VERSION }}

    - name: Install Dependencies
      run: |
        pip install mkdocs mkdocs-material pymdown-extensions

    - name: Build MkDocs Site
      run: |
        mkdocs build

    # Upload the site directory as an artifact for the deploy job to use
    - name: Upload Site to Artifact Storage
      uses: actions/upload-artifact@v3.1.3
      with:
        name: site
        path: site/

  deploy:
    needs: build
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v3

    - name: Download Site from Artifact Storage
      uses: actions/download-artifact@v3.0.2
      with:
        name: site
        path: site

    - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v4.0.1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ env.AWS_REGION }}

    - name: Sync Directory to S3
      run: |
        aws s3 sync site/ s3://${{ env.S3_BUCKET_NAME }}/ --delete

    - name: Invalidate CloudFront Distribution
      run: |
        aws cloudfront create-invalidation --distribution-id ${{ secrets.CLOUDFRONT_DISTRIBUTION_ID }} --paths "/*"
```

## CloudFront Lambda@Edge Function

### Explanation

```javascript
function handler(event) {
  var request = event.request;
  if (request.uri !== "/" && (request.uri.endsWith("/") || request.uri.lastIndexOf(".") < request.uri.lastIndexOf("/"))) {
    if (request.uri.endsWith("/")) {
      request.uri = request.uri.concat("index.html");
    } else {
      request.uri = request.uri.concat("/index.html");
    }
  }
  return request;
}
```

This code block represents a JavaScript function that serves as a handler for a CloudFront Lambda@Edge function. The purpose of this function is to modify incoming requests to handle the scenario where `index.html` files are requested in directories with or without a trailing slash (`/`). This modification is typically used to address issues related to serving the correct `index.html` file for routes in websites generated by MkDocs, which may have URLs like `/my-page/` and `/my-page` (without the trailing slash).

### Expected Response

The expected response of this function is a modified HTTP request object (`request`) that ensures requests for directory paths or paths without the trailing slash are rewritten to point to the `index.html` file within those directories. This modification allows CloudFront to serve the correct content for routes in websites generated by MkDocs, ensuring that URLs like `/my-page/` and `/my-page` both resolve to the `index.html` file within the `/my-page/` directory.

### Conclusion

Upon completion of the 'build' and 'deploy' stages, your portfolio website will be built, deployed to AWS S3, and the CloudFront distribution will be updated to serve the latest content. This workflow simplifies the process of building and deploying your portfolio website, ensuring it's always up-to-date.
