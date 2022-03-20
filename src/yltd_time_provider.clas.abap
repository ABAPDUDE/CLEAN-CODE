CLASS yltd_time_provider DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE FOR TESTING.

  PUBLIC SECTION.
    INTERFACES yif_time_provider.

    CLASS-METHODS create
      RETURNING VALUE(ro_time_provider) TYPE REF TO yltd_time_provider.

    METHODS wait
      IMPORTING iv_seconds TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

    CONSTANTS c_any_timestamp TYPE timestamp VALUE '202001011101010' .
    DATA  mv_current_timestamp TYPE timestamp.

ENDCLASS.



CLASS yltd_time_provider IMPLEMENTATION.

  METHOD create.
    ro_time_provider = NEW yltd_time_provider(  ).
    ro_time_provider->mv_current_timestamp = c_any_timestamp.
  ENDMETHOD.

  METHOD wait.
    mv_current_timestamp = cl_abap_tstmp=>add_to_short(
      tstmp = mv_current_timestamp
      secs  = iv_seconds
    ).
*                       CATCH cx_parameter_invalid_range.
*                       CATCH cx_parameter_invalid_type.

  ENDMETHOD.

  METHOD yif_time_provider~get_timestamp.
    rv_timestamp = mv_current_timestamp.
  ENDMETHOD.

ENDCLASS.
