INTERFACE yif_factory
  PUBLIC .
  METHODS create_stopwatch
    RETURNING VALUE(ro_stopwatch) TYPE REF TO yif_stopwatch.
  METHODS get_time_provider
    RETURNING VALUE(ro_time_provider) TYPE REF TO yif_time_provider.
ENDINTERFACE.
