# Frequency-Divider
# Top Module Name : PES_freqdiv
<details>
<summary>  Tool Installtion Required for RTL synthesis and GLS simulation 
</summary>

# Tools Used in RTL to GLS flow are:

 - **iVerilog -** IVERILOG is a free and open-source Verilog simulation and synthesis tool. It's part of the Icarus Verilog project, which aims to provide a full-featured and high-performance Verilog simulation and synthesis environment.Icarus Verilog is a simulator tool to check the design with the help of test bench. The design is nothing but the Verilog hardware description language code which specifies the functionality. The testbench is the setup to apply stimulus to test the functionality of the design. This simulator looks for the changes to the input. Upon changes to the input, the output is evaluated.

 - **GTKwave -** GTKWave is a free and open-source waveform viewer. It's used primarily in digital design and verification to display simulation results generated by digital simulation tools like Icarus Verilog (which includes IVERILOG).

 - **Yosys -** Yosys is an open-source framework for Verilog RTL synthesis. It's widely used in digital design for converting high-level descriptions of a digital circuit into a gate-level representation. In other words, it helps in transforming a behavioral description (written in a language like Verilog) into a netlist, which is a detailed representation of the digital logic in terms of gates and their interconnections.

1) **GTKWAVE:**

- Steps to install gtkwave

```sh
> sudo apt update
> sudo apt install gtkwave
```

2) **YOSYS:**

- Steps to install Yosys

```sh
> git clone https://github.com/YosysHQ/yosys.git
> cd yosys
> sudo apt install make (If make is not installed please install it) 
> sudo apt-get install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
    graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev
> make config-gcc
> make 
> sudo make install
```




 
</details>


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

1. Installation of required package
```
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y build-essential python3 python3-venv python3-pip make git
```
2. Uninstall all conflicting packages
```
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

```
2. Set up Docker
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
3. Install
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
4. Sudo docker run
```
sudo docker run hello-world
```
5. Making docker available without root
```
sudo groupadd docker
sudo usermod -aG docker $USER
sudo reboot # REBOOT!

```
6. Check docker installation
```
# After reboot
docker run hello-world
```
7. Download and install OpenLane   
```
git clone --depth 1 https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane/
make
make test
```

 
</details>


<details>
<summary> Physical design </summary>

	
 # Physical Design
	
ASIC (Application-Specific Integrated Circuit) physical design refers to the process of creating the physical layout of an integrated circuit that is tailored for a specific application or function. It involves defining the precise placement and routing of transistors, interconnects, and other components on a semiconductor wafer. This phase ensures that the ASIC meets performance, power, and area requirements. Key steps in ASIC physical design include floorplanning, placement, routing, and verification to ensure the final chip functions as intended within the constraints of the target application.
## Step in Physical Design

- Floorplanning: Floorplanning is the initial step in physical design where you define the approximate locations and sizes of various blocks and components on the chip. It sets the overall framework for the chip's layout.

- Placement: Placement involves determining the exact positions of individual components, such as logic cells and memory elements, within the defined floorplan. Good placement is critical for meeting performance and area requirements.

 -  Routing: Routing is the process of establishing the physical connections (wires and metal tracks) between the placed components while adhering to design rules. This stage ensures that signals can flow between components efficiently and without interference.

-  Clock Tree Synthesis (CTS): CTS is a specialized step that focuses on distributing clock signals to various parts of the chip to ensure synchronous operation. It optimizes the clock network to minimize clock skew and maintain timing integrity.

-  Power Planning: Power planning involves designing the distribution of power and ground networks to ensure that all components receive adequate power and minimize power consumption.

-  Signal Integrity Analysis: Signal integrity analysis assesses the quality of electrical signals, checking for issues like noise, crosstalk, and other distortions that can affect the reliability of the chip.

- Timing Analysis: Timing analysis is a crucial step for ensuring that the chip meets its performance requirements. It verifies that signals propagate within specified time limits and that the design meets the required clock frequencies.

-  Design for Testability (DFT): DFT techniques are integrated into the design to enable efficient testing of the ASIC after it is manufactured. This includes adding test circuits and scan chains to facilitate fault detection and diagnosis.

- Physical Verification: Physical verification checks the layout against design rules, such as minimum feature size and spacing, to ensure that the chip can be reliably manufactured and is free of errors that could lead to failures.

- Package Design: The package design stage involves creating the physical package that houses the ASIC. This package connects the chip to the outside world and provides protection and thermal management.

# Automatic flow openlane
```
cd OpenLane
sudo make mount
./flow.tcl -design PES_freqdiv
```

![Screenshot from 2023-11-02 19-17-34](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/70e0744a-8ae8-4568-939a-b5f3f4112703)
![Screenshot from 2023-11-02 19-17-46](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/270ab375-7e43-4190-aad4-991989e54243)
![Screenshot from 2023-11-02 19-17-55](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/af5bc70b-9953-4606-8bea-c966434e3dfe)
![Screenshot from 2023-11-02 17-02-04](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/7d1eb598-9fb8-437c-b5e1-7ee858d6e228)


# Interactive flow openlane
```
cd OpenLane
sudo make mount
./flow.tcl -interactive
package reuire opanlane
prep -design PES_freqdiv
```
1
```
run_synthesis
```
2
```
run_floorplan
```
3
```
run_placement
```
![Screenshot from 2023-11-03 23-15-03](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/0564535c-f533-4528-ae69-460e9e401e2e)

4
```
run_cts
```
5
```
gen_pdn
```
6
```
run_routing
```
![Screenshot from 2023-11-03 23-15-10](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/b49ce06a-e032-4629-be10-ad7a63f7725d)

# Synthesis (Printing Statistics)
![Screenshot from 2023-11-04 09-25-15](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/f99e517a-7d93-4bf6-a831-bf57d6df88ae)
![Screenshot from 2023-11-04 09-25-32](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/d42e83c0-6656-4afd-a9b0-cc2682a4f1a3)
![Screenshot from 2023-11-04 09-25-58](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/ab2e8940-4a1a-4a2d-b6a8-c5fcd4598d33)

# Magic Output For Floorplan
![floorplan tkcon](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/9537b16e-bf0c-4bad-8ffe-8d9836f4be71)
# Magic Output For Placement
![placement](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/4aca5b83-8ff9-4e11-86e4-1af0c68b680b)
# Magic Output For CTS
![cts](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/43a31d14-76f4-41c7-9d01-aa7e80b59bbf)
# CTS (Reports Generated)

## Power Report

## Skew Report

## Area Report



# Magic Output For Routing
![routing](https://github.com/Abhi9108865162/Frequency-Divider/assets/141741065/956c5966-1e18-48a3-8389-23b3eba44f5f)

# Routing (Reports Generated)



## Congestion Report 


## Power and Clock Skew Report


## Summary Report and Area Report


##  Statistics

 
</details>


