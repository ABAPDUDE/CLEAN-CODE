CLASS yltc_stopwatch DEFINITION
  INHERITING FROM ylth_base
  PUBLIC
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS create_ok FOR TESTING.
    METHODS create_is_not_running FOR TESTING.
    METHODS press_is_running FOR TESTING.
    METHODS stop_time FOR TESTING.
    METHODS stop_time_2x FOR TESTING.
    METHODS press_2x_is_not_running FOR TESTING.
    METHODS press_3x_is_running FOR TESTING.
    METHODS stop_interim_time FOR TESTING.
    METHODS stop_time_stop_interim_time.
ENDCLASS.

CLASS yltc_stopwatch IMPLEMENTATION.
  METHOD create_ok.
    cl_abap_unit_assert=>assert_bound( mo_stopwatch ).
  ENDMETHOD.

  METHOD create_is_not_running.

  ENDMETHOD.

  METHOD press_is_running.

  ENDMETHOD.

  METHOD press_2x_is_not_running.

  ENDMETHOD.

  METHOD press_3x_is_running.
    mo_stopwatch->press( ).
    mo_stopwatch->press( ).
    mo_stopwatch->press( ).
    cl_abap_unit_assert=>assert_true( mo_stopwatch->is_running( ) ).
  ENDMETHOD.

  METHOD stop_interim_time.

  ENDMETHOD.

  METHOD stop_time.

  ENDMETHOD.

  METHOD stop_time_2x.
    mo_stopwatch->press( ).
    WAIT UP TO 2 SECONDS.
    mo_stopwatch->press( ).
    WAIT UP TO 1 SECONDS.   " should not matter
    mo_stopwatch->press( ).
    WAIT UP TO 1 SECONDS.
    mo_stopwatch->press( ).

    cl_abap_unit_assert=>assert_equals(
      exp = 3
      act = mo_stopwatch->get_elapsed_time( ) ).
  ENDMETHOD.

  METHOD stop_time_stop_interim_time.
    mo_stopwatch->press( ).
    WAIT UP TO 2 SECONDS.
    mo_stopwatch->press( ).
    WAIT UP TO 1 SECONDS.   " should not matter
    mo_stopwatch->press( ).
    WAIT UP TO 1 SECONDS.

    cl_abap_unit_assert=>assert_equals(
      exp = 3
      act = mo_stopwatch->get_elapsed_time( ) ).
  ENDMETHOD.

ENDCLASS.
