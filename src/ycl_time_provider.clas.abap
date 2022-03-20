CLASS ycl_time_provider DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS ycl_factory.

  PUBLIC SECTION.
    INTERFACES yif_time_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-METHODS create
      RETURNING VALUE(ro_time_provider) TYPE REF TO ycl_time_provider.
ENDCLASS.



CLASS ycl_time_provider IMPLEMENTATION.
  METHOD create.

  ENDMETHOD.

  METHOD yif_time_provider~get_timestamp.

  ENDMETHOD.

ENDCLASS.
