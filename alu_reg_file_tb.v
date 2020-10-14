`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 08:56:56 AM
// Design Name: 
// Module Name: alu_reg_file_tb
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


module alu_reg_file_tb();

    reg clk, rst, wr_en;
    reg [1:0] rd0_addr, rd1_addr, wr_addr;
    reg [8:0] wr_data;
    reg [1:0] alusrc1, alusrc2;
    reg [7:0] instr_i;
    reg [2:0] s;
    
    wire [7:0] f;
    wire ovf, take_branch;

    wire [8:0] rd0_data, rd1_data;
    wire [7:0] out1, out2;
    
    wire zero_sig = 8'b00000000;
    
    alu_regfile setup(rst, clk, wr_en, rd0_addr, rd1_addr, wr_addr, wr_data, rd0_data, rd1_data, 
                        out1, out2, alusrc1, alusrc2, instr_i, s, f, ovf, take_branch);
    
    
    initial begin
    rst = 1;
    #5 rst = 0;
    end
    
    initial begin
        clk = 1;
        forever #5 clk = ~clk; 
    end
    
    initial begin
    
    #200
    
    rd0_addr = 0;
    rd1_addr = 0;
    wr_en = 0;
    wr_addr = 0;
    s = 0;
    wr_data = 0;
    alusrc1 = 0;
    alusrc2 = 0;
    instr_i = 0;
    
    #200;
    
    wr_en = 1;
    wr_addr = 1;
    wr_data = 92;
    
    #200;
    
    wr_en = 1;
    wr_addr = 2;
    wr_data = 65;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 1;
    rd1_addr = 2;
    
    
    #200;
    
    wr_en = 1;
    wr_addr = 3;
    wr_data = 15;
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 32;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 0;
    rd1_addr = 3;
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 127;
    
    #200;
    
    wr_en = 1;
    wr_addr = 1;
    wr_data = 127;
    
    #200;
    wr_en = 0;
    rd0_addr = 0;
    rd1_addr = 1;
    
    #200;
    wr_en = 1;
    wr_addr = 1;
    wr_data = 8'hAB;
    
    #200;
    wr_en = 1;
    wr_addr = 2;
    wr_data = 1; 
    
    #200;
    wr_en = 0;
    rd0_addr = 1;
    rd1_addr = 2;
    
    
    //setting to read from instructions
    #200;
    
    wr_en = 1;
    alusrc2 = 1;
    wr_addr = 0;
    wr_data = 99;
    instr_i = 130;
    
    
    
    //reading from instructions
    #200;
    wr_en = 0;
    rd0_addr = 0;
    
    
    //INV////////////////////////////////////////////////////
    
    #200;
    s = 1;
    alusrc2 = 0;
    wr_en = 1;
    wr_addr = 3;
    wr_data = 55;
    
    #200;
    
    wr_en = 0;
    rd1_addr = 3;
    
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 240;
   
    
    #200;
    
    wr_en = 0;
    rd1_addr = 0;
    
    //AND/////////////////////////////////////////////////////////
    #200;
    s = 2;
    wr_en = 1;
    wr_addr = 2;
    wr_data = 55;
    
    #200;
    wr_en = 1;
    wr_addr = 3;
    wr_data = 100;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 2;
    rd1_addr = 3;
    
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 241;
    
    #200;
    
    wr_en = 1;
    wr_addr = 1;
    wr_data = 15;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 0;
    rd1_addr = 1;
    
    #200;
    wr_en = 1;
    wr_addr = 1;
    wr_data = 8'hAB;
    
    #200;
    wr_en = 1;
    wr_addr = 0;
    wr_data = 8'hA0;
    
    #200;
    wr_en = 0;
    rd0_addr = 1;
    rd1_addr = 0;
    
    #200;
    alusrc1 = 1;
    
    #200;
    wr_en = 0;
    
    #200;
    
    alusrc1 = 0;
    
    
    
    
    //or/////////////////////////////////////////////////////////
    #200;
    s = 3;
    wr_en = 1;
    wr_addr = 2;
    wr_data = 55;
    
    #200;
    wr_en = 1;
    wr_addr = 3;
    wr_data = 100;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 2;
    rd1_addr = 3;
    
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 241;
    
    #200;
    
    wr_en = 1;
    wr_addr = 1;
    wr_data = 15;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 0;
    rd1_addr = 1;
    
    
    // using zero register
    #200;
    
    wr_en = 1;
    alusrc1 = 1;
    wr_addr = 3;
    wr_data = 13;
    
    #200;
    
    wr_en = 0;
    rd1_addr = 3;
   
    
    //SHIFT RIGHT///////////////////////////////////////////////////////////
    #200;
    
    alusrc1 = 0;
    s = 4;
    wr_en = 1;
    wr_addr = 2;
    wr_data = 129;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 2;    
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 2;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 0;    
    
    //SHIFT LEFT///////////////////////////////////////////////////////////
    #200;
    s = 5;
    wr_en = 1;
    wr_addr = 2;
    wr_data = 129;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 2;
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 240;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 0;    
   
    
    //BEQ///////////////////////////////////////////////////////////
    #200;
    s = 6;
    wr_en = 1;
    wr_addr = 2;
    wr_data = 55;
    
    #200;
    wr_en = 1;
    wr_addr = 3;
    wr_data = 100;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 2;
    rd1_addr = 3;
    
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 24;
    
    #200;
    
    wr_en = 1;
    wr_addr = 1;
    wr_data = 24;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 0;
    rd1_addr = 1;
   

    
    //bne///////////////////////////////////////////////////////////
    #200;
    s = 7;
    wr_en = 1;
    wr_addr = 2;
    wr_data = 55;
    
    #200;
    wr_en = 1;
    wr_addr = 3;
    wr_data = 100;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 2;
    rd1_addr = 3;
    
    
    #200;
    
    wr_en = 1;
    wr_addr = 0;
    wr_data = 24;
    
    #200;
    
    wr_en = 1;
    wr_addr = 1;
    wr_data = 24;
    
    #200;
    
    wr_en = 0;
    rd0_addr = 0;
    rd1_addr = 1;
    
    #200;
    
    wr_en = 1;
    rst = 1;
    
    
    
        
    end                   
    
endmodule
