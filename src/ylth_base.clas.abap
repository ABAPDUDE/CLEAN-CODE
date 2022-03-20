CLASS ylth_base DEFINITION
  ABSTRACT INHERITING FROM yth_base
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  PUBLIC.

  PUBLIC SECTION.
  PROTECTED SECTION.
    DATA mo_stopwatch TYPE REF TO yif_stopwatch.
    DATA mo_time_provider_double type ref to yltd_time_provider.

    METHODS start_stopwatch.
    METHODS stop_stopwatch.
    METHODS assert_stopwatch_running.
    METHODS assert_stopwatch_not_running.

  PRIVATE SECTION.
    METHODS setup.

ENDCLASS.



CLASS YLTH_BASE IMPLEMENTATION.


  METHOD assert_stopwatch_not_running.
    cl_abap_unit_assert=>assert_false( mo_stopwatch->is_running( ) ).
  ENDMETHOD.


  METHOD assert_stopwatch_running.
    cl_abap_unit_assert=>assert_true( mo_stopwatch->is_running( ) ).

  ENDMETHOD.


  METHOD setup.
    " local Test Base Class ensuring the Test Isolaton of all derived Test Classes
    mo_stopwatch = ycl_factory=>get( )->create_stopwatch( ).

    mo_time_provider_double = yltd_time_provider=>create( ).
*    ycl_stopwatch=>so_time_provider = mo_time_provider_double.
  ENDMETHOD.


  METHOD start_stopwatch.
    assert_stopwatch_not_running( ).
    mo_stopwatch->press( ).
  ENDMETHOD.


  METHOD stop_stopwatch.
    assert_stopwatch_running( ).
    mo_stopwatch->press( ).
  ENDMETHOD.
ENDCLASS.
