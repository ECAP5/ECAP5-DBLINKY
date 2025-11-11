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

module tb_ecap5_dblinky (
  input  logic        clk_i,

  output logic   som_led0_o,
  output logic   som_led1_o,
  output logic   carrier_led0_o,
  output logic   carrier_led1_o
);

ecap5_dblinky #(
  .INPUT_FREQ(8) 
) dut (
  .clk_i            (clk_i),
  .som_led0_o       (som_led0_o),
  .som_led1_o       (som_led1_o),
  .carrier_led0_o   (carrier_led0_o),
  .carrier_led1_o   (carrier_led1_o)
);

endmodule // ecap5_dblinky
