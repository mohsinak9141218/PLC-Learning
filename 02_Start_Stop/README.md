# Start Stop Motor Control

Built in CODESYS V3.5 using Ladder Logic.

## Objective

The goal of this project was to create a basic motor start-stop circuit and understand how a seal-in (latching) circuit works in PLC programming.

## Tags Used

* START - Start pushbutton
* STOP - Stop pushbutton
* MOTOR - Motor output

## Logic

The motor starts when the START button is pressed.

A MOTOR contact is connected in parallel with the START contact. Once the motor turns ON, this contact closes and keeps the motor running even after the START button is released.

The motor stops only when the STOP button is pressed.

## Testing

### Test 1

START = TRUE

Result: MOTOR turned ON.

### Test 2

START = FALSE

Result: MOTOR remained ON.

### Test 3

STOP = TRUE

Result: MOTOR turned OFF.

### Test 4

STOP = FALSE

Result: MOTOR remained OFF until START was pressed again.

## What I Learned

* Difference between NO and NC contacts
* How PLC tags store values
* Difference between contacts and coils
* Series (AND) and Parallel (OR) logic
* How seal-in / holding / latching circuits work

## Files

* START_STOP.project
* ladder.png
* motor_running.png
* motor_stopped.png
