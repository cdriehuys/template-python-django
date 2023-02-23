#!/bin/bash

set -euf
set -o pipefail

if [ ! -d ".venv" ] ; then
    echo "Virtual environment doesn't exist. Creating it now..."
    poetry install
fi

echo "Installing pre-commit hooks..."
pre-commit install
echo "Done."
