CLASS ycl_stopwatch DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
GLOBAL FRIENDS ycl_factory.

  PUBLIC SECTION.
    INTERFACES yif_stopwatch.

  PROTECTED SECTION.
    CLASS-DATA so_time_provider TYPE REF TO yif_time_provider.

  PRIVATE SECTION.
    CLASS-METHODS create
      RETURNING VALUE(ro_stopwatch) TYPE REF TO ycl_stopwatch.
    CLASS-METHODS get_run_time
      RETURNING VALUE(rv_time) TYPE tzntstmpl.

    CLASS-DATA mv_is_running TYPE abap_bool.
    CLASS-DATA mv_start TYPE tzntstmpl.
    CLASS-DATA mv_stopped_time TYPE i.

ENDCLASS.

CLASS ycl_stopwatch IMPLEMENTATION.
  METHOD create.
    ro_stopwatch = NEW ycl_stopwatch( ).
  ENDMETHOD.

  METHOD yif_stopwatch~is_running.
    rv_is = mv_is_running.
  ENDMETHOD.

  METHOD yif_stopwatch~press.
    IF mv_is_running = abap_true.
      mv_is_running = abap_false.
      mv_stopped_time = mv_stopped_time + get_run_time(  ).
      CLEAR mv_start.
    ELSE.
      mv_is_running = abap_true.
      GET TIME STAMP FIELD mv_start.
    ENDIF.
  ENDMETHOD.

  METHOD yif_stopwatch~get_elapsed_time.
    rv_time = mv_stopped_time + get_run_time(  ).
  ENDMETHOD.

  METHOD get_run_time.
    DATA lv_stop TYPE timestamp.

    IF mv_start IS NOT INITIAL.
      GET TIME STAMP FIELD lv_stop.
      rv_time = cl_abap_tstmp=>subtract(
        tstmp1 = lv_stop
        tstmp2 = mv_start
      ).
*                CATCH cx_parameter_invalid_range.
*                CATCH cx_parameter_invalid_type.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
