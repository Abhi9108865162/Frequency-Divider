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
