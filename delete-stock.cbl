       IDENTIFICATION DIVISION.
       PROGRAM-ID. delete-stock.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

      * Creating physical file in dynamic mode.
       FILE-CONTROL.
       COPY "physical-file.cbl".

       DATA DIVISION.
       FILE SECTION.
      * Logic file with products fields.
       COPY "logic-file.cbl".

       WORKING-STORAGE SECTION.
       77 YES-TO-DELETE PIC X.
       77 RECORD-FOUND PIC X.
       77 PRODUCT-ID-FIELD PIC Z(5).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
       DISPLAY "Stock preview:"
       CALL "check-stock".
       OPEN I-O PRODUCTS-FILE.
       PERFORM GET-PRODUCT-RECORD.
       PERFORM DELETE-RECORDS
       UNTIL PRODUCT-ID = ZEROES.
       CLOSE PRODUCTS-FILE.
       GOBACK.

       GET-PRODUCT-RECORD.
       PERFORM INITIALIZE-PRODUCT-RECORD.
       PERFORM INSERT-ID-PRODUCT.
       MOVE "N" TO RECORD-FOUND.
       PERFORM FIND-PRODUCT-RECORD
       UNTIL RECORD-FOUND = "S" OR PRODUCT-ID = ZEROES.

       INITIALIZE-PRODUCT-RECORD.
       MOVE SPACE TO PRODUCT-REGISTRATION.
       MOVE ZEROES TO PRODUCT-ID.

       INSERT-ID-PRODUCT.
       DISPLAY " ".
       DISPLAY "Enter a product id to delete.".
       DISPLAY "Enter a number from 1 to 99999".
       DISPLAY "Enter anything else to exit."
       ACCEPT PRODUCT-ID-FIELD.
       MOVE PRODUCT-ID-FIELD TO PRODUCT-ID.

       FIND-PRODUCT-RECORD.
       PERFORM READ-PRODUCT-ID.
       IF RECORD-FOUND = "N"
       DISPLAY "No record found with that id."
       PERFORM INSERT-ID-PRODUCT.

       READ-PRODUCT-ID.
       MOVE "S" TO RECORD-FOUND.
       READ PRODUCTS-FILE RECORD
       INVALID KEY
       MOVE "N" TO RECORD-FOUND.
       READ PRODUCTS-FILE RECORD WITH LOCK
       INVALID KEY
       MOVE "N" TO RECORD-FOUND.
       READ PRODUCTS-FILE RECORD
       INVALID KEY
       MOVE "N" TO RECORD-FOUND.

       DELETE-RECORDS.
       PERFORM SHOW-ALL-FIELDS.
       MOVE "Z" TO YES-TO-DELETE.
       PERFORM ASK-TO-DELETE
       UNTIL YES-TO-DELETE = "S" OR "N".
       IF YES-TO-DELETE = "S"
           PERFORM DELETE-RECORD.
           PERFORM GET-PRODUCT-RECORD.


       SHOW-ALL-FIELDS.
       DISPLAY " ".
       PERFORM SHOW-PRODUCT-ID.
       PERFORM SHOW-PRODUCT-NAME.
       PERFORM SHOW-PRODUCT-BRAND.
       PERFORM SHOW-PRODUCT-CATEGORY.
       PERFORM SHOW-PRODUCT-PRICE.
       DISPLAY " ".

       SHOW-PRODUCT-ID.
       DISPLAY "ID: " PRODUCT-ID.
       SHOW-PRODUCT-NAME.
       DISPLAY "Name: " PRODUCT-NAME.
       SHOW-PRODUCT-BRAND.
       DISPLAY "Brand: " PRODUCT-BRAND.
       SHOW-PRODUCT-CATEGORY.
       DISPLAY "Category: " PRODUCT-CATEGORY.
       SHOW-PRODUCT-PRICE.
       DISPLAY "Price: " PRODUCT-PRICE.

       ASK-TO-DELETE.
       DISPLAY "Are you sure you want to delete this record (Y/N)?".
       ACCEPT YES-TO-DELETE.
       IF YES-TO-DELETE = "Y"
              MOVE "S" TO YES-TO-DELETE.
       IF YES-TO-DELETE = "N"
              MOVE "N" TO YES-TO-DELETE.
       IF YES-TO-DELETE NOT = "S" AND
          YES-TO-DELETE NOT = "N"
          DISPLAY "You must be enter Y/N.".

       DELETE-RECORD.
       DELETE PRODUCTS-FILE RECORD
           INVALID KEY
             DISPLAY "Error deleting product record.".
