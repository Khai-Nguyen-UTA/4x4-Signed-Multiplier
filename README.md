# 4x4-Signed-Multiplier

This project consists of two primary Verilog modules:

MultiplierSigned: A top-level module that orchestrates multiplication using pipelined registers, a signed multiplier model, and display multiplexing.
MultiplierModelSigned: A module that performs signed multiplication on 4-bit inputs using an iterative approach, producing an 8-bit product.

# Features

4-bit Signed Multiplication: Handles multiplication for signed 4-bit Multiplier and Multiplicand inputs.
Pipeline Registers: Uses Parallel-In Parallel-Out (PIPO) registers for managing the pipeline of input data.
Multiplication Display: The final product of the multiplication is shown on a 7-segment display.
Control Signals: Uses a controller to manage states like Start, Add, and Shift during the multiplication process.
Error Checking: The system halts with a Halt signal if any issues occur during multiplication.

# MultiplierSigned
This module is the top-level module that instantiates submodules for managing the signed multiplication process and displaying the result. It takes the Clock, Reset, Multiplier, and Multiplicand inputs and outputs the Product and a ProductDisplay using a 7-segment display.

# Inputs:
Clock: Clock signal for synchronization.
Reset: Resets all registers and counters.
InQ0, InC0: Control signals for PIPO registers.
Clear: Clears the pipeline registers.
Multiplier [3:0]: 4-bit signed multiplier input.
Multiplicand [3:0]: 4-bit signed multiplicand input.
# Outputs:
ProductDisplay [0:6]: 7-segment display output for showing the product.
Product [7:0]: Final 8-bit product result.
CAT [3:0]: Control signals for multiplexing the display.
# Submodules:
PIPOregClass: Parallel-In Parallel-Out registers for both Multiplier and Multiplicand.
MultiplierModelSigned: Performs the core signed multiplication logic.
MultiplexedDandC: Handles 7-segment display multiplexing for showing the product and input values.

# MultiplierModelSigned
This module handles the actual signed multiplication using an iterative approach with an accumulator and shift operations.

# Inputs:
Clock: Clock signal.
Reset: Resets the accumulator, multiplier, and multiplicand registers.
Multiplicand [3:0]: 4-bit signed multiplicand input.
Multiplier [3:0]: 4-bit signed multiplier input.
# Outputs:
Product [7:0]: 8-bit product of the multiplication.
Halt: Indicates when the multiplication process has finished or encountered an issue.
# Internal Logic:
Registers: The module uses RegA (accumulator), RegQ (multiplier), and RegM (multiplicand) for the multiplication process.
Iteration Counter: A 2-bit counter tracks the number of multiplication iterations (up to 4).
Control Signals: Signals such as Start, Add, and Shift control the state of the multiplication process.
Signed Multiplication: The multiplication uses two's complement arithmetic for handling signed numbers, with a special case for subtracting the multiplicand when the most significant bit is 1.
Submodule:
MultController: A controller that manages the states (Start, Add, Shift) of the multiplication process.
How to Run
Compilation: Use a Verilog simulator such as ModelSim, VCS, or a hardware synthesis tool (e.g., Quartus) to compile and run the modules.

Simulation: Use testbenches to provide input signals to the MultiplierSigned module and observe the Product and ProductDisplay outputs.

Example Simulation Waveform
Set the Multiplier and Multiplicand inputs.
Observe the Product output after the clock cycles corresponding to the multiplication iterations.
Watch the 7-segment display output reflect the computed product.
Dependencies
PIPOregClass: Required for handling the pipeline registers.
MultController: Controls the flow of the multiplication process by managing Start, Add, and Shift signals.
MultiplexedDandC: Manages the display of the results on a 7-segment display.
License
This project is open-source and can be modified for educational or personal use
