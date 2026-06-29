# Project 09: Analog Signal Scaling

## 1. Objective
To transition from discrete (ON/OFF) signals to continuous analog process control by reading a raw analog integer from a Level Transmitter and scaling it into real-world engineering units (Liters).

## 2. Core Concept Added
* **Analog Signal Processing:** Linear data transformation converting a raw 16-bit PLC input value (`INT`) into a continuous physical measurement (`REAL`).

## 3. System Parameters & IO Mapping

### Analog Input Mapping
| Physical Parameter | Sensor Range | PLC Channel | Raw Integer Range | Scaled Engineering Range |
| :--- | :--- | :--- | :--- | :--- |
| Tank Water Level | 4 - 20 mA | `%IW64` | `0` to `32767` (or `27648`) | `0.0` to `500.0` Liters |

### Discrete Output Mapping
| Component | PLC Address | Trigger Condition |
| :--- | :--- | :--- |
| High Level Pilot Light | `%Q0.0` | Scaled Level > 450.0 L |
| Low Level Pilot Light | `%Q0.1` | Scaled Level < 50.0 L |

## 4. Mathematical Formula
The linear scaling equation used in the logic:

$$Scaled\ Value = \left(\frac{Raw\ Input - Raw\ Min}{Raw\ Max - Raw\ Min}\right) \times (Eng\ Max - Eng\ Min) + Eng\ Min$$

## 5. Verification Metrics
* **0% Capacity (4mA):** Raw Input = `0`   --> Scaled Output = `0.0 L`
* **50% Capacity (12mA):** Raw Input = `16383` --> Scaled Output = `250.0 L`
* **100% Capacity (20mA):** Raw Input = `32767` --> Scaled Output = `500.0 L`

