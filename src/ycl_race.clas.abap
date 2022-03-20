CLASS ycl_race DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_race.
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS create
      IMPORTING iv_num_runner  TYPE i
      RETURNING VALUE(ro_race) TYPE REF TO ycl_race.

    DATA mt_stopwatch TYPE STANDARD TABLE OF REF TO yif_stopwatch.
ENDCLASS.



CLASS ycl_race IMPLEMENTATION.

  METHOD create.

    IF iv_num_runner < 0.
*      RAISE EXCEPTION TYPE ycx_race_invalid.
    ENDIF.

    ro_race = NEW ycl_race(  ).
    DATA(lo_factory) = ycl_factory=>get(  ).

    DO iv_num_runner TIMES.
      DATA(lo_stopwatch) = lo_factory->create_stopwatch(  ).
      INSERT lo_stopwatch INTO TABLE ro_race->mt_stopwatch.
    ENDDO.
  ENDMETHOD.

  METHOD yif_race~get_average_runtime.
    DATA lv_total_runtime TYPE i.
    LOOP AT mt_stopwatch INTO DATA(lo_stopwatch).
      IF lo_stopwatch->is_running(  ) = abap_true.
        RAISE EXCEPTION TYPE ycx_race_not_finished.
      ENDIF.
      lv_total_runtime = lv_total_runtime + lo_stopwatch->get_elapsed_time( ).
    ENDLOOP.

    rv_time = lv_total_runtime / lines( mt_stopwatch ).
  ENDMETHOD.

ENDCLASS.
