# Project 06: Automatic Batch Boxing Station

## Project Description
This project implements a multi-network batch counting and timing sequence in CODESYS. The system automates a factory line where bottles are transported via a conveyor belt, counted by a proximity sensor, packed into a box, and automatically diverted once the box reaches capacity. 

The primary objective of this project is to learn how to coordinate data across multiple rungs and handle time dependencies using functional blocks.

## New Concepts Learned
* **Up-Counters (`CTU`):** Tracking discrete physical events (sensor triggers) and using data values (`INT`).
* **On-Delay Timers (`TON`):** Introducing mechanical dwell times to account for physical equipment lag (pneumatics).
* **Multi-Network Interlocking:** Breaking down a continuous process into structured networks that dynamically latch, pause, and reset each other.

## Process Flow
1. **System Idle:** Pressing the `Master_Start` pushbutton latches the system active.
2. **Conveyor Operation:** The `Conveyor_Motor` runs automatically to feed bottles down the line.
3. **Bottle Counting:** A `Bottle_Sensor` increments a counter for every bottle that passes.
4. **Batch Limit Reached:** Once the 5th bottle is counted:
   * The conveyor stops immediately to prevent overflows.
   * The `Box_Full_Lamp` turns ON.
   * The pneumatic `Diverter_Gate` extends to prepare a fresh box.
5. **Dwell & Auto-Reset:** The system waits in this state for exactly 2 seconds. Once the timer finishes, the system automatically clears the count, retracts the gate, turns off the lamp, and restarts the conveyor.

## Hardware I/O & Tags

### Inputs
* `Master_Start` (BOOL) - Normally Open Start Pushbutton
* `Master_Stop` (BOOL) - Normally Closed Stop Pushbutton
* `Bottle_Sensor` (BOOL) - Proximity sensor detecting bottle passage

### Outputs
* `Conveyor_Motor` (BOOL) - Main conveyor belt motor drive
* `Diverter_Gate` (BOOL) - Solenoid for pneumatic box switching
* `Box_Full_Lamp` (BOOL) - Indicator panel light

---

## Simulation & Verification
*(Paste your CODESYS simulation screenshots here showing the logic state when the counter hits 5 and during the 2-second delay)*
