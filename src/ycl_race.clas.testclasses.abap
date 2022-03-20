*"* use this source file for your ABAP unit test classes
    CLASS lth_base DEFINITION ABSTRACT
    INHERITING FROM yth_base
    FOR TESTING
    DURATION SHORT
    RISK LEVEL HARMLESS.

      PUBLIC SECTION.
      PROTECTED SECTION.
        METHODS inject_unstarted_runner.
        METHODS inject_unfisishd_runner.
        METHODS inject_finished_runner
          IMPORTING iv_runtime TYPE i.
        DATA mo_race TYPE REF TO yif_race.
    ENDCLASS.

    CLASS lth_base IMPLEMENTATION.

      METHOD inject_finished_runner.

      ENDMETHOD.

      METHOD inject_unfisishd_runner.

      ENDMETHOD.

      METHOD inject_unstarted_runner.

      ENDMETHOD.

    ENDCLASS.

    CLASS yltc_create_race DEFINITION
    INHERITING FROM lth_base
      FINAL
      FOR TESTING
      DURATION SHORT
      RISK LEVEL HARMLESS.

      PUBLIC SECTION.
      PROTECTED SECTION.
      PRIVATE SECTION.
        METHODS one_runner_valid_race FOR TESTING
          RAISING ycx_race_invalid.
        METHODS no_runner_valid_race FOR TESTING
          RAISING ycx_race_invalid.
        METHODS neg_num_runners_valid_race FOR TESTING.

        METHODS assert_valid_race
          IMPORTING iv_num_runner TYPE i
          RAISING   ycx_race_invalid.
        METHODS assert_invalid_race
          IMPORTING iv_num_runner TYPE i.

    ENDCLASS.



    CLASS yltc_create_race IMPLEMENTATION.
      METHOD assert_invalid_race.
        TRY.
            mo_race = ycl_factory=>get(  )->create_race( iv_num_runner ).
        ENDTRY.
        cl_abap_unit_assert=>assert_bound( lx_race ).
*          EXPORTING
*            act =
*           msg =
*           level            = if_abap_unit_constant=>severity-medium
*           quit             = if_abap_unit_constant=>quit-test
*  RECEIVING
*           assertion_failed =
*        ).
      ENDMETHOD.

      METHOD assert_valid_race.
        mo_race = ycl_factory=>get( )->create_race( iv_num_runner ).
      ENDMETHOD.

      METHOD neg_num_runners_valid_race.
        assert_invalid_race( iv_num_runner = -1 ).
      ENDMETHOD.

      METHOD no_runner_valid_race.
        assert_valid_race( iv_num_runner = 0 ).
      ENDMETHOD.

      METHOD one_runner_valid_race.
        inject_unstarted_runner( ).
        assert_valid_race( iv_num_runner = 1 ).
      ENDMETHOD.

    ENDCLASS.
