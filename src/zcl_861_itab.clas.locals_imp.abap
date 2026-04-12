*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA conn_counter TYPE i.

    " Static constructor to fill the airport buffer
    CLASS-METHODS class_constructor.

    METHODS constructor
      IMPORTING
        i_connection_id TYPE /dmo/connection_id
        i_carrier_id    TYPE /dmo/carrier_id
      RAISING
        cx_abap_invalid_value .

    METHODS get_output
      RETURNING
        VALUE(r_output) TYPE string_table.

  PROTECTED SECTION.

  PRIVATE SECTION.
    " 1. Define the structure and table type for the airport buffer (New for Ex 15)
    TYPES: BEGIN OF st_airport,
             AirportID TYPE /dmo/airport_id,
             Name      TYPE /dmo/airport_name,
           END OF st_airport.

    TYPES tt_airports TYPE STANDARD TABLE OF st_airport
          WITH NON-UNIQUE DEFAULT KEY.

    " 2. Declare the static attribute to hold the buffered data (New for Ex 15)
    CLASS-DATA airports TYPE tt_airports.

    " 3. Existing structure for connection details (from Ex 14)
    TYPES:
      BEGIN OF st_details,
        DepartureAirport   TYPE /dmo/airport_from_id,
        DestinationAirport TYPE /dmo/airport_to_id,
        AirlineName        TYPE /dmo/carrier_name,
      END OF st_details.

    DATA details TYPE st_details.

    " 4. Instance attributes (from earlier exercises)
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.
    SELECT FROM /DMO/I_Airport
      FIELDS AirportID, Name
      INTO TABLE @airports.
  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    " Task 4: Read connection details
    SELECT SINGLE
      FROM /dmo/i_connection
      FIELDS DepartureAirport,
             DestinationAirport,
             \_Airline-Name AS AirlineName
      WHERE AirlineID = @i_carrier_id
        AND ConnectionID = @i_connection_id
      INTO CORRESPONDING FIELDS OF @details.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->connection_id = i_connection_id.
    me->carrier_id    = i_carrier_id.
    conn_counter = conn_counter + 1.
  ENDMETHOD.

  METHOD get_output.
    " Example using table expressions directly in string templates
    " We use the airports buffer filled in class_constructor
    APPEND |--------------------------------| TO r_output.
    APPEND |Carrier: { carrier_id } { details-airlinename }| TO r_output.
    APPEND |Connection: { connection_id }| TO r_output.

    " Table expression: airports[ airportid = ... ]-name
    APPEND |Departure: { details-departureairport } { airports[ airportid = details-departureairport ]-name }| TO r_output.
    APPEND |Destination: { details-destinationairport } { airports[ airportid = details-destinationairport ]-name }| TO r_output.
  ENDMETHOD.

ENDCLASS.
