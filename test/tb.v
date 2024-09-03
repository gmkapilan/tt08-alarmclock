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
  reg ena;
   reg [1:0] alarm_hours;
   reg [2:0] alarm_minutes;
   wire [1:0] hours;
   wire [1:0] minutes;
   wire [1:0] seconds;
   wire alarm;

  // Replace tt_um_example with your module name:
  tt_um_ClockAlarm my_alarm (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

    .clk(clk),
     .rst_n(rst_n),
     .seconds(seconds),
     .minutes(minutes),
     .hours(hours),
     .alarm_minutes(alarm_minutes),
     .alarm_hours(alarm_hours),
     .ena(ana),
     .alarm(alarm)
  );

endmodule
