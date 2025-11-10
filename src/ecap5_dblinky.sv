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
  parameter integer INPUT_FREQ = 40000000 
)(
  input  logic        clk_i,

  output logic        som_leds[2],
  output logic        carrier_leds[2]
);

logic[31:0] counter;
logic is_done;

logic led_toggle;

always_comb begin : done_detection
  is_done = (counter >= INPUT_FREQ);
end

always_ff @(posedge clk_i) begin
  if(is_done) begin
    counter <= 0;
    led_toggle <= 0;
    led_toggle <= !led_toggle;
  end else begin
    counter <= counter + 1'b1; 
    led_toggle <= led_toggle;
  end
end

assign som_leds[0] =  led_toggle;
assign som_leds[1] = !led_toggle;
assign carrier_leds[0] =  led_toggle; 
assign carrier_leds[1] = !led_toggle; 

endmodule // ecap5_dblinky
