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

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include <svdpi.h>

#include "Vtb_ecap5_dblinky.h"
#include "testbench.h"
#include "riscv.h"

enum CondId {
  __CondIdEnd
};

class TB_Ecap5_dblinky : public Testbench<Vtb_ecap5_dblinky> {
public:
  void tick() {
    Testbench<Vtb_ecap5_dblinky>::tick();
  }
};

void tb_freq_divider(TB_Ecap5_dblinky * tb) {
  Vtb_ecap5_dblinky * core = tb->core;

  //=================================
  //      Tick (0-16)

  for(int i = 0; i < 24; i++) {
    tb->tick();
  }
}

int main(int argc, char ** argv, char ** env) {
  srand(time(NULL));
  Verilated::traceEverOn(true);

  // Check arguments
  bool verbose = parse_verbose(argc, argv);

  TB_Ecap5_dblinky * tb = new TB_Ecap5_dblinky();
  tb->open_trace("waves/ecap5_dblinky.vcd");
  tb->open_testdata("testdata/ecap5_dblinky.csv");
  tb->set_debug_log(verbose);
  tb->init_conditions(__CondIdEnd);

  /************************************************************/

  tb_freq_divider(tb);

  /************************************************************/

  printf("[ECAP5_DBLINKY]: ");
  if(tb->success) {
    printf("Done\n");
  } else {
    printf("Failed\n");
  }

  delete tb;
  exit(EXIT_SUCCESS);
}
