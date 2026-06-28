# Project 08: Pump Alternation Control (Lead & Lag)

## Project Description
This project implements a dual-pump alternation strategy (often called Lead/Lag control) in CODESYS. In industrial utility systems, running a single pump continuously causes uneven mechanical wear and premature failure. This project introduces the automation logic required to balance runtime hours by alternating the primary ("lead") pump role between two assets every time a cycle runs, while keeping the secondary ("lag") pump ready as a backup.

This is a critical strategy used in industrial water processing, HVAC chilled water loops, and wastewater lift stations.

## New Concepts Learned
* **Wear Leveling / Duty Cycling:** Writing logic to evenly distribute operational stress across multiple hardware assets.
* **Alternation Toggle Logic:** Using internal memory flags (flip-flops) to swap system roles dynamically upon cycle completion.
* **Lag Pump Staging:** Implementing conditional backup logic to activate a secondary asset if a single pump cannot meet process demand or if a fault occurs.

## Process Flow
1. **System Demand Active:** A call for system operation is triggered (e.g., a tank needs to be drained or pressure drops).
2. **First Cycle (Pump 1 Lead):** The system starts, designating Pump 1 as the "Lead" pump to meet the demand. Pump 2 remains idle.
3. **Cycle Reset & Toggle:** Once the demand is satisfied and the system shuts off, an internal memory flag toggles.
4. **Second Cycle (Pump 2 Lead):** On the next call for operation, the logic checks the toggle flag and runs Pump 2 as the "Lead" asset, leaving Pump 1 idle.
5. **Lag Backup Condition:** If the demand remains unsatisfied for a prolonged period while the lead pump is running, the "Lag" pump automatically kicks in to assist, running both pumps simultaneously until the condition clears.

## Hardware I/O & Tags

### Inputs
* `System_Demand` (BOOL) - Trigger signal requiring pump operation (e.g., from a pressure switch or level sensor)
* `Backup_Required` (BOOL) - High-demand sensor indicating the primary pump needs assistance

### Outputs
* `Pump_1_Motor` (BOOL) - Controls the physical motor starter for Pump 1
* `Pump_2_Motor` (BOOL) - Controls the physical motor starter for Pump 2
* `Alternation_Status_Lamp` (BOOL) - Indicator displaying which pump is currently designated as the primary asset

---

## Simulation & Verification
*(screenshots here showing Pump 1 running on cycle one, Pump 2 running on cycle two, and both pumps running during a high-demand lag condition)*
