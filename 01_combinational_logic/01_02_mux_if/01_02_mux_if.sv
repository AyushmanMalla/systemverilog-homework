//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input        [3:0] d0, d1,
  input              sel,
  output logic [3:0] y
);

  always_comb
    if (sel)
      y = d1;
    else
      y = d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input        [3:0] d0, d1, d2, d3,
  input        [1:0] sel,
  output logic [3:0] y
);

  // Task:
  // Using code for mux_2_1 as an example,
  // write code for 4:1 mux using the "if" statement
always_comb
  if (sel == 2'b00) y = d0;
  else if (sel == 2'b01) y = d1;
  else if (sel == 2'b10) y = d2;
  else y = d3;


endmodule


/*
    Things to note: 
    verilog follows the same logic as C/Cpp 
    if multiple statements need to be written inside each of the
    if else loops, we need to enclose them in {} [C/C++]
    if else loops, we need to use a begin/end syntax [verilog, systemVerilog]

    eg:
    C/C++ 
      if (condition) {
          //multi line instructions
      }

      if (condition) //single line instruction

    Verilog/ SV

        if (condition) begin
          //multi line instructions
        end
        
        if (condition) //single line instruction
*/