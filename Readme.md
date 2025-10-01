### Using Raylib on a Mac - install

1. Open the terminal and install brew, following this https://brew.sh/

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install raylib
```bash
brew install raylib
```

### Build and run examples using CMake
Try some code from the core examples from https://github.com/raysan5/raylib/tree/master/examples
Start with the file [core_basic_window.c ](https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c). The code from this file is already in the main.c file in this repository

1. Install Cmake
```bash
brew install cmake
```

2. Clone/download this repository or recreate its structure. Change the working directory to one level above src and type the code below in the terminal to build and run the main.c

```bash
cmake -B build && cmake --build build && ./build/game
```
This method is using the CMakeLists.txt file that is one level above the src folder. It will 
- create a folder named build one level above the src folder
- build the code from the main.c source file inside the src into an executable called game
- run the game 


### Alternative way to build and run the examples using zig
Alternatively, instead of using CMake you can use zig to build & run. I prefer it because when you make changes and re-run the code it works faster.

1. Install zig
```
brew install zig
```

2. Clone/download this repository or recreate its structure. Change the working directory to one level above src and type the code below in the terminal to build and run the main.c
```
zig build run
```
This method is using the build.zig file that is one level above the src folder. It will 
- create a folder named zig-out one level above the src folder
- build the code from the main.c source file inside the src into an executable called game
- run the game 


### Vscode setup:
If you open the main.c now in VSCode you will see red squiggles at the #import raylib. They mean that VSCode cannot find raylib. To fix this :

- Press Ctrl-Shift-P and from the pallete select C/C++: Edit Configurations (UI)
- Change the include Path field to this 
```
${workspaceFolder}/**
/opt/homebrew/opt/raylib/include
/opt/homebrew/opt/raylib/lib
```
- set C standard as C11
Now VSCode recognizes raylib. You have code completion working and you can Command-Left click in the functions to open and read their definitions.

### Next steps
Try more [examples](https://github.com/raysan5/raylib/tree/master/examples), read about raylib library design in the [wiki](https://github.com/raysan5/raylib/wiki), try some [games](https://www.raylib.com/games.html).
