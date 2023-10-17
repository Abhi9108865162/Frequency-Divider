# Frequency-Divider
# Top Module Name : PES_freqdiv

The process of designing and fabricating integrated circuits, commonly referred to as "design to tapeout," is a complex and highly structured sequence of steps

- Concept and Specification: This phase involves defining the high-level requirements and specifications for the integrated circuit (IC). This includes understanding the functionality, power, performance, and area constraints.

- Architecture and Microarchitecture: In this phase, engineers design the overall structure and functionality of the IC. This includes selecting the components, defining the data paths, and creating a high-level architectural diagram.

- RTL Design: Register-Transfer Level (RTL) design involves converting the high-level architecture into a detailed digital representation using hardware description languages like VHDL or Verilog.

- Functional Verification: Engineers perform extensive simulation and testing to ensure that the RTL design behaves as expected and meets the specified requirements.

- Synthesis: The RTL code is synthesized into a gate-level netlist, which represents the IC's functionality in terms of logic gates and flip-flops.

- Physical Design: This phase involves floor planning, placement, and routing. Engineers determine where each logic block should be located on the silicon wafer and how they should be interconnected.

- Design for Test (DFT): DFT techniques are implemented to ensure that the IC can be effectively tested for defects and faults during and after manufacturing.

- Static Timing Analysis: Engineers perform static timing analysis to ensure that signals propagate through the circuit within specified timing constraints.

- Power Analysis: Analyzing and optimizing power consumption is crucial to meet power targets and prevent overheating.

- Physical Verification: Checking for design rule violations, such as minimum feature sizes and spacing, to ensure that the design can be manufactured correctly.

- Mask Generation: The physical design is converted into photomasks, which are used in the semiconductor fabrication process.

- Foundry Fabrication: The semiconductor manufacturer (foundry) takes the photomasks and manufactures the IC on a silicon wafer through processes like photolithography, etching, and doping.

- Wafer Testing: Each wafer is tested to identify defects and ensure the functionality of the fabricated ICs.

- Packaging: The individual ICs are cut from the wafer and placed into packages. Wire bonding or flip-chip assembly connects the ICs to the package.

- Final Testing: After packaging, each IC is tested to ensure it meets the required specifications.

- Quality Control: Quality control measures are taken to ensure that the ICs meet the quality standards and that no defective units are shipped.

- Tapeout: The final step is preparing the design files for manufacturing, including the photomasks and any necessary documentation. These files are sent to the foundry for production.

This process is highly iterative, with design changes and optimizations occurring at various stages. It involves close collaboration between design teams, verification teams, and the foundry. The goal is to produce a functioning IC that meets the specified requirements and can be manufactured at scale.

## Main step  from Design to Tapeout 
1. Synthesis and GLS
2. Physical Design
3. GDS Tapeout

# Synthesis and GLS
Open Terminal

1
```
cd VLSI/sky130RTLDesignAndSynthesisWorkshop/verilog_files
```
2
```
iverilog PES_freqdiv.v PES_freqdiv_tb.v -o PES_freqdiv.out

```
3
```
./PES_freqdiv.out 
```
![Screenshot from 2023-10-17 17-00-37](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/75ff842f-6dc9-4634-8d92-72c91d816d11)

4
```
gtkwave PES_freqdiv_vcd.vcd
```
![Screenshot from 2023-10-17 17-03-18](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/cd7fa65a-d630-4c65-b2fb-66dbde784ef8)

5
```
~/VLSI/sky130RTLDesignAndSynthesisWorkshop/verilog_files$ yosys
```
![Screenshot from 2023-10-17 17-34-06](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/ebf7d73f-37f3-4ef0-ad77-9da37aa87786)


6

In yosys
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```
7
```
read_verilog PES_freqdiv.v
```
![Screenshot from 2023-10-17 17-36-05](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/98f348cc-3ce6-4e0e-9f03-d66881023a5a)


8
```
synth -top PES_freqdiv 
```
![Screenshot from 2023-10-17 17-37-37](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/d454392e-9618-44a0-abe3-b821d035b168)

9
```
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```
![Screenshot from 2023-10-17 17-42-02](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/db6a58a8-252e-4d39-a892-bc8b9bbbfca8)

10
```
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```
![Screenshot from 2023-10-17 17-43-48](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/57dda830-4d23-4dfe-9aa2-4a346f0570a3)

11
```
show
```
![Screenshot from 2023-10-17 17-45-10](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/04ae0e7f-8c3c-4ba0-ab79-e9adce2fb0a7)

12
```
write_verilog -noattr PES_freqdiv.v 
```
![Screenshot from 2023-10-17 17-50-21](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/704455dc-bb57-4e26-af34-16fb6ef58af3)






























13
```

