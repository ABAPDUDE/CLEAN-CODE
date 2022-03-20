CLASS ytd_factory DEFINITION
  PUBLIC
  INHERITING FROM ycl_factory
  FINAL
  CREATE PRIVATE FOR TESTING .

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING VALUE(ro_factory) TYPE REF TO ytd_factory.

    METHODS yif_factory~create_stopwatch REDEFINITION.

    METHODS inject_stopwatch
      IMPORTING io_stopwatch TYPE REF TO yif_stopwatch.

    METHODS inject_time_provider
      IMPORTING io_time_provider TYPE REF TO ycl_time_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mt_stopwatch TYPE STANDARD TABLE OF REF TO yif_stopwatch.
ENDCLASS.



CLASS ytd_factory IMPLEMENTATION.
  METHOD create.
    ro_factory = NEW ytd_factory( ).
  ENDMETHOD.

  METHOD inject_stopwatch.
    APPEND io_stopwatch TO mt_stopwatch.
  ENDMETHOD.

  METHOD yif_factory~create_stopwatch.
    IF mt_stopwatch IS NOT INITIAL.
      ro_stopwatch = mt_stopwatch[ 1 ].
      DELETE mt_stopwatch INDEX 1.
    ELSE.
      ro_stopwatch = super->yif_factory~create_stopwatch( ).
    ENDIF.

  ENDMETHOD.

  METHOD inject_time_provider.
    mo_time_provider = io_time_provider.
  ENDMETHOD.

ENDCLASS.
