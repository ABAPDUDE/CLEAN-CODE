CLASS yltd_stopwatch DEFINITION
  PUBLIC
  FINAL
  FOR TESTING .

  PUBLIC SECTION.
    CLASS-METHODS create_is_running
      RETURNING VALUE(ro_stopwatch) TYPE REF TO yltd_stopwatch.
    CLASS-METHODS create_is_not_running
      IMPORTING iv_elapsed_time     TYPE i
      RETURNING VALUE(ro_stopwatch) TYPE REF TO yltd_stopwatch.

    INTERFACES yif_stopwatch PARTIALLY IMPLEMENTED.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_is_running TYPE abap_bool.
    DATA mv_elapsed_time TYPE i.

ENDCLASS.


CLASS yltd_stopwatch IMPLEMENTATION.
  METHOD create_is_not_running.
    ro_stopwatch = NEW yltd_stopwatch(  ).
    ro_stopwatch->mv_is_running = abap_false.
    ro_stopwatch->mv_elapsed_time = iv_elapsed_time.
  ENDMETHOD.

  METHOD create_is_running.
    ro_stopwatch = NEW yltd_stopwatch(  ).
    ro_stopwatch->mv_is_running = abap_true.
  ENDMETHOD.

  METHOD yif_stopwatch~get_elapsed_time.
    rv_time = mv_elapsed_time.
  ENDMETHOD.

  METHOD yif_stopwatch~is_running.
    rv_is = mv_is_running.
  ENDMETHOD.

  METHOD yif_stopwatch~press.

  ENDMETHOD.

ENDCLASS.
