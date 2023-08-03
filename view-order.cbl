       IDENTIFICATION DIVISION.
       PROGRAM-ID. view-order.
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
       01 END-OF-FILE PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
       PERFORM OPENING-PROCEDURE
       MOVE 0 TO END-OF-FILE.
       PERFORM READ-PRODUCT UNTIL END-OF-FILE = 1.
       PERFORM CLOSING-PROCEDURE
       GOBACK.

       OPENING-PROCEDURE.
       OPEN I-O ORDERS-FILE.

       CLOSING-PROCEDURE.
       CLOSE ORDERS-FILE.

       READ-PRODUCT.
       READ ORDERS-FILE
           AT END MOVE 1 TO END-OF-FILE
       END-READ.

       IF END-OF-FILE = 0
           DISPLAY "Id: " ORDER-ID
           " Customer name: " ORDER-CUSTOMER-NAME
           " Date: " ORDER-DATE
           DISPLAY
           "Status: " ORDER-STATUS
           DISPLAY
           "Id producto: " PRODUCT-ID
           " Product name: " PRODUCT-NAME
           " Quantity: " QUANTITY
           " Price: " PRICE
       DISPLAY "-------------------------------------------------------"
       "--------------------------------------------------------------"
       END-IF.
