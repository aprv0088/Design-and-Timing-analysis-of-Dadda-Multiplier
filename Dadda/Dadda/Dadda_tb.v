`timescale 1 ps / 1 fs //1ps clock, 1fs step
module test_bench();

    reg [7:0] inp1,inp2;
    reg [15:0] acc;
    reg [15:0] in1,in2;
    wire [15:0] prod4_0,prod4_1;
    wire [16:0] result;
    reg [15:0] sum_out;
    reg [0:0] carry_flag;
    reg	clk;

  dadda dadda_tb(
        .inp1(inp1),
        .inp2(inp2),
        .acc(acc),
        .prod4_0(prod4_0),
        .prod4_1(prod4_1)
    );

carry_select_adder csa_tb(
        .in1(in1),
        .in2(in2),
        .result(result)
        );

    initial begin
       clk = 1'b0;
       forever clk = #1 ~clk;
    end	   

 always  
  begin
     #1     assign in1 = prod4_0;
     #1     assign in2 = prod4_1;
     #1     assign sum_out = result[15:0];
     #1     assign carry_flag = result[16:16];
 end

 initial begin

      {inp1,inp2,acc} = #1 {8'hff,8'hff,16'h0f0f}; //input 01
      {inp1,inp2,acc} = #1000 {8'haa,8'h01,16'hf111}; //input 02
      {inp1,inp2,acc} = #1000 {8'hbb,8'hff,16'h0020}; //input 03
      {inp1,inp2,acc} = #1000 {8'hcc,8'h03,16'hf300}; //input 04
      {inp1,inp2,acc} = #1000 {8'hdd,8'hff,16'h4000}; //input 05
      {inp1,inp2,acc} = #1000 {8'hee,8'h05,16'hf500}; //input 06
      {inp1,inp2,acc} = #1000 {8'h54,8'hff,16'h1111}; //input 07
      {inp1,inp2,acc} = #1000 {8'h23,8'h1d,16'h2222}; //input 08
      {inp1,inp2,acc} = #1000 {8'h65,8'hff,16'hFF00}; //input 09
      {inp1,inp2,acc} = #1000 {8'h78,8'ha4,16'hF999}; //input 10
      {inp1,inp2,acc} = #1000 {8'h89,8'hac,16'h0030}; //input 11
      {inp1,inp2,acc} = #1000 {8'h12,8'haa,16'h0099}; //input 12
      {inp1,inp2,acc} = #1000 {8'h46,8'h22,16'hf070}; //input 13
      {inp1,inp2,acc} = #1000 {8'h77,8'h2d,16'hf880}; //input 14
      {inp1,inp2,acc} = #1000 {8'h93,8'hba,16'hf406}; //input 15
      {inp1,inp2,acc} = #1000 {8'h90,8'h74,16'hb403}; //input 16
      {inp1,inp2,acc} = #1000 {8'h30,8'h54,16'hc501}; //input 17

      #5000 $finish;
   end

endmodule