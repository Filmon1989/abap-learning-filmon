CLASS zcl_861_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_861_local_class IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

 connection = NEW #(
  i_carrier_id = 'LH'
  i_connection_id = '0400'
  ).
    APPEND connection TO connections.

 connection = NEW #(
  i_carrier_id = 'AA'
  i_connection_id = '0017'
 ).
     APPEND connection TO connections.

  connection = NEW #(
  i_carrier_id = 'SQ'
  i_connection_id = '0001'
  ).
    APPEND connection TO connections.

      LOOP AT connections INTO DATA(conn_ref).
     out->write( conn_ref->get_connection_string( ) ).
  ENDLOOP.
  out->write( |Total objects created: { lcl_connection=>conn_counter }| ).

  ENDMETHOD.

ENDCLASS.

