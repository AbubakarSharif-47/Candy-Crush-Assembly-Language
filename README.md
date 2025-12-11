🍬 Candy Crush (Assembly Language – Computer Organization Project)

A fully working Candy Crush–style puzzle game implemented entirely in x86 Assembly (MASM/TASM) using BIOS interrupts for graphics, mouse interaction, and game logic.
This project was developed as part of a Computer Organization & Assembly Language course.

🎮 Game Overview

This project recreates a simplified version of Candy Crush using low-level assembly.
It features:

A 7×7 candy board

Multiple candy shapes (triangle, diamond, circle, square, bomb)

Three levels, each with unique board layouts

Score tracking and limited moves

Mouse-based input (INT 33h)

Special bomb candy that clears rows/columns

Real-time graphical rendering using BIOS video interrupts (INT 10h)

The entire game runs in real-mode DOS and is drawn pixel-by-pixel without any high-level graphics library.

✨ Features
✔️ Fully Interactive Gameplay

Click two candies to swap them

Matches of 3+ candies are automatically detected and cleared

Score increases as candies are matched

Bomb candy adds bonus points and destroys full lines

✔️ Levels

The game includes 3 levels:

Level 1 – Basic grid

Level 2 – Obstacles introduced

Level 3 – More complex grid patterns

Each level has a score threshold and 10 allowed moves.

✔️ Graphics Rendering

Uses BIOS interrupt:

INT 10h (AH = 0Ch)


to draw pixels for:

Shapes (triangle, diamond, circle, square)

Board tiles

Bomb animation

Background panels

All shapes are drawn manually using loops and arithmetic.

✔️ Mouse Support

The game uses:

INT 33h


for:

Mouse initialization

Mouse movement tracking

Left click detection

Board cell selection

✔️ Real-Time Animations

Includes:

Candy falling

Crushing animations

Board repopulation

Timed visual delay routines

🛠️ Requirements

To run or compile the game, you need:

DOSBox (recommended)

TASM/MASM assembler

TLINK linker

16-bit real-mode environment

BIOS interrupt support

📦 File Structure
📁 project-folder
│── Game.asm      # Full game source code
│── README.md     # Documentation (this file)
│── output.txt     # High score file (created at runtime)

▶️ How to Run
1. Assemble
tasm Game.asm

2. Link
tlink Game.obj

3. Run
Game.exe

4. Run inside DOSBox

Place files in a folder, mount it:

mount c c:\candycrush
c:
Game.exe

🧩 Gameplay Instructions

Use mouse to click two adjacent candies.

If they form a valid match, they will swap and crush.

Gain points for each crush.

Complete the score threshold within 10 moves to unlock the next level.

Watch out for bomb candies — they destroy rows/columns and award bonus points.

🧠 Technical Concepts Implemented
✔️ BIOS Video Mode Programming

Pixel drawing (INT 10h)

Screen positioning

Color management using AL registers

✔️ Mouse Interrupt Handling

Position mapping to grid cells

Click-based selection

Input validation

✔️ Game Logic

2D board stored in memory arrays

Horizontal & vertical match detection

Swap algorithm

Candy regeneration

Bomb activation logic

Level progression system

✔️ Procedural Assembly Design

Contains 40+ procedures including:

level_1, level_2, level_3

populatel1, populatel2, populatel3

checkHorizontalCrush, checkVerticalCrush

Shape drawing routines (circle, triangle, square_shape, diamond)

Mouse handlers

Board filling & animations

📈 Screenshots (Optional)

Add screenshots here if you want later.

👨‍💻 Authors

Abubakar Sharif

Course: Computer Organization & Assembly Language

⭐ Future Improvements

High-resolution graphics

Sound effects

Better animation transitions

Optimized crush detection

Save/Load feature
