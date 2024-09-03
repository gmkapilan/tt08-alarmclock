// Code your design here
module ClockAlarm(
  input wire clk,
  input wire reset,
  //Input time to the clock to preset
  //input wire [7:0] preset_hours,
  //input wire [7:0] preset_minutes, 
  //input wire [7:0] preset_seconds, 
  //Input at which Alarm should go off
  input wire [1:0] alarm_hours,
  input wire [1:0] alarm_minutes, 
  //input wire [3:0] alarm_seconds, 
 
  //Output time in the clock
  output reg [1:0] hours,
  output reg [1:0] minutes, 
  output reg [3:0] seconds, 
  output reg alarm
);


  always @(posedge clk or posedge reset) begin
      if (reset) begin
          hours <= 0;
          minutes <= 0;
          seconds <= 0;
          alarm <= 1'b0;
      end else begin

          seconds <= seconds + 4'd1;

        if (seconds == 4'd15) begin
              seconds <= 4'd0;
              minutes <= minutes + 2'd1;
          end

        if (minutes == 2'd3 && seconds == 4'd15) begin
              minutes <= 2'd0;
              hours <= hours + 2'd1;
          end

        if (hours == 2'd3 && minutes == 2'd3 && seconds == 4'd15) begin
              hours <= 2'd0;
          end


        if ((hours == alarm_hours) && (minutes == alarm_minutes)) begin
               alarm <= 1'b1; 
          end else begin
               alarm <= 1'b0; 
          end
      end
  end
endmodule
