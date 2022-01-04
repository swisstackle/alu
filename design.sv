/* ***************************************************************\
| Name of program : ripple carry adder
| Author: Alain Schaerer
| Date Created : 12/5/2021
| Date last updated : 12/5/2021
| Function : Adds two 32 bit numbers together and outputs the result.
| Method : Uses 32 fulladders to compute each resultbit individually with taking
into consideration the carryout of the last adder’s result
| Additional Comments : N/A
\****************************************************************/

`timescale 100ns/100ps

module halfadder(b1, b2, s, c_out);
  input b1, b2;
  output s, c_out;
  
   xor #0.1425 x1(s, b1, b2);
  and  #0.0575 a1(c_out, b1, b2); //5.75
endmodule

module fulladder(c_in, b1, b2, s, c_out);
  input c_in, b1, b2;
  output s, c_out;
  
  wire s1, c_out1;
  wire c_out2;
  
  halfadder instant1(.b1(b1), .b2(b2), .s(s1), .c_out(c_out1));
  
  halfadder instant2(.b1(s1), .b2(c_in), .s(s), .c_out(c_out2));
  
  
   or #0.12 o1(c_out, c_out1, c_out2);
endmodule

module ripple_carry(a, out, carry);
  input [5:0] a; // addr of inputs in memfile
  wire [31:0]i1;
  wire [31:0]i2;
  output [31:0] out;
  
  wire [31:0]c_out;
  output carry;
  
  readfile read(.a(a), .input1(i1), .input2(i2));
  
  fulladder  first(.c_in(0), .b1(i1[0]), .b2(i2[0]), .s(out[0]), .c_out(c_out[0]));
  fulladder  second(.c_in(c_out[0]), .b1(i1[1]), .b2(i2[1]), .s(out[1]), .c_out(c_out[1]));
  
  fulladder third(.c_in(c_out[1]), .b1(i1[2]), .b2(i2[2]), .s(out[2]), .c_out(c_out[2]));
  
  fulladder  fourth(.c_in(c_out[2]), .b1(i1[3]), .b2(i2[3]), .s(out[3]), .c_out(c_out[3]));
  
  
  
  fulladder  fivth(.c_in(c_out[3]), .b1(i1[4]), .b2(i2[4]), .s(out[4]), .c_out(c_out[4]));
  
  fulladder  sixth(.c_in(c_out[4]), .b1(i1[5]), .b2(i2[5]), .s(out[5]), .c_out(c_out[5]));
  
  fulladder  seventh(.c_in(c_out[5]), .b1(i1[6]), .b2(i2[6]), .s(out[6]), .c_out(c_out[6]));
  
  fulladder  eigth(.c_in(c_out[6]), .b1(i1[7]), .b2(i2[7]), .s(out[7]), .c_out(c_out[7]));
  
  fulladder ninth(.c_in(c_out[7]), .b1(i1[8]), .b2(i2[8]), .s(out[8]), .c_out(c_out[8]));
  
  fulladder  tenth(.c_in(c_out[8]), .b1(i1[9]), .b2(i2[9]), .s(out[9]), .c_out(c_out[9]));
  
  fulladder  eleventh(.c_in(c_out[9]), .b1(i1[10]), .b2(i2[10]), .s(out[10]), .c_out(c_out[10]));
  
  fulladder  twelth(.c_in(c_out[10]), .b1(i1[11]), .b2(i2[11]), .s(out[11]), .c_out(c_out[11]));
  
  fulladder  thriteen(.c_in(c_out[11]), .b1(i1[12]), .b2(i2[12]), .s(out[12]), .c_out(c_out[12]));
  
  fulladder  fourteen(.c_in(c_out[12]), .b1(i1[13]), .b2(i2[13]), .s(out[13]), .c_out(c_out[13]));
  
  fulladder  fft(.c_in(c_out[13]), .b1(i1[14]), .b2(i2[14]), .s(out[14]), .c_out(c_out[14]));
  
  fulladder  sttt(.c_in(c_out[14]), .b1(i1[15]), .b2(i2[15]), .s(out[15]), .c_out(c_out[15]));
  fulladder  twelve(.c_in(c_out[15]), .b1(i1[16]), .b2(i2[16]), .s(out[16]), .c_out(c_out[16]));
  fulladder  ft(.c_in(c_out[16]), .b1(i1[17]), .b2(i2[17]), .s(out[17]), .c_out(c_out[17]));
  fulladder  st(.c_in(c_out[17]), .b1(i1[18]), .b2(i2[18]), .s(out[18]), .c_out(c_out[18]));
  
  fulladder  stt(.c_in(c_out[18]), .b1(i1[19]), .b2(i2[19]), .s(out[19]), .c_out(c_out[19]));
  fulladder  et(.c_in(c_out[19]), .b1(i1[20]), .b2(i2[20]), .s(out[20]), .c_out(c_out[20]));
  fulladder  nt(.c_in(c_out[20]), .b1(i1[21]), .b2(i2[21]), .s(out[21]), .c_out(c_out[21]));
  fulladder  tw(.c_in(c_out[21]), .b1(i1[22]), .b2(i2[22]), .s(out[22]), .c_out(c_out[22]));
  
  fulladder  twone(.c_in(c_out[22]), .b1(i1[23]), .b2(i2[23]), .s(out[23]), .c_out(c_out[23]));
  fulladder  twt(.c_in(c_out[23]), .b1(i1[24]), .b2(i2[24]), .s(out[24]), .c_out(c_out[24]));
  fulladder  twth(.c_in(c_out[24]), .b1(i1[25]), .b2(i2[25]), .s(out[25]), .c_out(c_out[25]));
  fulladder  twf(.c_in(c_out[25]), .b1(i1[26]), .b2(i2[26]), .s(out[26]), .c_out(c_out[26]));
  
  fulladder  tws(.c_in(c_out[26]), .b1(i1[27]), .b2(i2[27]), .s(out[27]), .c_out(c_out[27]));
  fulladder  twss(.c_in(c_out[27]), .b1(i1[28]), .b2(i2[28]), .s(out[28]), .c_out(c_out[28]));
  fulladder  twe(.c_in(c_out[28]), .b1(i1[29]), .b2(i2[29]), .s(out[29]), .c_out(c_out[29]));
  
  
  fulladder  twn(.c_in(c_out[29]), .b1(i1[30]), .b2(i2[30]), .s(out[30]), .c_out(c_out[30]));
  
  fulladder thirdy(.c_in(c_out[30]), .b1(i1[31]), .b2(i2[31]), .s(out[31]), .c_out(carry));
  
  
  
endmodule
                     

 module readfile(a, input1, input2);


  input  [5:0]  a; //address for the register
  output [31:0] input1; //register being returned with value loaded
  output [31:0] input2;
   reg [31:0] RAM[9:0]; //10 values of 32 bits size (5 pairs of inputs)

  initial
    begin
      $readmemh("memfile.dat",RAM); // initialize memory
    end

  assign input1 = RAM[a]; // word aligned
   assign input2 = RAM[a+1];
endmodule
