*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section

INTERFACE lif_time_provider.

  METHODS get_timestamp
    RETURNING VALUE(rv_timestamp) TYPE timestamp.

ENDINTERFACE.

CLASS lcl_time_provider DEFINITION.


  PUBLIC SECTION.
    INTERFACES lif_time_provider.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS create
    RETURNING VALUE(ro_time_provider) type ref to lcl_time_provider.

ENDCLASS.
