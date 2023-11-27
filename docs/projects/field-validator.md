# Field Validator

## Introduction

The "field-validator" is a specialized tool implemented in Go, designed to validate data based on configurable criteria. It utilizes a config.yaml to define checks and ensures that input data, whether hardcoded or fetched from a URL response, complies with these checks.

## Summary

This project presents a flexible and efficient approach to data validation, catering to various data integrity requirements.

## Key Features

### Exist Check (V1)

- Ensures fields are not empty, validating non-null data.

### Flexible Data Input (V2)

- Offers the ability to pass data dynamically to the validator function, enhancing flexibility.

### Validation Checks

- **Exist (yes/no):** Determines if fields should be empty or not.
- **Min Check:** Validates the minimum length or value.
- **Max Check:** Checks the maximum length or value.

## Technologies Used

- **Go:** Efficient for building validation tools. [Go Documentation](https://golang.org/doc/){:target="_blank"}

## Project Repository

- [field-validator GitHub Repository](https://github.com/imyashkale/field-validator){:target="_blank"}