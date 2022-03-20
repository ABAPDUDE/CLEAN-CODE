CLASS yth_base DEFINITION
  PUBLIC ABSTRACT
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
  PROTECTED SECTION.
    DATA mo_factory_double TYPE REF TO ytd_factory.

  PRIVATE SECTION.
    METHODS setup.
ENDCLASS.



CLASS yth_base IMPLEMENTATION.
  METHOD setup.
    mo_factory_double = ytd_factory=>create( ).
    yth_injector=>inject_factory( mo_factory_double ).
  ENDMETHOD.

ENDCLASS.
