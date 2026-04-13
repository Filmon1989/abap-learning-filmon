CLASS zcl_861_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_861_eml IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA agencies_upd TYPE TABLE FOR UPDATE /dmo/i_agencytp.

    agencies_upd = VALUE #(
      ( agencyid = '0700861'
        name     = 'New Agency Name' )
    ).

    MODIFY ENTITIES OF /dmo/i_agencytp
      ENTITY /dmo/agency
      UPDATE FIELDS ( name )
      WITH agencies_upd.

    COMMIT ENTITIES.

    out->write( `Method execution finished!` ).

  ENDMETHOD.

ENDCLASS.
