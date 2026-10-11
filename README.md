# RISC-V Single-Cycle RV32I Processor

A single-cycle RISC-V processor implemented in **SystemVerilog**, based on the RV32I instruction set architecture. This project demonstrates the fundamental components and operation of a processor in which each instruction completes in a single clock cycle.

## Project Overview

The processor is designed to demonstrate how a CPU fetches, decodes, and executes instructions using a single-cycle datapath and control unit.

The project includes the ALU, control unit, register file, instruction memory, data memory, immediate generator, program counter, top-level processor module, and testbench.

## Features

- RV32I-based 32-bit processor design
- Single-cycle datapath architecture
- Arithmetic and logical operations through the ALU
- Instruction decoding and control signal generation
- Register file for storing processor registers
- Immediate value generation
- Instruction and data memory modules
- Program counter for instruction sequencing
- Top-level processor integration
- Testbench for simulation and functional verification

## Project Structure

```text
RISC-V-Single-Cycle-RV32I/
│
├── alu.sv
├── control_unit.sv
├── data_mem.sv
├── imm_gen.sv
├── instr_mem.sv
├── program_counter.sv
├── reg_file.sv
├── rv32i_top.sv
└── rv32i_top_tb.sv
```

## Module Descriptions

| Module | Description |
|---|---|
| `alu.sv` | Performs arithmetic and logical operations. |
| `control_unit.sv` | Decodes instructions and generates control signals. |
| `data_mem.sv` | Provides data memory for load and store operations. |
| `imm_gen.sv` | Generates immediate values from instructions. |
| `instr_mem.sv` | Stores and provides processor instructions. |
| `program_counter.sv` | Holds the address of the current instruction. |
| `reg_file.sv` | Implements the processor's register file. |
| `rv32i_top.sv` | Connects the processor components into the complete datapath. |
| `rv32i_top_tb.sv` | Testbench used to simulate and verify the processor. |

## Architecture

The processor follows the basic single-cycle instruction execution process:

1. **Instruction Fetch:** The program counter selects an instruction from instruction memory.
2. **Instruction Decode:** The control unit interprets the instruction, and the register file provides source operands.
3. **Execute:** The ALU performs the required operation or calculates a memory address.
4. **Memory Access:** Data memory is accessed when required by a load or store instruction.
5. **Write Back:** The result is written to the destination register when required.
6. **PC Update:** The program counter advances to the next instruction or selects a branch or jump target, depending on the implemented control logic.

Each instruction completes in one clock cycle, although the maximum clock frequency depends on the combined delay of the datapath components.

## Tools and Technologies

- **Hardware Description Language:** SystemVerilog
- **Architecture:** RISC-V RV32I
- **Design:** Single-cycle processor
- **Verification:** SystemVerilog testbench
- **Simulation:** Use a compatible simulator, such as QuestaSim, ModelSim, or Icarus Verilog where supported.

## Running the Simulation

1. Clone or download this repository.
2. Open the project in a SystemVerilog-compatible simulator.
3. Add all source files and the testbench to the simulation.
4. Compile the design.
5. Set `rv32i_top_tb` as the simulation top module.
6. Run the simulation and inspect the output or waveform.

For example, with a compatible Icarus Verilog installation:

```bash
iverilog -g2012 -s rv32i_top_tb -o riscv_sim *.sv
vvp riscv_sim
```

If your simulator does not support a particular SystemVerilog feature, use a compatible simulator or adjust the compilation settings.

## Learning Objectives

This project helps develop an understanding of:

- RISC-V instruction execution
- CPU datapath and control unit design
- Register-based computation
- ALU operations
- Instruction and data memory
- Hardware design using SystemVerilog
- Simulation and testbench-based verification

## Future Improvements

- Expand instruction-level test coverage.
- Add waveform-based verification.
- Verify supported RV32I instructions against the official specification.
- Add FPGA synthesis and implementation.
- Measure timing and resource utilization.

## Author

**Ahmed Raza**

GitHub: [@ahmedraza9605](https://github.com/ahmedraza9605)

## License

This project is available for educational and learning purposes. Add a specific open-source license if you want to formally define permissions for reuse and redistribution.
