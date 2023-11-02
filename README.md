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

# Frequency Divider

A frequency divider is a digital circuit or component that takes an input signal, typically a clock or a periodic signal, and produces an output signal with a lower frequency. It's a fundamental building block in digital electronics and is often used in various applications, including digital counters, clock signal generation, and frequency scaling.

Frequency dividers are designed to reduce the frequency of the input signal by a fixed ratio or factor. Common division ratios include 2 (divide by 2), 4 (divide by 4), 8 (divide by 8), and so on, but other ratios are also possible. The output signal produced by a frequency divider typically has a square wave or pulse-like shape.

few common use cases for frequency dividers

  - Clock Generation: Frequency dividers are often used to generate clock signals with specific frequencies for different components within a digital system. For example, a CPU might require a clock signal with a lower frequency than the system clock, and a frequency divider can be used to derive this lower-frequency clock.

  - Counters: Frequency dividers can be used as building blocks for digital counters, which count the number of clock cycles or events. By cascading multiple frequency dividers with different division ratios, you can create counters that count to specific values.

  - Data Synchronization: In digital communication systems, frequency dividers can be used to ensure that data signals are sampled at the correct rate, making it easier to synchronize data transfer between devices.

  - PWM Generation: In applications like motor control or LED dimming, pulse-width modulation (PWM) signals are often generated using frequency dividers to control the duty cycle and achieve the desired output.

Frequency dividers can be implemented in various ways, such as using flip-flops, counters, or more complex digital logic. The specific implementation depends on the desired division ratio, speed requirements, and the available resources in the digital system.

Frequency dividers are essential components in digital design and are used in a wide range of electronic devices and systems to manage and manipulate timing and control signals.

<details>
<summary> RTL synthesis and GLS simulation: </summary>

# Code for Frequency Divider
```
module PES_freqdiv(en,clkin,n,clkout);

input clkin;
input [3:0]n;
input en;
reg [3:0]pc;
reg [3:0]nc;
output clkout;

always@(posedge clkin)
begin
if(en==1)
begin
  if(pc<(n-1))
	pc<=pc+1;
  else
	pc<=0;
end
else
 pc<=0;
end

always@(negedge clkin)
begin
if(en==1)
begin
  if(nc<(n-1))
	nc<=nc+1;
  else
	nc<=0;
end
else
  nc<=0;
end

assign clkout=(n%2==0)?(pc<n/2):((pc<(n/2)+1)&&(nc<(n/2)+1));
endmodule
```
# Code for Testbench Frequency Divider
```
`timescale 1ns/1ps
module PES_freqdiv_tb;

reg clk;
reg en;
reg [3:0]n;
wire clkout;

PES_freqdiv f1(en,clk,n,clkout);

initial
begin
clk=0;
en=0;
n=3;
$dumpfile ("PES_freqdiv_vcd.vcd"); 
$dumpvars(0,PES_freqdiv_tb);


forever
#10 clk=~clk;

end


initial
begin
#40 en=1;
#340 n=4; 
#440 n=11;
#1100 n=6;
#640 $finish;

end 
endmodule

```
# Schematic RTL Using Vivado
![image](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/485b68d6-c357-4be1-a3e3-d744eaf3f79a)

# Schematic Synthesis Using Vivado
![image](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/a3ccda66-0f19-4ce5-9a1c-2a9ea6859a98)
# Schematic Run Simulation Using Vivado
![image](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/29cdb0fe-9a10-45d8-81d5-507a5165efcd)

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
![Screenshot from 2023-10-21 11-30-52](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/3dd5aee5-8d1d-40e4-ab3e-057798b356df)

![Screenshot from 2023-10-21 11-31-00](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/02b3eafd-cef8-40e3-8187-cf33c7bc5303)


9
```
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```
![Screenshot from 2023-10-21 11-32-57](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/92666567-6eca-4fb9-a551-49ce11b0c1c3)

10
```
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```
![Screenshot from 2023-10-21 11-33-31](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/8097d160-8131-4477-a48d-e7eb1bd0a842)

11
```
show
```
![Screenshot from 2023-10-21 11-34-23](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/53533fb3-b34c-4633-9adb-632b06cb790b)

12
```
write_verilog -noattr PES_freqdiv_netlist.v
```
13
```
exit
```
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

# Comparing the Output before and after GLS.
## Before GLS
![Screenshot from 2023-10-21 11-47-02](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/a06e7446-8212-43c4-bfcf-256607bc5923)

## After GLS
![Screenshot from 2023-10-21 11-47-14](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/9696234a-9fe3-411e-9f06-31f3d0e5dcf2)

</details>

<details>
<summary> Openlane Tool Installation </summary>




 
</details>


<details>
<summary> Physical design </summary>



 
</details>

