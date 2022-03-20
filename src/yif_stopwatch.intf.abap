INTERFACE yif_stopwatch
  PUBLIC .

  METHODS press.
  METHODS is_running
    RETURNING VALUE(rv_is) TYPE abap_bool.
  METHODS get_elapsed_time
    RETURNING VALUE(rv_time) TYPE i.

ENDINTERFACE.
