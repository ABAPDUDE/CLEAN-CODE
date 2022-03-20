INTERFACE yif_race
  PUBLIC .

  METHODS get_average_runtime
    RETURNING VALUE(rv_time) TYPE i
    RAISING   ycx_race_not_finished.

ENDINTERFACE.
