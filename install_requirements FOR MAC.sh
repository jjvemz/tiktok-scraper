#!/bin/bash

echo "Installing required packages from requirements.txt..."
pip install -r requirements.txt
echo
echo "Installation complete!"
read -p "Press Enter to continue..."