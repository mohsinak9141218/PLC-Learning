# Project 03 – Conveyor Box Detector

## Overview

This project simulates a warehouse conveyor belt in CODESYS using ladder logic. The conveyor starts with a Start pushbutton, stops with a Stop pushbutton, and automatically stops when a photoelectric sensor detects a box at the end of the conveyor.

## Features

- Start/Stop control
- Seal-in (latching) circuit
- Photoelectric sensor interlock
- Automatic conveyor shutdown
- Safe restart only after the sensor is clear

## Variables

- `xStart`
- `xStop`
- `xPhotoEye`
- `xConveyor`

## Concepts Practiced

- Ladder Logic
- Digital Inputs & Outputs
- Seal-in Logic
- Sensor Interlocks
- Basic Conveyor Automation

## Factory Acceptance Testing (FAT) Verification
The control logic was simulated and validated inside the CODESYS environment using four distinct testing profiles. The verified state screenshots proving the logic execution can be found directly in the project files directory:

1. `01_test_idle_state.png` - Verifies system remains stable and off upon boot.
2. `02_test_successful_latch.png` - Verifies momentary start pulse successfully seals in the conveyor.
3. `03_test_sensor_interlock_trip.png` - Verifies blocking the photo-eye instantly drops the motor coil.
4. `04_test_startup_inhibited.png` - Verifies the system blocks startup commands while a box is present.
