# 🍬 Candy Crush (Assembly Language – Computer Organization Project)

A fully working Candy Crush–style puzzle game implemented entirely in **x86 Assembly (MASM/TASM)** using BIOS interrupts for graphics, mouse interaction, and game logic. This project was developed as part of a **Computer Organization & Assembly Language** course.

---

## 🎮 Game Overview

This project recreates a simplified version of Candy Crush using **low-level assembly**.  
It includes:

- A **7×7 candy board**  
- Multiple candy shapes (triangle, diamond, circle, square, bomb)  
- **Three levels**, each with unique board layouts  
- **Score tracking** and **limited moves**  
- **Mouse-based input (INT 33h)**  
- **Special bomb candy** that clears rows/columns  
- Real-time graphics using **BIOS interrupt INT 10h**

The entire game runs in **real-mode DOS** and is drawn pixel-by-pixel without any high-level graphics library.

---

## ✨ Features

### ✔️ Fully Interactive Gameplay
- Click two candies to swap them  
- Matches of **3+ candies** are detected and crushed  
- Score increases automatically  
- Bomb candy adds bonus points and destroys lines  

### ✔️ Levels  
The game includes **3 progressively challenging levels**:

- **Level 1** – Basic grid  
- **Level 2** – Obstacles introduced  
- **Level 3** – More complex grid patterns  

Each level requires crossing a **score threshold** within **10 moves**.

### ✔️ Graphics Rendering  
Uses BIOS interrupt:
to draw:
- Candy shapes  
- Board tiles  
- Bomb animation  
- Background panels  

### ✔️ Mouse Support  
Handled via:
Used for:
- Mouse initialization  
- Position tracking  
- Left-click detection  
- Cell selection  

### ✔️ Real-Time Animations
- Candy falling  
- Crushing animations  
- Board repopulation  
- Delayed visual effects  

---

## 🛠️ Requirements

To compile and run the game, you need:

- **DOSBox** (recommended)  
- **TASM/MASM** assembler  
- **TLINK** linker  
- 16-bit real-mode environment  
- BIOS interrupt support  

---

## 📦 File Structure

📁 project-folder
│── Game.asm # Full assembly source code
│── README.md # This documentation
│── output.txt # High score file (generated at runtime)


---

## ▶️ How to Run
📁 project-folder
│── Game.asm # Full assembly source code
│── README.md # This documentation
│── output.txt # High score file (generated at runtime)
### 1. Assemble
```bash
tasm Game.asm
