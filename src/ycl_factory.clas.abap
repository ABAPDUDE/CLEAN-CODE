CLASS ycl_factory DEFINITION
  PUBLIC
  CREATE PROTECTED
  GLOBAL FRIENDS yth_injector.

  PUBLIC SECTION.
    INTERFACES yif_factory.

    CLASS-METHODS get
      RETURNING VALUE(ro_factory) TYPE REF TO yif_factory.

  PROTECTED SECTION.
    DATA mo_time_provider TYPE REF TO yif_time_provider.
  PRIVATE SECTION.
    CLASS-DATA so_factory TYPE REF TO yif_factory.

ENDCLASS.

CLASS ycl_factory IMPLEMENTATION.

  METHOD get.
    IF so_factory IS NOT BOUND.
      so_factory = NEW ycl_factory( ).
    ENDIF.
    ro_factory = so_factory.
  ENDMETHOD.

  METHOD yif_factory~create_stopwatch.
    ro_stopwatch = ycl_stopwatch=>create(  ).
  ENDMETHOD.

  METHOD yif_factory~get_time_provider.
    IF mo_time_provider IS NOT BOUND.
      mo_time_provider = ycl_time_provider=>create(  ).
    ENDIF.
    ro_time_provider =   mo_time_provider.
  ENDMETHOD.

ENDCLASS.
