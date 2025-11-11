/*           __        _
 *  ________/ /  ___ _(_)__  ___
 * / __/ __/ _ \/ _ `/ / _ \/ -_)
 * \__/\__/_//_/\_,_/_/_//_/\__/
 * 
 * Copyright (C) Clément Chaine
 * This file is part of ECAP5-DBLINKY <https://github.com/ecap5/ECAP5-DBLINKY>
 *
 * ECAP5-DBLINKY is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * ECAP5-DBLINKY is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with ECAP5-DBLINKY.  If not, see <http://www.gnu.org/licenses/>.
 */

module ecap5_dblinky#(
  parameter integer INPUT_FREQ = 12000000 
)(
  input  logic        clk_i,

  output logic   som_led0_o,
  output logic   som_led1_o,
  output logic   carrier_led0_o,
  output logic   carrier_led1_o
);

logic[31:0] counter_d, counter_q = 0;
logic led_toggle_q = 0;

always_comb begin
  counter_d = counter_q + 1'b1;
end

always_ff @(posedge clk_i) begin
  // Once the counter has reached the input frequency
  if(counter_d == INPUT_FREQ) begin
    // Reset the counter
    counter_q <= 0;
    // Invert the led toggle
    led_toggle_q <= !led_toggle_q;
  end else begin
    // Increment the counter
    counter_q <= counter_d;

    led_toggle_q <= led_toggle_q;
  end
end

assign som_led0_o =  led_toggle_q;
assign som_led1_o = !led_toggle_q;
assign carrier_led0_o =  led_toggle_q; 
assign carrier_led1_o = !led_toggle_q; 

endmodule // ecap5_dblinky
