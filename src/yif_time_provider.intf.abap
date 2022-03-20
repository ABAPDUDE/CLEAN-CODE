INTERFACE yif_time_provider
  PUBLIC .
  METHODS get_timestamp
    RETURNING VALUE(rv_timestamp) TYPE timestamp.
ENDINTERFACE.
