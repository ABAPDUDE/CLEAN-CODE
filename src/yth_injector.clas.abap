CLASS yth_injector DEFINITION
  PUBLIC
  FINAL
  ABSTRACT
  FOR TESTING
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS inject_factory
      IMPORTING io_factory TYPE REF TO yif_factory.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS yth_injector IMPLEMENTATION.
  METHOD inject_factory.
    ycl_factory=>so_factory = io_factory.
  ENDMETHOD.

ENDCLASS.
