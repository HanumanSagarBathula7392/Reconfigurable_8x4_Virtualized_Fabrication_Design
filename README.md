# Reconfigurable 8x4 Virtualized Fabrication Design
## Overview

This repository contains the design and simulation code for a Reconfigurable 8x4 Virtualized Fabrication, structured into separate modules for key components. The project includes:

- Computational Unit (CU)

- 4x1 Multiplexer (MUX 4x1)

- Register Module (REG_D)

- Overall design and test cases

## Components

### [Computational_Unit (CU_6)](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/tree/master/Computational_Unit)

The core processing element of the fabric.

- Inputs: Two 4-bit operands (A and B) and a 5-bit select signal (SEL)
- Output: 4-bit result (O)
- Supports 24 different operations, including logical, arithmetic, and comparison operations

### [Multiplexer (MUX4X1)](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/tree/master/Multiplexer_(MUX))

A 4-to-1 multiplexer used to select input sources for each CU.

- Inputs: Four 4-bit inputs (A, B, C, D) and a 2-bit select input (Sel)
- Output: Selected 4-bit input (Z)

### [Register_Module (REG_D)](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/tree/master/Register_Module)

D-type register with write enable functionality.

- Inputs: Data input (D), Write enable (W_EN), and Clock (CLK)
- Output: Stored data (Q)

### [Top_Module](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/tree/master/Top_Module)

The main module that interconnects all components to form the Reconfigurable computational fabric.

- Implements the 8x4 logical structure using a 4x4 physical fabric
- Manages data flow and interconnections between CUs
- Handles input/output operations and control signals with registers

## Key Features

1. Virtualization: Implements an 8x4 logical structure using a 4x4 physical fabric
2. Flexible computation: Allows complex operations to be broken down and executed across multiple CUs
3. Multiple passes: Enables iterative computations through feedback connections
4. Configurable operations: Each CU can be programmed to perform different operations


## File Structure

- [Computational_Unit (CUF.vhd)](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/blob/master/Computational_Unit/CUF.vhd): Implementation of the CU_6 entity
- [Multiplexer (MUX4X1.vhd)](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/blob/master/Multiplexer_(MUX)/MUX4X1.vhd): Implementation of the MUX4X1 entity
- [Register_Module REG.vhd](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/blob/master/Register_Module/REG.vhd): Implementation of the REG_D entity
- [Overall Design (TopModule.vhd)](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/blob/master/Top_Module/TopModule.vhd): Main module interconnecting all components
- [Project_Report.pdf](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/blob/master/Project_Report.pdf): Detailed design documentation and test cases

## License
This project is open-source and available under the [MIT License](https://github.com/HanumanSagarBathula7392/HanumanSagarBathula7392/blob/main/LICENSE).

**Developed by:** Hanuman Sagar Bathula. <br>
**Tech Used:** VHDL, Xilinx Vivado/QuestaSim, FPGA, Reconfigurable Computing, Datapath, Instruction and Data Memory.

## Contributions
Contributions are welcome! Feel free to open issues and submit pull requests.

## Contact
For any queries, reach out via [GitHub issues](https://github.com/HanumanSagarBathula7392/Reconfigurable_8x4_Virtualized_Fabrication_Design/issues).