```




































# RISC-V

## Course Details
<details>

<summary><b> DAY 1 - Introduction to RISC-V ISA and GNU compiler toolchain </b></summary>

+ Introduction to RISC-V basic keywords
  - Introduction
  - From apps to hardware
  - Description of content
+ Labwork for RISC-V software toolchain
  - C program to compute sum from 1 to n
  - RISC-V GCC compiles and disassembles
  - Spike simulation and debug
+ Integer number representation
  - 64-bit number system for unsigned numbers
  - 64-bit number system for signed numbers
  - Labwork for signed and unsigned numbers
  
</details>

<details>

<summary><b> DAY 2 - Introduction to ABI and basic verification flow </b></summary>

+ Application binary interface
  - Introduction to application binary interface
  - Memory allocation for double words
  - Load, add, and store instructions with examples
  - Concluding 32 registers and their respective ABI names
+ Labwork using ABI function calls
  - New algorithm for sum 1 to n using ASM
  - Review ASM function call
  - Simulate new C program with function cell
+ Basic verification flow using iverilog
  - Lab to run C program on RISC-V CPU

</details>

<details>

<summary><b> DAY 3 - Digital Logic with TL-verilog and Makerchip </b></summary>

+ Combinational logic in TL-Verilog using Makerchip
  - Welcome
  - Introduction To Logic Gates
  - Basic Mux Implementation And Introduction To Makerchip
  - Labs For Combinational Logic
+ Sequential logic
  - Introduction To Sequential Logic And Counter Lab
  - Sequential Calculator Lab
+ Pipelined logic
  - Pipelined Logic And Re-Timing
  - Pipeline Logic Advantages And Demo In Platform
  - Lab On Error Conditions Within Computation Pipeline
  - Lab On 2-Cycle Calculator
+ Validity
  - Introduction To Validity And Its Advantages
  - Lab On Validity And Valid When Condition
  - Lab To Compute Total Distance
  - Lab on 2-cycle Calculator with Validity
  - Calulator Single Value Memory Lab
+ Wrap-up
  - Introduction To Hierarchy Concept

</details>

<details>

<summary><b> DAY 4 - Basic RISC-V CPU micro-architecture </b></summary>

+ Introduction to Simple RISC-V Micro-architecture
  - Micro-architecture of Single Cycle RISC-V CPU
  - Starting Point Code for RISC-V Labs Part-1
  - Starting Point Code for RISC-V Labs Part-2
+ Fetch and decode
  - Implementation Plan and Lab for PC
  - Lab For Instruction Fetch Logic
  - Lab For RV Instruction Types IRSBJU Decode Logic
  - Lab For Instruction Immediate Decode Logic For RV-ISBUJ
  - Lab To Decode other Fields of Instructions For RV-ISBUJ
  - Lab To Decode Instruction Field Based on Instr Type RV-ISBUJ
  - Lab To Decode Individual Instruction
+ RISC-V control logic
  - Lab For Register File Read Part-1
  - Lab For Register File Read Part-2
  - Lab For ALU Operations For add/addi
  - Lab For Register File Write
  - Concept of Array And Register File Details
  - Lab For Implementing Branch Instructions
  - Lab For Completing Branch Instruction Implementation
  - Lab To Create Simple Testbench

</details>


<details>

<summary><b> DAY 5 - Complete Pipelined RISC-V CPU micro-architecture </b></summary>

+ Pipelining the CPU
  - Introduction To Control Flow Hazard And Read After Write Hazard
  - Lab To Create 3-Cycle Valid Signal
  - Lab To Code 3-Cycle RISC-V To Take Care Of Invalid Cycles
  - Lab To Modify 3-Cycle RISC-V To Distribute Logic
+ Solutions to Pipeline Hazards
  - Lab For Register File Bypass To Address Rd-After-Wr Hazard
  - Lab For Branches To Correct The Branch Target Path
  - Lab To Complete Instruction Decode Except Fence, Ecall, Ebreak
  - Lab To Code Complete ALU
+ Load/Store Instructions and Completing RISC-V CPU
  - Introduction To Load Store Instructions And Lab To Redirect Loads
  - Lab To Load Data From Memory To Register File
  - Lab To Instantiate Data Memory To The CPU
  - Lab To Add Stores And Loads To The Test Program
  - Lab To Add Control Logic For Jump Instructions
  - Wrap Up

</details>




# Course exercise


<details>
<summary><b> DAY 3 </b></summary>

## Digital Logic with TL-verilog and Makerchip
Digital Logic:
Digital logic refers to the design and implementation of digital circuits using logical gates, flip-flops, and other digital components to process and manipulate binary data. It is fundamental in creating digital systems, such as microprocessors, memory units, and various integrated circuits.

TL-Verilog:
Transaction-Level Verilog (TL-Verilog) is an extension of the Verilog hardware description language (HDL). TL-Verilog simplifies digital design by allowing designers to express high-level transaction-based functionality, making it easier to design and verify complex digital systems. It introduces concepts like pipelines and transactions, which help bridge the gap between high-level system descriptions and low-level RTL (Register Transfer Level) descriptions.

Makerchip:
Makerchip is an online integrated development environment (IDE) for digital design, simulation, and verification. It supports TL-Verilog, Verilog, and other hardware description languages. Makerchip provides a platform for designing digital circuits, simulating their behavior, and observing waveforms, making it an excellent tool for learning and experimenting with digital logic and TL-Verilog.

 work with TL-Verilog and Makerchip for digital logic design:

Design: Use TL-Verilog to describe your digital logic design at a higher level of abstraction. TL-Verilog's transaction-based approach allows you to focus on the functionality and behavior of your design without getting bogged down in low-level details.

Simulation: Use Makerchip's simulation capabilities to test and verify your TL-Verilog design. You can simulate how your digital circuit behaves under different conditions and inputs.

Debugging: Makerchip provides tools for debugging your designs. You can examine waveforms, signals, and transactions to identify and fix issues in your digital logic.

Collaboration: Makerchip often allows for collaborative design and sharing of projects. You can work on projects with others, making it a valuable tool for educational and team-based projects.

Learning: Makerchip and TL-Verilog are also excellent tools for learning digital design concepts. They simplify the design process and help students and beginners grasp digital logic principles more easily.
![Screenshot from 2023-10-09 20-09-49](https://github.com/Abhi9108865162/RISC-V/assets/141741065/c3ea1eb5-fd41-4d49-931e-864761d20eb8)
## Logic gates
Logic gates are fundamental components in digital electronics, serving as the building blocks for countless digital circuits. They perform logical operations on binary inputs (0 and 1) to produce binary outputs, making them essential in various applications. The AND gate, for instance, generates a 1 output only when all inputs are 1. Conversely, the OR gate outputs a 1 when at least one input is 1, while the NOT gate inverts its input. The XOR gate produces a 1 output if the number of 1 inputs is odd. NAND and NOR gates are complements of AND and OR gates, respectively. These gates, when combined and interconnected, form the basis of all digital systems. They are pivotal in constructing arithmetic units, memory cells, multiplexers, and other crucial components within computers and electronic devices, enabling the processing and manipulation of binary data with precision and efficiency.
![Screenshot from 2023-10-09 20-09-54](https://github.com/Abhi9108865162/RISC-V/assets/141741065/59765209-d230-4285-97e8-08e314a7bd0e)
## Combinational Circuit

Combinational logic is a type of digital logic that produces an output solely based on the current input values, with no regard for previous inputs or the circuit's state. In simpler terms, it's like a straightforward mathematical function: you give it some inputs, and it immediately gives you the result without remembering anything or waiting for a clock signal. This kind of logic is used in various digital applications, such as calculators, where the output depends only on the numbers and operations you enter, with no memory of previous calculations.

![Screenshot from 2023-10-09 20-16-09](https://github.com/Abhi9108865162/RISC-V/assets/141741065/9491afb0-9d57-42ae-a56a-950498e23ae3)
+ Adder
A full adder is a fundamental digital logic circuit used to perform binary addition with greater complexity than a half adder. It takes in three binary inputs: A, B, and a carry-in (Cin), and produces two outputs: a sum bit (S) and a carry-out (Cout). This additional carry-in input allows the full adder to handle the carry bit generated from previous stages of a multi-bit binary addition, making it suitable for more extensive arithmetic operations.
  
![Screenshot from 2023-10-09 20-26-00](https://github.com/Abhi9108865162/RISC-V/assets/141741065/8bc4af32-c787-4c3b-bfa5-8b355bb8ef1b)
## Boolean Operators
Boolean operators, also known as logical operators, are fundamental components of Boolean algebra and computer programming, playing a vital role in decision-making and logic. These operators include AND, OR, NOT, XOR, and others. The AND operator returns true (or 1) only if all of its operands are true. Conversely, the OR operator yields true if at least one operand is true. The NOT operator negates the truth value of its operand, transforming true into false and vice versa. XOR, or exclusive OR, delivers true when the number of true operands is odd. These operators serve as the cornerstone for constructing complex logical expressions, controlling program flow, and evaluating conditions in programming languages and digital circuits. They enable developers and engineers to create intricate decision trees, conditionally execute code, and implement sophisticated algorithms, underpinning the logic and functionality of software and hardware systems. Mastery of Boolean operators is essential for effective problem-solving and programming in various domains, from software development to digital circuit design.

![Screenshot from 2023-10-09 20-41-13](https://github.com/Abhi9108865162/RISC-V/assets/141741065/9c8449ac-b6b4-4ec6-8b5d-510009d7efad)

## MUX
A multiplexer, often abbreviated as "mux," is a simple digital circuit that allows you to select one of several input signals and route it to a single output. It is a fundamental building block in digital electronics and is used in various applications, including data routing, signal selection, and more.

A basic multiplexer has two main inputs:

 - Data Inputs (D0, D1, D2, ...): These are the input signals that you want to choose from.
 - Control Inputs (S0, S1, S2, ...): These inputs determine which data input is selected and sent to the output.

The number of data inputs and control inputs depends on the size of the multiplexer. For example, a 2-to-1 multiplexer has two data inputs and one control input, while a 4-to-1 multiplexer has four data inputs and two control inputs, and so on.

The output of the multiplexer is one of the data inputs, and it is determined by the binary value of the control inputs. The control inputs select which data input is passed to the output. The multiplexer works by using the control inputs to create a binary code that represents the selected input.

![Screenshot from 2023-10-09 22-19-50](https://github.com/Abhi9108865162/RISC-V/assets/141741065/8bc07044-039b-4f82-be58-24df47c2b1c4)
![Screenshot from 2023-10-11 22-23-24](https://github.com/Abhi9108865162/RISC-V/assets/141741065/7af25897-408e-4d23-94a7-cfc4dfb3fd84)

# LAB USING MAKERCHIP

![Screenshot from 2023-10-11 19-13-58](https://github.com/Abhi9108865162/RISC-V/assets/141741065/b49a2265-7631-46a7-b492-329717d1683c)
- Inverter
![Screenshot from 2023-10-11 20-00-21](https://github.com/Abhi9108865162/RISC-V/assets/141741065/055a8fc5-08d4-4edf-a4bf-0a03567117de)

```
"$out = ! $in1;"
```
![Screenshot from 2023-10-11 20-57-45](https://github.com/Abhi9108865162/RISC-V/assets/141741065/4c674317-2e19-4d0e-bb9e-185b05d4cab1)
- 2-input gate (Boolean operators)
![Screenshot from 2023-10-11 21-06-29](https://github.com/Abhi9108865162/RISC-V/assets/141741065/d39510b5-b578-48ad-8c4c-83b2f98b2c7d)

- Arithmetic
![Screenshot from 2023-10-11 21-58-49](https://github.com/Abhi9108865162/RISC-V/assets/141741065/73976680-9997-4f86-9882-9dad3fe29e5d)

- MUX
  ![Screenshot from 2023-10-11 21-59-55](https://github.com/Abhi9108865162/RISC-V/assets/141741065/aa4793c4-50c8-4385-b1b5-b6e1f0105df0)
![Screenshot from 2023-10-11 22-05-25](https://github.com/Abhi9108865162/RISC-V/assets/141741065/801c61e0-086f-41fa-a870-a920d2bea12f)
![Screenshot from 2023-10-11 22-07-19](https://github.com/Abhi9108865162/RISC-V/assets/141741065/ba661df7-33e6-4d1d-9586-85a3eacb80c8)
 - Combinational Calculator

Creating a combinational calculator in Verilog involves designing a digital circuit that performs arithmetic operations based on user input. In the provided Verilog code for a 4-bit calculator, a module named "calculator" takes two 4-bit binary inputs, A and B, along with a 2-bit operation selector (op), and produces a 4-bit output called "result." The combinational logic, defined in an "always @(*)" block, uses a case statement to determine the operation based on the op input. The code supports addition, subtraction, and multiplication operations, represented by 2-bit binary values 00, 01, and 10, respectively. If an invalid operation is selected, the result defaults to zero. To use this Verilog code, you would need a Verilog simulator or synthesis tool and a testbench for input and output validation. For a complete calculator, more operations, error handling, and user interface components would be necessary.

![Screenshot from 2023-10-11 22-17-40](https://github.com/Abhi9108865162/RISC-V/assets/141741065/1ab89a48-4459-4d8b-ad57-6862731ebe82)

![Screenshot from 2023-10-14 12-33-04](https://github.com/Abhi9108865162/RISC-V/assets/141741065/4793f5eb-dddd-4e8d-800b-fea18a5a64b4)


# Sequential Logic 

Sequential logic, in digital electronics, is a type of logic circuit or system in which the output not only depends on the current input values but also on the past history or state of the system. It introduces the concept of memory or feedback, which allows it to store and remember information over time. Sequential logic circuits are used to implement functions where the order of events and past inputs matter.

![Screenshot from 2023-10-12 21-26-23](https://github.com/Abhi9108865162/RISC-V/assets/141741065/a7f354d7-9db6-48c8-8137-b6dbd46b09e0)

## Sequential Logic - Fibonacci Series

A sequential logic circuit for generating a Fibonacci series is a hardware implementation that produces the Fibonacci sequence, a series of numbers where each number is the sum of the two preceding ones, typically beginning with 0 and 1. This circuit usually employs two D flip-flops, denoted as D1 and D2, connected in a cascading fashion. Both flip-flops are synchronized with a clock signal. The circuit initializes D1 with 0 and D2 with 1. The output of D1 is connected to the output of the circuit.

In operation, with each clock cycle, D1 takes on the value previously stored in D2, which represents the last Fibonacci number. Simultaneously, D2 computes the sum of D1 and its previous value, yielding the new Fibonacci number. The circuit's output provides the current number in the Fibonacci sequence. This process continues for subsequent clock cycles, extending the Fibonacci series. For instance, after several clock cycles, the circuit will produce values in the Fibonacci sequence such as 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.

![Screenshot from 2023-10-12 21-30-32](https://github.com/Abhi9108865162/RISC-V/assets/141741065/392a2277-95cd-44a2-a817-18be5aac91fe)

![Screenshot from 2023-10-12 21-32-11](https://github.com/Abhi9108865162/RISC-V/assets/141741065/1f6c9efd-f320-41be-aaf2-6467a84386a8)

## Sequential Logic - Counter

A sequential logic counter is a digital circuit that generates a sequence of binary numbers in a systematic and sequential manner. It is widely used in digital electronics and microprocessor systems for tasks such as counting events, addressing memory locations, or performing repetitive operations. The fundamental operation of a counter is to increment its current value by one on each clock cycle.

![Screenshot from 2023-10-12 21-39-07](https://github.com/Abhi9108865162/RISC-V/assets/141741065/c6d35ae7-a9da-4e5e-af06-6a6d1c97fb20)


##  Sequential Logic - Calculator
![Screenshot from 2023-10-14 12-27-37](https://github.com/Abhi9108865162/RISC-V/assets/141741065/dc0cd5ec-71e2-40e1-855b-d99b8e97580a)


 # LAB USING MAKERCHIP
 * Fibonnnaci Series 
![Screenshot from 2023-10-12 21-45-27](https://github.com/Abhi9108865162/RISC-V/assets/141741065/9b66f8ef-9f62-4e0b-8322-6f4140aa5a6d)

* Conuter
  
  ![Screenshot from 2023-10-14 09-43-20](https://github.com/Abhi9108865162/RISC-V/assets/141741065/b58fe347-4dff-4fad-8b12-ce965f5f18b0)



## Values in Verilog

In Verilog, 16'hF0 represents a 16-bit binary value, where F0 is a hexadecimal (base-16) value. Each character in the hexadecimal value represents 4 bits, so F0 corresponds to the binary value 11110000 in binary, which is 240 in decimal.

![Screenshot from 2023-10-12 21-49-21](https://github.com/Abhi9108865162/RISC-V/assets/141741065/aea0e957-36cd-46ff-aa36-9613a7bf79f0)
```
16'hF0: 1111000011110000
```


## Pipelined logic 

![Screenshot from 2023-10-12 21-55-40](https://github.com/Abhi9108865162/RISC-V/assets/141741065/d1897ffa-2d98-4505-a796-5da3e3dfb21b)

![Screenshot from 2023-10-12 21-55-51](https://github.com/Abhi9108865162/RISC-V/assets/141741065/6f6d986b-502d-431d-96ee-f3f8c8d38867)

![Screenshot from 2023-10-12 21-57-26](https://github.com/Abhi9108865162/RISC-V/assets/141741065/d5fa9018-a76e-48b3-83b4-f59c76ef6c8d)

![Screenshot from 2023-10-12 21-57-59](https://github.com/Abhi9108865162/RISC-V/assets/141741065/88da3f16-6590-4e6e-9b07-fa26b76d9b72)
![Screenshot from 2023-10-12 21-59-54](https://github.com/Abhi9108865162/RISC-V/assets/141741065/338bb0f2-2416-47d7-ba80-426c3dbdd2a7)
![Screenshot from 2023-10-12 22-00-43](https://github.com/Abhi9108865162/RISC-V/assets/141741065/4fca27b8-adae-4b4c-84d7-b0d8b4eb4027)

* Identifiers and Types
![Screenshot from 2023-10-14 10-47-21](https://github.com/Abhi9108865162/RISC-V/assets/141741065/345d4f81-6190-492d-a8f2-856590b944a8)


#  LAB USING MAKERCHIP
* Pythagorean Theorem Pipeline in MAKERCHIP
![Screenshot from 2023-10-14 10-34-57](https://github.com/Abhi9108865162/RISC-V/assets/141741065/651e683a-f3ea-432c-baeb-d8124c038533)
* Pipeline
  ![Screenshot from 2023-10-14 12-59-59](https://github.com/Abhi9108865162/RISC-V/assets/141741065/9a1f7345-8c5c-49bd-b191-1b26ad93cb11)
* 2-Cycle Calculator
  ![Screenshot from 2023-10-14 13-22-29](https://github.com/Abhi9108865162/RISC-V/assets/141741065/04b13a27-5bf4-4668-be48-9c6e8a5257d1)


## Validity
- validity
  In Verilog, the term "validity" typically refers to signals or flags that indicate whether the data on a particular signal or bus is valid and can be used or processed. These signals are often used in digital design and hardware description languages like Verilog to control the flow of data and ensure that operations occur only when the data is valid. Validity signals are essential for synchronization and ensuring that data is processed correctly in digital systems
![Screenshot from 2023-10-15 12-16-46](https://github.com/Abhi9108865162/RISC-V/assets/141741065/6151641b-a2df-4833-a678-b76a11d92f86)

  
- Clock Gating
Clock gating is a power-saving technique used in digital design, particularly in integrated circuits and Field-Programmable Gate Arrays (FPGAs). It involves selectively enabling or disabling the clock signal to specific portions of a circuit to reduce power consumption when those portions are not actively in use. Clock gating is a vital method to optimize power efficiency in modern electronic devices, as it allows designers to reduce dynamic power consumption.


1. Clock Signal: In most digital circuits, a clock signal is used to synchronize the operation of various components. The clock signal typically has a fixed frequency and duty cycle, which means it toggles at a regular rate regardless of whether the connected logic needs to perform any work.

2. Clock Gating Cell: A clock gating cell is a logic gate or circuit that can be used to gate (enable or disable) the clock signal. When the clock gating cell is enabled, it allows the clock signal to pass through to the associated logic or registers, allowing them to operate. When disabled, the clock signal is blocked.

3. Control Signal: A control signal is used to enable or disable the clock gating cell. This control signal is often generated based on the activity or conditions of the circuit. If the associated logic or registers need to perform work, the control signal enables the clock gating cell, allowing the clock signal to pass through. If there is no work to be done, the control signal disables the clock gating cell, effectively turning off the clock to that portion of the circuit.
![Screenshot from 2023-10-15 12-21-27](https://github.com/Abhi9108865162/RISC-V/assets/141741065/f71ccf5b-ac03-4d9f-9eab-2c648217f864)


#  LAB ON Validity USING MAKERCHIP 
-  2-cycle Calculator with Validity
![Screenshot from 2023-10-15 13-27-17](https://github.com/Abhi9108865162/RISC-V/assets/141741065/172d06ac-dd20-475b-a7ad-91ff9ae84f8d)

-  Calulator Single Value Memory Lab
![Screenshot from 2023-10-15 13-35-37](https://github.com/Abhi9108865162/RISC-V/assets/141741065/16d964b4-5c89-4941-97f5-0c1785756631)

-  To Compute Total Distance
![Screenshot from 2023-10-15 13-47-47](https://github.com/Abhi9108865162/RISC-V/assets/141741065/866b03e6-ebb7-4f54-8144-34da7b4ac482)


## Introduction To Hierarchy Concept 
![Screenshot from 2023-10-15 13-55-36](https://github.com/Abhi9108865162/RISC-V/assets/141741065/93cfe02d-884a-46c2-9bc1-efd5bedfc478)
![Screenshot from 2023-10-15 13-56-12](https://github.com/Abhi9108865162/RISC-V/assets/141741065/dc5fd1f0-9b86-4708-b033-8781d9c33478)






</details>



<details>

<summary><b> DAY 4 </b></summary>

#  Micro-architecture of Single Cycle RISC-V CPU

Microarchitecture and Instruction Set Architecture (ISA) are two fundamental aspects of computer architecture, but they serve different purposes and focus on different levels of abstraction in a computer system.  the key differences between microarchitecture and instruction set architecture:

-    Level of Abstraction:

       - Microarchitecture (µarch): Microarchitecture refers to the internal organization and design of a specific processor or CPU. It deals with the hardware implementation details, including how the CPU executes instructions, pipelining, memory hierarchy, and data paths. Microarchitecture is concerned with the low-level implementation of the CPU and its components.

       - Instruction Set Architecture (ISA): ISA, on the other hand, defines the set of instructions that a processor or CPU can execute, along with the registers and addressing modes available to software developers. It specifies the interface between software (compilers, assemblers, and programs) and the hardware (the microarchitecture). ISA is an abstract, user-visible model of the processor.

-    Purpose:

      -  Microarchitecture: Microarchitecture deals with the implementation details and optimization techniques used to execute instructions efficiently. It is primarily of interest to CPU designers and engineers who work on improving the performance and energy efficiency of the CPU.

      -  Instruction Set Architecture: ISA defines the interface that software developers interact with when writing programs. It ensures that software is compatible with a specific architecture, allowing programs to be written once and run on different CPUs with the same ISA. ISA is primarily of interest to software developers.

 -   Stability:

       - Microarchitecture: Microarchitecture can vary significantly between different processor generations, even within the same ISA family. Designers frequently make changes to the microarchitecture to improve performance or add new features. Microarchitectural details can change without affecting the compatibility of software.

        - Instruction Set Architecture: ISA is generally more stable and is designed to remain consistent within a processor family or architecture for an extended period. Software compatibility relies on the stability of the ISA. Changes to the ISA are relatively infrequent and require careful consideration and backward compatibility.

 -   Examples:

       - Microarchitecture: Examples include Intel's Skylake microarchitecture or ARM's Cortex-A series microarchitecture. These represent the internal design and organization of specific CPU models.

       - Instruction Set Architecture: Examples include the x86-64 ISA (used by many Intel and AMD processors) or the RISC-V ISA (an open standard). These define the set of instructions that software developers can use when writing programs.

 microarchitecture deals with the low-level details and the internal design of a specific processor, while instruction set architecture defines the interface and instructions available to software developers. ISA remains relatively stable, ensuring software compatibility, while microarchitecture can change frequently to optimize performance and energy efficiency.

![Screenshot from 2023-10-15 14-04-50](https://github.com/Abhi9108865162/RISC-V/assets/141741065/12f3858b-7902-44e7-bf34-5bfd3a6d32ea)


A single-cycle RISC-V CPU is a simplified design where each instruction is executed in a single clock cycle. This simple microarchitecture is useful for educational purposes and understanding the fundamental principles of CPU operation.

-  Instruction Memory (IMEM):
        Stores the program instructions.
        Fetches the instruction to be executed in the current clock cycle.

-  Program Counter (PC):
        Keeps track of the address of the next instruction to be executed.
        Incremented by 4 (the size of a RISC-V instruction) every clock cycle.

-  Instruction Decoder:
        Decodes the fetched instruction to determine the operation to be performed.
        Determines the source and destination registers.

- Register File:
        Contains a set of registers (e.g., 32 general-purpose registers in RISC-V).
        Read data from the source registers specified by the instruction.

-   ALU (Arithmetic Logic Unit):
        Performs arithmetic and logic operations on data.
        Receives data from the register file and performs the operation specified by the instruction.
-   Data Memory (DMEM):
        Stores data used by load and store instructions.
        The result of loads is read from this memory, and data to be stored is written to it.

-   Control Unit:
        Generates control signals for various components based on the instruction being executed.
        Controls the multiplexers, ALU, register writes, etc.


![Screenshot from 2023-10-15 18-31-13](https://github.com/Abhi9108865162/RISC-V/assets/141741065/fa6496e8-9366-4f27-a4ab-97a7e1e71846)

Link for the starter code [starter code](https://myth.makerchip.com/sandbox?code_url=https:%2F%2Fraw.githubusercontent.com%2Fstevehoover%2FRISC-V_MYTH_Workshop%2Fmaster%2Frisc-v_shell.tlv#) 

Codes for each step reported below can be found here [Day_4 Codes](https://github.com/Abhi9108865162/RISC-V/tree/main/Day_4)



# Lab
-
![Screenshot from 2023-10-15 18-18-27](https://github.com/Abhi9108865162/RISC-V/assets/141741065/22610ab0-d0ef-4bee-9959-c35ed1a03310)
![Screenshot from 2023-10-15 18-26-54](https://github.com/Abhi9108865162/RISC-V/assets/141741065/16c73251-2f4d-4ae6-95d7-46d0a351bf0e)

-
![Screenshot from 2023-10-15 18-27-08](https://github.com/Abhi9108865162/RISC-V/assets/141741065/8f4bafa8-795d-400e-87e6-40df8aacae14)
![Screenshot from 2023-10-15 18-29-27](https://github.com/Abhi9108865162/RISC-V/assets/141741065/8d829462-a66c-427e-bc18-706ce1b76342)

![Screenshot from 2023-10-15 18-37-51](https://github.com/Abhi9108865162/RISC-V/assets/141741065/5986c382-e68c-492e-aca8-e85670491229)


![Screenshot from 2023-10-15 18-59-13](https://github.com/Abhi9108865162/RISC-V/assets/141741065/acfd6a7f-3a5f-4585-be83-66788d4d7f57)

![Screenshot from 2023-10-15 19-05-34](https://github.com/Abhi9108865162/RISC-V/assets/141741065/9b52590f-c068-4cdc-8402-f6697ed3f208)


![Screenshot from 2023-10-15 19-08-35](https://github.com/Abhi9108865162/RISC-V/assets/141741065/2d2b27d1-c38c-48b9-a9d0-f8685322850f)

![Screenshot from 2023-10-15 19-08-41](https://github.com/Abhi9108865162/RISC-V/assets/141741065/efef730d-f931-4b53-996b-4e16296f8e6e)


![Screenshot from 2023-10-15 19-12-58](https://github.com/Abhi9108865162/RISC-V/assets/141741065/1b27a577-aa19-4613-b464-36fb0b06609e)

![Screenshot from 2023-10-15 19-16-53](https://github.com/Abhi9108865162/RISC-V/assets/141741065/babb5129-7726-496a-811e-a09378057dd6)

![Screenshot from 2023-10-15 19-19-40](https://github.com/Abhi9108865162/RISC-V/assets/141741065/a361a47e-46a6-49fd-92b9-a44f79b5e84f)

![Screenshot from 2023-10-15 19-21-01](https://github.com/Abhi9108865162/RISC-V/assets/141741065/fca41f9c-1778-455e-a174-f65425448a8c)


# 1. Program Counter

![Screenshot from 2023-10-15 21-51-30](https://github.com/Abhi9108865162/RISC-V/assets/141741065/77f0b823-e914-4d32-8603-12b77395e829)


# 2. Instruction Fetch

![Screenshot from 2023-10-15 21-54-38](https://github.com/Abhi9108865162/RISC-V/assets/141741065/e4dcc1dd-5bff-4497-ade3-5b5b8b306b3c)



# 3.Instruction Decode

![Screenshot from 2023-10-15 21-58-25](https://github.com/Abhi9108865162/RISC-V/assets/141741065/086f6cd6-35e9-4adc-b392-e5a226f890cd)


# 4. Instruction Decode with validity

![Screenshot from 2023-10-15 22-00-10](https://github.com/Abhi9108865162/RISC-V/assets/141741065/fa1bba81-0f70-4d2c-b6da-fe0de30856e3)


# 5. Individual Instruction decode

![Screenshot from 2023-10-15 22-01-34](https://github.com/Abhi9108865162/RISC-V/assets/141741065/ed49c16f-8af3-40e2-8ee9-08750a97369a)


# 6. Register file read

![Screenshot from 2023-10-15 22-03-28](https://github.com/Abhi9108865162/RISC-V/assets/141741065/81f24e20-77a5-45ce-b387-0c6ebb9ba375)


# 7. ALU

![Screenshot from 2023-10-15 22-06-15](https://github.com/Abhi9108865162/RISC-V/assets/141741065/d2449824-bf2a-4d44-b978-ef14faeef435)


# 8. Register File Write

![Screenshot from 2023-10-15 22-07-40](https://github.com/Abhi9108865162/RISC-V/assets/141741065/93868aa5-c141-4dd2-9d56-3d809ab8a5b3)



# 9. Branch Instructions

![Screenshot from 2023-10-15 22-09-26](https://github.com/Abhi9108865162/RISC-V/assets/141741065/9a7a2bcf-b0e0-45dc-ae35-48ca3f89ae3c)



## 10. Testbench to check functionality


![Screenshot from 2023-10-15 22-11-23](https://github.com/Abhi9108865162/RISC-V/assets/141741065/027c2ff4-5486-4eba-8b2e-efa69317620e)











































  
</details>



<details>

<summary><b> DAY 5 </b></summary>




  
</details>











