# Project 04 – Dual-Station Pump Control

## Overview
This project simulates a dual-station water pump control system in CODESYS using ladder logic. It allows an operator to safely start or stop a single pump from two independent physical locations: the Control Room (Local) or the Field Station (Remote).

## Features
* **Dual-Station Start:** Start the pump from either the Local or Remote station via parallel branching.
* **Dual-Station Stop:** Stop the pump from either location using Normally Closed (NC) contacts in series.
* **Stop Priority / Fail-Safe:** If both start and stop buttons are pressed simultaneously, the stop command always overrides and cuts power to the coil (Stop-Dominant Logic).

## Variables Used
* `xStart_Local` (BOOL) - Control Room Start Pushbutton (Normally Open)
* `xStop_Local` (BOOL) - Control Room Stop Pushbutton (Normally Closed)
* `xStart_Remote` (BOOL) - Field Station Start Pushbutton (Normally Open)
* `xStop_Remote` (BOOL) - Field Station Stop Pushbutton (Normally Closed)
* `xPump` (BOOL) - Pump Contactor Coil / Latching Contact

## What I Learnt
* **Why NC is used for Stop:** I figured out that real-world Stop buttons are Normally Closed. In the simulator, this means they pass power by default when they are `FALSE`, and break the circuit only when they are tripped or pressed (`TRUE`).
* **Series vs. Parallel Rules:** Putting start buttons in parallel creates an OR condition (either can start it). Putting stop buttons in series creates a chain where *any* button can break the circuit.
* **Stop Priority:** I learned that as long as the Stop buttons are in series with the line, it doesn't matter where they are placed—if you hit Start and Stop at the same time, Stop always wins and kills the pump safely.
* **Testing Tricks:** Learned how to use `Ctrl + F7` in CODESYS to write values and freeze the screen so I can easily take screenshots without rushing.

## Test Cases & Verification
The logic was fully verified in the CODESYS simulator using the following three critical test states:

1. **`01_idle_state.png`**: Verifies the system starts safely with all inputs at `FALSE` and the pump turned off.
2. **`02_pump_latched.png`**: Verifies that pressing and releasing either start button successfully seals the circuit, keeping `xPump` active (`TRUE`).
3. **`03_stop_priority.png`**: Verifies fail-safe operations by forcing a conflict (Start and Stop pressed at the same time). The stop command successfully breaks the circuit and overrides the run command.
