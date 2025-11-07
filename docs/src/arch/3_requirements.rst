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

Frequency divider
^^^^^^^^^^^^^^^^^

.. requirement:: F_FREQ_DIVIDER_01

  ECAP5-DBLINKY shall implement a frequency divider triggered by clk_i and outputing both an internal clock signal with a 1 second period and its inverted output.

LEDs
^^^^

.. requirement:: F_LED_01
   :derivedfrom: U_BLINK_01

  ECAP5-DBLINKY shall wire som_leds[0] to the frequency divider output.

.. requirement:: F_LED_02
   :derivedfrom: U_BLINK_01

  ECAP5-DBLINKY shall wire som_leds[1] to the inverted frequency divider output.

.. requirement:: F_LED_03
   :derivedfrom: U_BLINK_02

  ECAP5-DBLINKY shall wire carrier_leds[0] to the frequency divider output.

.. requirement:: F_LED_04
   :derivedfrom: U_BLINK_02

  ECAP5-DBLINKY shall wire carrier_leds[1] to the inverted frequency divider output.

Non-functional Requirements
---------------------------

N/A
