       IDENTIFICATION DIVISION.
       PROGRAM-ID. place-order.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
      *Creating physical file in dynamic mode.
       FILE-CONTROL.
       COPY "order-physical-file.cbl".

       DATA DIVISION.
       FILE SECTION.
      *Logic file with products fields.
       COPY "order-logic-file.cbl".

       WORKING-STORAGE SECTION.
       01  IDENTIFICATOR PIC 9(6).
       01  CUSTOMER-NAME PIC X(50)
           VALUE "Enter the customer name: ".
       01  DATE-ORDER PIC X(25)
           VALUE "Enter the order date: ".
       01  STATUS-ORDER PIC X(25)
           VALUE "Enter the status order: ".
       01  ID-PRODUCT PIC 9(6).
       01  NAME-PROD PIC X(40)
           VALUE "Enter the product name: ".
       01  QUANTITY-PRODUCT PIC 9(3).
       01  PRICE-PRODUCT PIC 9(6).

       01  YES-NO PIC X.
       01  ENTRANCE PIC X.
       01  MAX-ID-COUNT PIC 9(6).

       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.

       PROGRAM-BEGIN.
       PERFORM OPENING-PROCEDURE.
       MOVE "Y" TO YES-NO.
       PERFORM ADD-REGISTER
       UNTIL YES-NO = "N".
       PERFORM CLOSING-PROCEDURE.

       ENDS-PROGRAM.
       GOBACK.

       OPENING-PROCEDURE.
       OPEN I-O ORDERS-FILE.

       CLOSING-PROCEDURE.
       CLOSE ORDERS-FILE.

       ADD-REGISTER.
       MOVE "N" TO ENTRANCE.
       PERFORM GET-FIELDS
       UNTIL ENTRANCE = "Y".
       PERFORM WRITE-PRODUCT.
       PERFORM RESTART.

       GET-FIELDS.
       MOVE SPACE TO ORDER-REGISTRATION.
       DISPLAY "Enter the Id of the new order (0 to exit): ".
       ACCEPT ORDER-ID.

       IF ORDER-ID = 0
           PERFORM CLOSING-PROCEDURE
           GOBACK
       END-IF.

       DISPLAY CUSTOMER-NAME.
       ACCEPT ORDER-CUSTOMER-NAME.
       DISPLAY DATE-ORDER.
       ACCEPT ORDER-DATE.
       DISPLAY STATUS-ORDER.
       ACCEPT ORDER-STATUS.
       DISPLAY "Enter the Id product: ".
       ACCEPT PRODUCT-ID.
       DISPLAY NAME-PROD.
       ACCEPT PRODUCT-NAME.
       DISPLAY "Quantity: ".
       ACCEPT QUANTITY.
       DISPLAY "Price: ".
       ACCEPT PRICE.

       PERFORM GO-ON.

       GO-ON.
       MOVE "Y" TO ENTRANCE.
       IF  ORDER-CUSTOMER-NAME = SPACE
       MOVE "N" TO ENTRANCE.

       WRITE-PRODUCT.
       WRITE ORDER-REGISTRATION.

       RESTART.
       DISPLAY
       "Do you want to register another order? (Y-N)".
       ACCEPT YES-NO.
       IF YES-NO = "Y"
       MOVE "Y" TO YES-NO.
       IF YES-NO NOT = "Y"
       MOVE "N" TO YES-NO.
