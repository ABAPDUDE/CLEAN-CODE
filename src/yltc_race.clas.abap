CLASS yltc_race DEFINITION
INHERITING FROM yth_base
  PUBLIC
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS finish_12_finish_14_average_13
      FOR TESTING
      RAISING ycx_race_not_finished.
    METHODS finish_12_infinish_no_average
        FOR TESTING .
    METHODS inject_finished_runner
      IMPORTING iv_runtime TYPE  i.
    METHODS inject_unfinished_runner.
    METHODS create_race
      IMPORTING iv_num_runner TYPE i.
    METHODS assert_race_finished_with
      IMPORTING iv_exp_average_runtime TYPE i
      RAISING   ycx_race_not_finished.
    METHODS assert_race_not_finished_yet.

    DATA mo_race TYPE REF TO yif_race.

ENDCLASS.



CLASS yltc_race IMPLEMENTATION.


  METHOD assert_race_finished_with.

  ENDMETHOD.

  METHOD assert_race_not_finished_yet.

  ENDMETHOD.

  METHOD create_race.

  ENDMETHOD.

  METHOD finish_12_finish_14_average_13.
    inject_finished_runner( iv_runtime = 12 ).
    inject_finished_runner( iv_runtime = 14 ).
    create_race( iv_num_runner = 2 ).
    assert_race_finished_with( iv_exp_average_runtime = 13 ).
  ENDMETHOD.

  METHOD finish_12_infinish_no_average.
    inject_finished_runner( iv_runtime = 12 ).
    inject_unfinished_runner( ).
    create_race( iv_num_runner = 2 ).
    assert_race_not_finished_yet( ).
  ENDMETHOD.

  METHOD inject_finished_runner.
    DATA(lo_stopwatch) = yltd_stopwatch=>create_is_not_running( iv_elapsed_time = iv_runtime ).
    mo_factory_double->inject_stopwatch( io_stopwatch = lo_stopwatch ).
  ENDMETHOD.

  METHOD inject_unfinished_runner.

  ENDMETHOD.

ENDCLASS.
