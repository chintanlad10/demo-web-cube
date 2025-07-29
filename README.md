# Rubik's Cube Simulator

A sophisticated 3D Rubik's Cube simulator built with modern web technologies. This interactive application allows users to manipulate a virtual Rubik's cube and includes an automatic solver powered by WebAssembly.

## Overview

This project combines Three.js for 3D rendering with a high-performance WebAssembly-based cube solver. The application features smooth animations, realistic 3D graphics, and supports both keyboard and mouse/touch controls for an intuitive user experience.

## Technologies Used

- **Three.js 0.124.0** - 3D graphics rendering
- **WebAssembly** - High-performance C++ solver compiled to WASM
- **ES6 Modules** - Modern JavaScript module system
- **HTML5 Canvas** - WebGL rendering surface
- **Vanilla JavaScript** - No framework dependencies

## Features

- Interactive 3D cube manipulation with keyboard and mouse/touch controls
- Automatic cube solver using the CFOP method
- Real-time solve statistics showing time and move count
- Instant reset functionality to return cube to solved state
- Responsive design supporting desktop and mobile devices
- Smooth animations with frame-rate independent timing
- Support for standard Rubik's cube notation and wide moves

## Installation

1. Clone this repository
2. Serve the files using a local web server (required for ES6 modules)
3. Open `index.html` in your browser

### Using VS Code Live Server
Install the [Live Server extension](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) and right-click on `index.html` to select "Open with Live Server".

## Controls

### Keyboard Controls

The application supports standard Rubik's cube notation:

- **Face Rotations**: U, D, F, B, R, L (clockwise)
- **Counter-clockwise**: Hold Shift + face key (U', D', F', B', R', L')
- **Wide Moves**: Hold W + face key (u, d, f, b, r, l)
- **Slice Moves**: M, E, S (middle, equatorial, standing)
- **Cube Rotations**: X, Y, Z

#### Complete Keystroke Reference

| Key Combination | Move | Mac Equivalent | Description |
|-----------------|------|----------------|-------------|
| `U` | U | `U` | Up face clockwise |
| `Shift + U` | U' | `⇧ + U` | Up face counter-clockwise |
| `D` | D | `D` | Down face clockwise |
| `Shift + D` | D' | `⇧ + D` | Down face counter-clockwise |
| `F` | F | `F` | Front face clockwise |
| `Shift + F` | F' | `⇧ + F` | Front face counter-clockwise |
| `B` | B | `B` | Back face clockwise |
| `Shift + B` | B' | `⇧ + B` | Back face counter-clockwise |
| `R` | R | `R` | Right face clockwise |
| `Shift + R` | R' | `⇧ + R` | Right face counter-clockwise |
| `L` | L | `L` | Left face clockwise |
| `Shift + L` | L' | `⇧ + L` | Left face counter-clockwise |
| `W + U` | u | `W + U` | Wide up move |
| `W + Shift + U` | u' | `W + ⇧ + U` | Wide up counter-clockwise |
| `W + D` | d | `W + D` | Wide down move |
| `W + Shift + D` | d' | `W + ⇧ + D` | Wide down counter-clockwise |
| `W + F` | f | `W + F` | Wide front move |
| `W + Shift + F` | f' | `W + ⇧ + F` | Wide front counter-clockwise |
| `W + B` | b | `W + B` | Wide back move |
| `W + Shift + B` | b' | `W + ⇧ + B` | Wide back counter-clockwise |
| `W + R` | r | `W + R` | Wide right move |
| `W + Shift + R` | r' | `W + ⇧ + R` | Wide right counter-clockwise |
| `W + L` | l | `W + L` | Wide left move |
| `W + Shift + L` | l' | `W + ⇧ + L` | Wide left counter-clockwise |
| `M` | M | `M` | Middle slice |
| `Shift + M` | M' | `⇧ + M` | Middle slice counter-clockwise |
| `E` | E | `E` | Equatorial slice |
| `Shift + E` | E' | `⇧ + E` | Equatorial slice counter-clockwise |
| `S` | S | `S` | Standing slice |
| `Shift + S` | S' | `⇧ + S` | Standing slice counter-clockwise |
| `X` | x | `X` | Cube rotation around R |
| `Shift + X` | x' | `⇧ + X` | Cube rotation around R' |
| `Y` | y | `Y` | Cube rotation around U |
| `Shift + Y` | y' | `⇧ + Y` | Cube rotation around U' |
| `Z` | z | `Z` | Cube rotation around F |
| `Shift + Z` | z' | `⇧ + Z` | Cube rotation around F' |

### Special Commands

| Key Combination | Action | Mac Equivalent | Description |
|-----------------|--------|----------------|-------------|
| `Enter` | Solve | `⏎` | Automatically solve the cube |
| `Escape` | Reset | `⎋` | Reset cube to solved state |

**Note**: Learn more about Rubik's Cube notation at [ruwix.com](https://ruwix.com/the-rubiks-cube/notation/)

### Mouse/Touch Controls

- **Click and drag stickers** - Rotate faces in the direction of drag
- **Click and drag outside cube** - Rotate entire cube
- **Scroll wheel** - Zoom in/out

### Button Controls

- **SOLVE** - Automatically solve the current cube state
- **RESET** - Return cube to solved position

## Project Structure

```
├── index.html              # Main HTML file
├── style.css              # UI styling
├── js/
│   ├── cube/
│   │   ├── main.js         # Application controller
│   │   ├── Cube.js         # Cube state management
│   │   ├── Cubie.js        # Individual cube pieces
│   │   ├── Sticker.js      # Colored face management
│   │   ├── Constants.js    # Configuration and mappings
│   │   ├── RotationMatrices.js # 3D transformation math
│   │   └── solver/
│   │       ├── cube-solver.js   # WebAssembly wrapper
│   │       └── cube-solver.wasm # Compiled C++ solver
│   └── three/
│       └── OrbitControls.js # Camera controls
```

## Architecture

The application follows a modular architecture with clear separation of concerns:

- **main.js** - Coordinates the application, handles events, and manages the animation loop
- **Cube.js** - Manages the overall cube state and move execution
- **Cubie.js** - Represents individual cube pieces with geometry and animation
- **Sticker.js** - Handles the colored faces and their positioning
- **Constants.js** - Defines configuration values and input mappings

## How It Works

### 3D Rendering
The cube consists of 26 individual pieces (cubies) positioned in a 3x3x3 grid, excluding the center piece. Each cubie can have 1-3 colored stickers depending on its position (corner, edge, or center piece).

### Animation System
Moves are queued and processed sequentially to ensure smooth animations. Each rotation is animated over multiple frames using delta-time calculations for frame-rate independence.

### Cube Solving
The WebAssembly solver analyzes the current cube state and returns an optimal solution using the CFOP method. The solution is then animated move by move with timing and statistics tracking.

### State Management
The application maintains both visual positions (for smooth animations) and logical positions (for cube state) of each piece, ensuring the visual representation always matches the logical state.

## Browser Compatibility

- Chrome/Chromium (recommended)
- Firefox
- Safari
- Edge

Requires WebAssembly support and ES6 module compatibility.

## Development

This project demonstrates several advanced web development concepts:

- ES6 module system with clean dependency management
- WebAssembly integration for performance-critical algorithms
- 3D graphics programming with Three.js
- Complex event handling for multiple input methods
- Mathematical transformations for 3D rotations
- State management for real-time applications

For detailed code explanation and architecture analysis, see `explain-web.md`.
