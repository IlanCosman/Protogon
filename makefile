# Variables
PYTHON = python3
SRC_DIR = src
VENV_DIR = venv
PIP = $(VENV_DIR)/bin/pip
JUPYTER = $(VENV_DIR)/bin/jupyter

# Targets
.PHONY: remove-venv install convert-notebooks

# Create virtual environment
$(VENV_DIR):
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV_DIR)
	@echo "Virtual environment created."

# Remove virtual environment
remove-venv:
	@echo "Removing virtual environment..."
	rm -rf $(VENV_DIR)
	@echo "Virtual environment removed."

# Install dependencies
install: $(VENV_DIR)
	@echo "Installing dependencies..."
	$(PIP) install -r requirements.txt
	@echo "Dependencies installed."

# Convert Jupyter notebooks to Python files
convert-notebooks: $(VENV_DIR)
	@echo "Removing existing python files..."
	rm -f $(SRC_DIR)/*.py
	@echo "Existing python files removed."
	@echo "Converting notebooks to python files..."
	$(JUPYTER) nbconvert --to python $(SRC_DIR)/*.ipynb
	@echo "Notebooks converted to python files."
