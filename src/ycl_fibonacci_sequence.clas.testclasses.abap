CLASS ltcl_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: mo_cut TYPE REF TO ycl_fibonacci_sequence.
    METHODS:
      setup,
      boundary_conditions FOR TESTING,
      fibonaci_3_is_2 FOR TESTING,
      fibonaci_4_is_3 FOR TESTING,
      fibonaci_5_is_12586269025 FOR TESTING.


    METHODS:
      element_5_is_available FOR TESTING,
      elemnt_5_is_not_in_empty_list FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW ycl_fibonacci_sequence(  ).
  ENDMETHOD.

  METHOD boundary_conditions.
    cl_abap_unit_assert=>assert_equals( exp = 1 act = mo_cut->fibonacci( 1 ) ).
    cl_abap_unit_assert=>assert_equals( exp = 1 act = mo_cut->fibonacci( 2 ) ).
  ENDMETHOD.

  METHOD fibonaci_3_is_2.
    cl_abap_unit_assert=>assert_equals( exp = 2 act = mo_cut->fibonacci( 3 ) ).
  ENDMETHOD.

  METHOD fibonaci_4_is_3.
    cl_abap_unit_assert=>assert_equals( exp = 3 act = mo_cut->fibonacci( 4 ) ).
  ENDMETHOD.

  METHOD fibonaci_5_is_12586269025.
    "cl_abap_unit_assert=>assert_equals( exp = 12586269025 act = mo_cut->fibonacci( 50 ) ).
  ENDMETHOD.

  METHOD element_5_is_available.
    cl_abap_unit_assert=>assert_true( act = mo_cut->search( iv_element = '5' iv_string  = '5' ) ).
    cl_abap_unit_assert=>assert_true( act = mo_cut->search( iv_element = '5' iv_string  = '125' ) ).
  ENDMETHOD.

  METHOD elemnt_5_is_not_in_empty_list.
    cl_abap_unit_assert=>assert_false(  act = mo_cut->search( iv_element = '5' iv_string  = '' ) ).
  ENDMETHOD.

ENDCLASS.
