/* ***************************************************************\
| Name of program : Testbench for Ripple Carry Adder
| Author: Alain Schaerer
| Date Created : 12/5/21
| Date last updated : 12/5/21
| Function : Tests the ripple carry adder by iterating through the memfile to fetch the testcases
| Method : setting up destination wires, iterating through memfile
| Additional Comments : In order to replicate the result in the report, each testcase has to be tested individually, so that the results are not affected by previous signals. Do not forget to adjust the $finish time.
\****************************************************************/

`timescale 100ns/100ps
module ripple_adder_test;
  //set up the variables that will be used to connect into the module being tested
  //it is a reg type so it updates only when told to

  //there is one for each connection noted in the portlist of the module to be tested
  wire [31:0]R_S;
  wire R_C;
  
    reg [5:0]addr;
  //the result of the module being tested connects to a wire, so it can update as it needs to
  
  initial
    begin
      //set up the initial signal values for the variables that will simulate the input connections
      
      addr=6'b00;  
    end
  
  //instantiation to establish the m  I[1] = 0;  I[1] = 0; t is being tested
                 
  ripple_carry test(.a(addr), .out(R_S), .carry(R_C));
  
  //pattern to test through
  always
    begin
      //pattern needs to test a few cases to make sure that it passes through correctly1
      
        #14 addr=addr+2; //since its two values each, we add 2
 
    end
  
  //create the log
  initial
    begin
      $display("Halfadder Log\n");
      $display("Input1\Input2\tResult\tCarry"); //header row label for the log

      $monitor("%0t\t%b\t%b", $time, R_S, R_C); //print out of the variables for the log when they change
    end
   initial
            begin  
              $dumpfile("lab7_tb.vcd");
              $dumpvars(0,ripple_adder_test); 
			
            end 
  
  //create the run time to go through all the cases

  //with 2 time units for each case, which means run time is ___________ time units
  initial
    #120 $finish;
endmodule
