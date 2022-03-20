CLASS yltc_factory DEFINITION
  FINAL
  PUBLIC
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS setup.
    METHODS get_factory_ok FOR TESTING.
    METHODS create_stopwatch_ok FOR TESTING.

    DATA mo_factory TYPE REF TO yif_factory.

ENDCLASS.



CLASS yltc_factory IMPLEMENTATION.

  METHOD setup.
    cl_abap_unit_assert=>assert_bound( mo_factory ).
    cl_abap_unit_assert=>assert_equals( exp = mo_factory
                                        act = ycl_factory=>get( ) ).
  ENDMETHOD.

  METHOD get_factory_ok.
    mo_factory = ycl_factory=>get( ).
  ENDMETHOD.

  METHOD create_stopwatch_ok.
    DATA(lo_stopwatch_a) = mo_factory->create_stopwatch(  ).
    cl_abap_unit_assert=>assert_bound( lo_stopwatch_a ).
    DATA(lo_stopwatch_b) = mo_factory->create_stopwatch(  ).
    cl_abap_unit_assert=>assert_bound( lo_stopwatch_b ).
    cl_abap_unit_assert=>assert_false( xsdbool( lo_stopwatch_a = lo_stopwatch_b ) ).
  ENDMETHOD.

ENDCLASS.
