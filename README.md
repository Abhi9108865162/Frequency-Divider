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
write_verilog -noattr PES_freqdiv_netlist.v
```
13
```
exit
```
![Screenshot from 2023-10-18 15-42-27](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/fa91d45d-da86-4d4e-94ad-7e257aae6716)



14
```
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v PES_freqdiv_netlist.v PES_freqdiv_tb.v 
```

15
```
./a.out
```

16
```
gtkwave PES_freqdiv_vcd.vcd
```
![Screenshot from 2023-10-18 15-47-35](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/394c50c2-0223-4fef-8aff-9aad9679d5a9)

![Screenshot from 2023-10-18 15-45-24](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/f8c863f5-52aa-4b7a-a5ac-01d4224fac59)

