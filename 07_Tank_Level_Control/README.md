# Project 07: Industrial Tank Level Control System

## Project Description
This project implements an automated process control sequence for a fluid holding tank in CODESYS. It moves away from discrete part-counting and introduces fundamental process automation. The system monitors fluid levels using physical high and low float switches, automatically managing a filling pump to maintain safe operational levels while preventing dry-run or overflow conditions.

This project is highly relevant to industrial fluid handling and water treatment processing layouts.

## New Concepts Learned
* **Process vs. Discrete Automation:** Transitioning from counting individual items to managing continuous fluid states and storage levels.
* **Hysteresis / Dual-Threshold Logic:** Using separate high and low boundaries to control a single output device (preventing a pump from rapidly cycling on and off at a single point).
* **Industrial Safety Interlocks:** Protecting system hardware (pumps) from running dry or overfilling using hardware-sensor priority logic.

## Process Flow
1. **System Enable:** Pressing the start controls enables the monitoring loop.
2. **Low-Level Threshold:** When the fluid drops below the **Low Level Sensor**, the system detects an empty condition and automatically activates the **Fill Pump**.
3. **Filling State:** The pump remains active as the fluid rises past the low sensor, maintaining operation via an internal latch.
4. **High-Level Threshold:** Once the fluid reaches the **High Level Sensor**, the tank is full. The system breaks the latch and instantly deactivates the **Fill Pump** to prevent overflow.
5. **Draw-Down State:** As fluid is drawn from the tank for processing, the pump remains OFF until the level drops completely back down to the low-level sensor, starting the cycle over.

## Hardware I/O & Tags

### Inputs
* `System_Enable` (BOOL) - Master switch to activate tank monitoring
* `Low_Level_Sensor` (BOOL) - Float switch indicating fluid is at or below minimum level
* `High_Level_Sensor` (BOOL) - Float switch indicating fluid has reached maximum capacity

### Outputs
* `Fill_Pump_Motor` (BOOL) - Controls the physical pump supplying fluid to the tank
* `Low_Alarm_Lamp` (BOOL) - Indicator indicating a near-empty tank condition
* `High_Alarm_Lamp` (BOOL) - Indicator indicating a completely full tank condition

---

## Simulation & Verification
