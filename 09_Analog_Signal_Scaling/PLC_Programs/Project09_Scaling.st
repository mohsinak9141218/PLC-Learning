(* ==========================================
   NETWORK 1: LINEAR ANALOG INPUT SCALING
   Maps raw integer channel %IW64 to 0.0 - 500.0 Liters
   ========================================== *)

// Bound raw input to handle overflow/underflow cleanly
IF Raw_Analog_Input < 0 THEN
    Raw_Analog_Input := 0;
ELSIF Raw_Analog_Input > 32767 THEN
    Raw_Analog_Input := 32767;
END_IF;

// Linear Scaling: Y = (X / 32767.0) * 500.0
Scaled_Tank_Level := (INT_TO_REAL(Raw_Analog_Input) / 32767.0) * 500.0;


(* ==========================================
   NETWORK 2: STATUS INDICATOR FLAGS
   ========================================== *)

// High Level Limit Indicator
IF Scaled_Tank_Level >= 450.0 THEN
    High_Level_Lamp := TRUE;
ELSE
    High_Level_Lamp := FALSE;
END_IF;

// Low Level Limit Indicator
IF Scaled_Tank_Level <= 50.0 THEN
    Low_Level_Lamp := TRUE;
ELSE
    Low_Level_Lamp := FALSE;
END_IF;
