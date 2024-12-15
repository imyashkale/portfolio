create-env:
		python3 -m venv venv

# Restart the terminal and virtual enviroment after the installtion
install: 
		pip install mkdocs mkdocs-material pymdown-extensions mkdocs-glightbox neoteroi-mkdocs
		pip install "mkdocs-material[imaging]"
