#!/bin/bash

# Script to download and integrate the custom cube solver
# This script will clone your solver repository and compile it to WebAssembly

echo "🎯 Integrating Custom Cube Solver"
echo "================================="

# Check if Emscripten is available
if ! command -v emcc &> /dev/null; then
    echo "⚠️  Warning: Emscripten not found. Trying alternative approach..."
    echo "   Looking for pre-compiled files in your solver repository..."
    
    # Try to find pre-compiled files in the repo
    TEMP_DIR="temp_solver"
    echo "📦 Creating temporary directory: $TEMP_DIR"
    
    # Clone the solver repository
    echo "🔄 Cloning solver repository..."
    git clone https://github.com/chintanlad10/demo-solver.git $TEMP_DIR
    
    cd $TEMP_DIR
    
    # Look for existing compiled files
    if [ -f "cube-solver.js" ] && [ -f "cube-solver.wasm" ]; then
        echo "✅ Found pre-compiled files! Using those instead."
        echo "📂 Copying compiled files to project..."
        cp cube-solver.js ../js/cube/solver/
        cp cube-solver.wasm ../js/cube/solver/
        cd ..
        rm -rf $TEMP_DIR
        echo "✅ Custom solver integration complete!"
        echo "🚀 You can now run the project with your own solver."
        exit 0
    else
        echo "❌ No pre-compiled files found and Emscripten not available."
        echo "   Please install Emscripten or add compiled files to your repository."
        echo "   Visit: https://emscripten.org/docs/getting_started/downloads.html"
        cd ..
        rm -rf $TEMP_DIR
        exit 1
    fi
fi

# Create temporary directory
TEMP_DIR="temp_solver"
echo "📦 Creating temporary directory: $TEMP_DIR"

# Clone the solver repository
echo "🔄 Cloning solver repository..."
git clone https://github.com/chintanlad10/demo-solver.git $TEMP_DIR

# Navigate to solver directory
cd $TEMP_DIR

# Compile to WebAssembly
echo "🔨 Compiling C++ to WebAssembly..."
make web

# Check if compilation was successful
if [ ! -f "cube-solver.js" ] || [ ! -f "cube-solver.wasm" ]; then
    echo "❌ Compilation failed! Files not found."
    cd ..
    rm -rf $TEMP_DIR
    exit 1
fi

# Copy files to the project
echo "📂 Copying compiled files to project..."
cp cube-solver.js ../js/cube/solver/
cp cube-solver.wasm ../js/cube/solver/

# Clean up
cd ..
rm -rf $TEMP_DIR

echo "✅ Custom solver integration complete!"
echo "🚀 You can now run the project with your own solver."
echo ""
echo "To start the project:"
echo "1. Open this folder in VS Code"
echo "2. Install the Live Server extension"
echo "3. Right-click on index.html and select 'Open with Live Server'"
