`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg [1:0] alarm_hours;
  reg [2:0] alarm_minutes;
  
  // Replace tt_um_example with your module name:
  tt_um_kapilan_alarm dut (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

     .ui_in({alarm_minutes[2:0],alarm_hours[4:0]}),
    .uo_out(),
    .uio_in({5'b0,alarm_minutes[5:3]}),
    .uio_out(),
    .uio_oe(),
    .ena(1'b1),
    .clk(clk),
    .rst_n(rst_n)
  );

endmodule
