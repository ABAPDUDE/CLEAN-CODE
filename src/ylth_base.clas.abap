CLASS ylth_base DEFINITION
  ABSTRACT INHERITING FROM yth_base
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  PUBLIC.

  PUBLIC SECTION.
  PROTECTED SECTION.
    DATA mo_stopwatch TYPE REF TO yif_stopwatch.

  PRIVATE SECTION.
    METHODS setup.
    METHODS start_stopwatch.
    METHODS stop_stopwatch.
    METHODS assert_stopwatch_running.
    METHODS assert_stopwatch_not_running.
ENDCLASS.

CLASS ylth_base IMPLEMENTATION.
  METHOD setup.
    mo_stopwatch = ycl_factory=>get( )->create_stopwatch( ).
  ENDMETHOD.

  METHOD assert_stopwatch_running.
    cl_abap_unit_assert=>assert_true( mo_stopwatch->is_running( ) ).

  ENDMETHOD.

  METHOD start_stopwatch.
    assert_stopwatch_not_running( ).
    mo_stopwatch->press( ).
  ENDMETHOD.

  METHOD stop_stopwatch.
    assert_stopwatch_running( ).
    mo_stopwatch->press( ).
  ENDMETHOD.

  METHOD assert_stopwatch_not_running.
    cl_abap_unit_assert=>assert_false( mo_stopwatch->is_running( ) ).
  ENDMETHOD.

ENDCLASS.
