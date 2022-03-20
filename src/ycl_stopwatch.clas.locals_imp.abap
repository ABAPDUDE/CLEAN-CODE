*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_time_provider IMPLEMENTATION.

  METHOD create.
    ro_time_provider = NEW lcl_time_provider(  ).
  ENDMETHOD.

  METHOD lif_time_provider~get_timestamp.
    GET TIME STAMP FIELD rv_timestamp.
  ENDMETHOD.

ENDCLASS.
