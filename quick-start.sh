#!/bin/bash

# Quick script to use your existing solver without compilation
echo "🎯 Using Existing Cube Solver"
echo "=============================="

# Check if we already have a working solver
if [ -f "js/cube/solver/cube-solver.js" ] && [ -f "js/cube/solver/cube-solver.wasm" ]; then
    echo "✅ Solver files found! Your cube project is ready to run."
    echo ""
    echo "🚀 To start the project:"
    echo "1. Open this folder in VS Code"
    echo "2. Install the Live Server extension"
    echo "3. Right-click on index.html and select 'Open with Live Server'"
    echo ""
    echo "🎮 Controls:"
    echo "• Press S to solve the cube"
    echo "• Press R to reset the cube"
    echo "• Use mouse to rotate the view"
    echo "• Use keyboard arrows and WASD for cube rotations"
    echo ""
    echo "📊 The project includes:"
    echo "• Solve timing"
    echo "• Move counting"
    echo "• Reset functionality"
else
    echo "❌ Solver files not found!"
    echo "   Run './setup-solver.sh' to integrate your custom solver."
fi
