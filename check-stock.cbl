       IDENTIFICATION DIVISION.
       PROGRAM-ID. check-stock.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

      *Creating physical file in dynamic mode.
       FILE-CONTROL.
       COPY "physical-file.cbl".

       DATA DIVISION.
       FILE SECTION.
      *Logic file with products fields.
       COPY "logic-file.cbl".

       WORKING-STORAGE SECTION.
       01 END-OF-FILE PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
       PERFORM OPENING-PROCEDURE
       PERFORM SHOW-FIELDS
       MOVE 0 TO END-OF-FILE.
       PERFORM READ-PRODUCT UNTIL END-OF-FILE = 1.
       PERFORM CLOSING-PROCEDURE
       GOBACK.

       OPENING-PROCEDURE.
       OPEN I-O PRODUCTS-FILE.

       CLOSING-PROCEDURE.
       CLOSE PRODUCTS-FILE.

       READ-PRODUCT.
       READ PRODUCTS-FILE
           AT END MOVE 1 TO END-OF-FILE
       END-READ.

       IF END-OF-FILE = 0
           DISPLAY "ID: " PRODUCT-ID
           " Name: " PRODUCT-NAME
           " Brand: " PRODUCT-BRAND
           " Category: " PRODUCT-CATEGORY
           " Price: " PRODUCT-PRICE
       END-IF.

       SHOW-FIELDS.
       DISPLAY "ID: " PRODUCT-ID
       " Name: " PRODUCT-NAME
       " Brand: " PRODUCT-BRAND
       " Category: " PRODUCT-CATEGORY
       " Price: " PRODUCT-PRICE.
