#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Creating virtual env"
python3 -m venv venv

echo "Starting virtual env"
source venv/bin/activate

echo "Adding project path to PYTHONPATH"
export PYTHONPATH="$1:$PYTHONPATH"

echo "Installing project dependencies"
pip install -r requirements.txt

echo "Navigating to the project directory"
cd $1

echo "Running pre-commit install"
pre-commit install --hook-type commit-msg

echo "Test run pre-commit on all files"
pre-commit run --all-files

echo "Done. Happy coding!"
