`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 06:19:58 PM
// Design Name: 
// Module Name: reg_file_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_file_tb();

reg clk, rst, wr_en;
reg [1:0] rd0_addr;
reg [1:0] rd1_addr;

reg [1:0] wr_addr;
reg [8:0] wr_data;

wire [8:0] rd0_data;
wire [8:0] rd1_data;

reg_file register(rst, clk, wr_en, rd0_addr, rd1_addr, wr_addr, wr_data, rd0_data, rd1_data);

initial begin
    rst = 1;
    #5 rst = 0;
end
    
initial begin
    clk = 1;
    forever #5 clk = ~clk;
end

initial begin
    rd0_addr = 0;
    rd1_addr = 0;
    wr_en = 0;
    wr_addr = 0;
    wr_data = 0;
    
    
    #200;
    
    wr_en = 1;
    wr_addr = 2;
    wr_data = 92;
    
    
    #200;
    
    wr_en = 1;
    wr_addr = 1;
    wr_data = 65;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 1;
    rd1_addr = 2;
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 12;
    
    #200;
    $finish;
    
end



endmodule
