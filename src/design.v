// Code your design here
module ClockAlarm(
  input wire clk,
  input wire reset,
  //Input time to the clock to preset
  //input wire [7:0] preset_hours,
  //input wire [7:0] preset_minutes, 
  //input wire [7:0] preset_seconds, 
  //Input at which Alarm should go off
  input wire [7:0] alarm_hours,
  input wire [7:0] alarm_minutes, 
  input wire [7:0] alarm_seconds, 
 
  //Output time in the clock
  output reg [7:0] hours,
  output reg [7:0] minutes, 
  output reg [7:0] seconds, 
  output reg alarm
);


  always @(posedge clk or posedge reset) begin
      if (reset) begin
          hours <= 0;
          minutes <= 0;
          seconds <= 0;
          alarm <= 1'b0;
      end else begin

          seconds <= seconds + 8'd1;

          if (seconds == 8'd59) begin
              seconds <= 8'd0;
              minutes <= minutes + 8'd1;
          end

          if (minutes == 8'd59 && seconds == 8'd59) begin
              minutes <= 8'd0;
              hours <= hours + 8'd1;
          end

          if (hours == 8'd23 && minutes == 8'd59 && seconds == 8'd59) begin
              hours <= 8'd0;
          end


        if ((hours == alarm_hours) && (minutes == alarm_minutes) && (seconds == alarm_seconds)) begin
               alarm <= 1'b1; 
          end else begin
               alarm <= 1'b0; 
          end
      end
  end
endmodule
