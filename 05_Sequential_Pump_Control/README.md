# Project 05 – Sequential Pump Control

## Overview
This project simulates a sequential two-pump control system in CODESYS using ladder logic and a built-in timer. In many factories, turning on multiple big pumps at the exact same time can overload the power grid or damage the pipes. This logic solves that by starting the second pump automatically after a short delay.

## Features
* **Automatic Sequence:** When you press the Start button, Pump A turns on immediately.
* **On-Delay Timer:** A TON (Timer On Delay) block counts down for exactly 5 seconds.
* **Delayed Startup:** Once the 5 seconds are up, Pump B automatically turns on by itself.
* **Master Stop:** Pressing the Stop button at any time drops the latch and shuts off both pumps instantly.

## Variables Used
* `xStart` (BOOL) - Master Start Pushbutton (Normally Open)
* `xStop` (BOOL) - Master Stop Pushbutton (Normally Closed)
* `xPump_A` (BOOL) - Lead Pump Coil (Starts immediately)
* `xPump_B` (BOOL) - Lag Pump Coil (Starts after 5-second delay)
* `fbTimer` (TON) - CODESYS Timer Function Block instance to handle the delay

## What I Learnt
* **How TON Timers Work:** I learned how to use an On-Delay Timer (`TON`). It starts counting the moment its input (`IN`) gets power, and its output (`Q`) snaps on only after the preset time (`PT`) finishes.
* **CODESYS Time Formats:** I learned that you can't just type a number for time in CODESYS; you have to write it in a specific format like `T#5s` for a 5-second delay.
* **Interlocking Outputs:** I figured out how to use the running status of Pump A to trigger the timer. This ensures Pump B can never run unless Pump A successfully started first.

## Test Cases & Verification
The logic was verified in the CODESYS simulator using the following three states:

1. **`01_idle_state.png`**: The system is off. All variables are `FALSE`, and both pumps are dead.
2. **`02_pump_a_running.png`**: Right after pressing Start, Pump A turns blue (`TRUE`), and the timer starts ticking, but Pump B is still `FALSE`.
3. **`03_sequence_complete.png`**: After 5 seconds pass, the timer finishes counting. Both Pump A and Pump B are now blue (`TRUE`) and running together.
