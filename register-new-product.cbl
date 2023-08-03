       IDENTIFICATION DIVISION.
       PROGRAM-ID. register-new-product.
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
       01  IDENTIFICATOR PIC 9(6).
       01  NAME-PRODUCT PIC X(30)
           VALUE "Enter the product name: ".
       01  BRAND PIC X(30)
           VALUE "Enter the brand name: ".
       01  CATEGORY PIC X(30)
           VALUE "Enter the category name: ".
       01  PRICE PIC 9(6).

       01  YES-NO PIC X.
       01  ENTRANCE PIC X.
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
       OPEN I-O PRODUCTS-FILE.

       CLOSING-PROCEDURE.
       CLOSE PRODUCTS-FILE.

       ADD-REGISTER.
       MOVE "N" TO ENTRANCE.
       PERFORM GET-FIELDS
       UNTIL ENTRANCE = "Y".
       PERFORM WRITE-PRODUCT.
       PERFORM RESTART.

       GET-FIELDS.
       MOVE SPACE TO PRODUCT-REGISTRATION.
       DISPLAY "Enter the ID of the new product: ".
       ACCEPT PRODUCT-ID.
       DISPLAY NAME-PRODUCT.
       ACCEPT PRODUCT-NAME.
       DISPLAY BRAND.
       ACCEPT PRODUCT-BRAND.
       DISPLAY CATEGORY.
       ACCEPT PRODUCT-CATEGORY.
       DISPLAY "Enter the price: ".
       ACCEPT PRODUCT-PRICE

       PERFORM GO-ON.

       GO-ON.
       MOVE "Y" TO ENTRANCE.
       IF  PRODUCT-NAME = SPACE
       MOVE "N" TO ENTRANCE.

       WRITE-PRODUCT.
       WRITE PRODUCT-REGISTRATION.

       RESTART.
       DISPLAY
       "Do you want to store another record in the database? (Y-N)".
       ACCEPT YES-NO.
       IF YES-NO = "Y"
       MOVE "Y" TO YES-NO.
       IF YES-NO NOT = "Y"
       MOVE "N" TO YES-NO.
       GOBACK.
