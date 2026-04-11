CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    CLASS-DATA conn_counter TYPE i.

    METHODS get_connection_string
      RETURNING VALUE(result) TYPE string.

ENDCLASS.
    CLASS lcl_connection IMPLEMENTATION.

  METHOD get_connection_string.
    result = |Carrier: { carrier_id }, Connection: { connection_id }|.
  ENDMETHOD.


ENDCLASS.
