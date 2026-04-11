CLASS zcl_861_internal_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_861_internal_table IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA numbers TYPE TABLE OF i.
    DATA number TYPE i.

    numbers = VALUE #( ( 1 ) ( 2 ) ( 3 ) ( 4 ) ( 5 ) ).
    LOOP AT numbers INTO number.
      out->write( number ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
