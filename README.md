#  8051-RTOS-Dinosaur-Game (DinoOS)

A custom preemptive Real-Time Operating System (RTOS) built from scratch for the 8051 microcontroller, designed to run a hardware-interfaced replica of the Chrome Dinosaur Game. 

This project demonstrates low-level embedded system design, concurrency management, hardware-software interfacing, and memory optimization using C and Inline Assembly.

##  Core Architecture

Unlike standard bare-metal microcontroller loops, this project utilizes a custom **multithreaded producer-consumer architecture**. 

* **The Producers (Input Handlers):** Fast-executing threads that poll hardware (Active-Low Buttons and a 4x3 Keypad Matrix), parse the input, handle debouncing, and safely enqueue commands into a shared circular buffer.
* **The Consumer (Game & Render Engine):** A thread that reads from the buffer, calculates collision physics, and writes custom CGRAM graphics to a physical LCD screen.
* **The Scheduler:** A preemptive round-robin scheduler driven by hardware Timer 0 interrupts, ensuring fair CPU time allocation across all threads.

##  Technical Highlights

### 1. Custom Preemptive RTOS Kernel
* **Context Switching:** Hardware-driven thread switching utilizing Timer 0. The ISR automatically saves the state (ACC, B, DPTR, PSW) of the active thread, rotates the thread bitmap, and restores the next thread's state via `RETI`.
* **Memory Isolation:** Each thread is assigned a dedicated 16-byte stack space in RAM and a distinct physical register bank via the PSW register, heavily optimizing context switch speeds.

### 2. Concurrency & Synchronization
* **Semaphores:** Implemented custom `Wait()` and `Signal()` semaphore logic to protect shared memory.
* **Critical Sections:** Handled race conditions by manipulating the Global Interrupt Enable (`EA`) flag to prevent Timer 0 from corrupting data during multi-step variable updates.
* **Resource Locks:** Utilized `Mutex`, `Empty`, and `Full` semaphores to strictly control access to the shared circular buffer and prevent visual tearing between the game logic and rendering threads.

### 3. Inline Assembly Game Engine
Due to the strict memory and speed constraints of the 8051, the core game rendering engine is written in **Inline Assembly**.
* **Continuous Map Scrolling:** Built a multi-variable shift register using the `RLC A` (Rotate Left through Carry) instruction. This allows pixel data (cacti) to seamlessly fall off the edge of one memory block and carry over into the adjacent block.
* **Bitwise Collision Detection:** Fast, cycle-efficient bitmasking checks the state of the MSB (Most Significant Bit) against the player's current row to calculate collisions instantly.

### 4. Hardware Interfacing
* **Matrix Keypad:** Implemented row/column scanning algorithms with strict debouncing and long-press protection to prevent input flooding.
* **Bitwise State Manipulation:** Handled active-low hardware logic using bitwise NOT (`~`) operations to cleanly map physical ground states to software logic.
* **Custom LCD Graphics:** Pushed custom hex arrays to the LCD's Character Generator RAM (CGRAM) to render the dinosaur and cactus sprites.

##  Getting Started

### Prerequisites
* Standard Device C Compiler (SDCC)
* An 8051 Emulator (e.g., EdSim51) or physical 8051 development board.
* 16x2 Character LCD
* 4x3 Matrix Keypad & 8-Button Bank

### Project Structure
* `preemptive.c` / `preemptive.h`: The core RTOS kernel, scheduler, and semaphore logic.
* `testlcd.c`: Main application logic, thread creation, and the inline-assembly game engine.
* `buttonlib.c` / `keylib.c`: Hardware abstraction layers for input parsing.
* `lcdlib.c`: Hardware abstraction for display rendering.

---
*Developed as an exploration of Operating System concepts on bare-metal hardware.*
