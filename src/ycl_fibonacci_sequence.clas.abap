CLASS ycl_fibonacci_sequence DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS fibonacci
      IMPORTING
        iv_number        TYPE i
      RETURNING
        value(rv_result) TYPE i.
    METHODS search
      IMPORTING
        iv_element       TYPE i
        iv_string        TYPE string
      RETURNING
        value(rv_result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS mc_number_one TYPE i VALUE 1.
    CONSTANTS mc_number_two TYPE i VALUE 2.
    METHODS exit_conditions IMPORTING iv_number TYPE i RETURNING value(rv_result) TYPE abap_bool.
ENDCLASS.



CLASS ycl_fibonacci_sequence IMPLEMENTATION.

  METHOD fibonacci.
    if exit_conditions( iv_number ) .
        rv_result = mc_number_one.
        return.
    endif.

    rv_result = fibonacci( iv_number - mc_number_one ) + fibonacci( iv_number - mc_number_two ).
  ENDMETHOD.

  METHOD exit_conditions.
    rv_result = xsdbool( iv_number = mc_number_one or iv_number = mc_number_two ).
  ENDMETHOD.


  METHOD search.

    if strlen( iv_string ) = 0.
        rv_result = abap_false.
        return.
    endif.

    if strlen( iv_string ) = 1.
        rv_result = xsdbool( iv_element = iv_string ).
        return.
    endif.

    rv_result = xsdbool( substring( val = iv_string off = fibonacci( 4 ) len = 1 ) = iv_element ).


  ENDMETHOD.

ENDCLASS.


