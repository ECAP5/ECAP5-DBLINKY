Requirements
============

External Interface Requirements
-------------------------------

.. list-table:: ECAP5-DBLINKY control signals
  :header-rows: 1
  :width: 100%
  :widths: 10 10 10 70

  * - Name
    - Type
    - Width
    - Description

  * - clk_i
    - I
    - 1
    - Clock input.

.. requirement:: I_CLK_01

   ECAP5-DBLINKY's outputs shall be registered on the rising edge of clk_i.

.. list-table:: ECAP5-DBLINKY LED signals
  :header-rows: 1
  :width: 100%
  :widths: 10 10 10 70

  * - Name
    - Type
    - Width
    - Description

  * - som_leds
    - O
    - 2
    - ECAP5-BSOM LEDs

  * - carrier_leds
    - O
    - 2
    - ECAP5-BCARRIER-XLITE LEDs

Functional Requirements
-----------------------

N/A

Non-functional Requirements
---------------------------

N/A
