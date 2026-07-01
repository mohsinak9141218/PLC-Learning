# Project 06: Basic Bottle Counter

## 📋 Project Overview
This project implements an event-driven industrial batch processing and packaging line control system. The objective is to monitor a continuous product stream (bottles), accurately count passing units using a high-speed proximity sensor, halt execution instantly when a target batch size is achieved, actuate secondary packaging mechanics, and execute an automatic reset/restart cycle seamlessly in one PLC scan cycle.

This design illustrates critical production plant floor concepts: **preventing material jams via output interlocking** and **handling cyclic automation sequences without operator intervention**.

## 🏗️ System Architecture & I/O Mapping

### Physical Field Inputs
* `I_Master_Start` (BOOL): Normally Open (NO) momentary pushbutton to energize system control loops.
* `I_Master_Stop` (BOOL): Normally Closed (NC) momentary pushbutton mapped as a hardware-level master execution interrupt.
* `I_Bottle_Sensor` (BOOL): Photoelectric proximity sensor yielding a high signal (`TRUE`) upon optical beam break.

### Physical Field Outputs
* `Q_Conveyor_Motor` (BOOL): Main line drive motor.
* `Q_Diverter_Gate` (BOOL): Pneumatic/Solenoid box swap actuator.
* `Q_Box_Full_Lamp` (BOOL): Panel indicator light for plantfloor operators.

### Internal Primitives & Function Blocks
* `Bottle_Counter` (`CTU`): Standard IEC 61131-3 Up-Counter.
* `Batch_Reset_Timer` (`TON`): On-Delay timer governing mechanical stroke clearance time.

---

## ⚙️ Control Philosophy & Logic Execution

The program executes across four distinct deterministic processing phases visually mapped on the Ladder canvas:

1. **System Control Latch:** Employs a dominant-reset memory circuit utilizing the NC Stop switch logic to protect the execution state (`M_System_Run`).
2. **Deterministic Counting Engine:** Instantiates the `CTU` block. The `I_Bottle_Sensor` is fed directly to the `.CU` counter input pin, utilizing the block’s inherent input rising-edge detection. Counting is strictly interlocked with `M_System_Run`.
3. **Mechanical Dwell Timer:** Once the live counter accumulation (`.CV`) matches the batch limit (`PV = 10`), output `.Q` triggers the 3-second delay timer (`TON`). This provides the required mechanical window for the pneumatic pusher to cycle.
4. **Output & Interlock Layer:** * **Crucial Plant Interlock:** An NC contact of `M_Batch_Complete` is placed in series with the motor coil to break the circuit immediately when 10 bottles are reached, preventing upstream product pile-up.
   * **Self-Resetting Feedback Loop:** The expiration of the `TON` timer (`.Q` going high) feeds straight back into the counter's Reset (`.R`) pin, dropping all output flags and clearing the runtime state in a single PLC scan step.

---

## 💻 Source Code Verification
The logic is built visually in **Ladder Diagram (LD)**. The exported XML metadata configuration can be found in the accompanying `06_Basic_Bottle_Counter.xml` file within this directory.
