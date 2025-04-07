# Firecracker

Firecracker is a game engine for creating arcade-style games on the Commodore 64.

It comes with many tools to help you start making games for the legendary computer!

(Firecracker is currently an experimental piece of software, only use it if you absolutely know what you're doing)

## Features

- A fully-fledged programming language
- Inline sprite editing
- Software sprite collision detection
- Built-in 6 digit scoreboards
- Functions for plotting backgrounds

## Games made with Firecracker

![Pinball Gameplay](https://github.com/ZeroPlayerRodent/firecracker/blob/main/img/pinball2.gif)

![Snowman Slider Gameplay](https://github.com/ZeroPlayerRodent/firecracker/blob/main/img/snow.gif)

![Knights Attack Gameplay](https://github.com/ZeroPlayerRodent/firecracker/blob/main/img/knight.gif)

![Bombers Dodge Gameplay](https://github.com/ZeroPlayerRodent/firecracker/blob/main/img/bombers.gif)

## How to use

### Building Firecracker

1. Clone the repo to your machine.
2. `cd` into to the `src` directory.
3. Load `build.lisp` in SBCL.

### Running Firecracker

1. Put your game's source code in the same directory as Firecracker
2. Type `./firecracker <filename.lisp> <filename.asm>`
3. Assemble the output file in dasm.

### Running a Firecracker game

1. Create a C64 disk or tape image containing the game binary.
2. Load the image on a C64 emulator.
3. Type `SYS 32768`.
