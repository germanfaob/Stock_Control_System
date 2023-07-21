       IDENTIFICATION DIVISION.
       PROGRAM-ID. inventory.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  OPTION PIC 9.
       01  PRODUCT-1 PIC 99.
       01  PRODUCT-2 PIC 99.

       PROCEDURE DIVISION.
       INVENTORY-MENU.
           DISPLAY "Inventory Tracking Menu"
           DISPLAY "1. Register new product"
           DISPLAY "2. Check Stock"
           DISPLAY "3. Update Stock"
           DISPLAY "4. Search Stock"
           DISPLAY "0. Back to Main Menu"
           DISPLAY "Enter your choice (0-3):"
           ACCEPT OPTION

           PERFORM PROCESS-OPTION UNTIL OPTION = 0.

       PROCESS-OPTION.
           IF OPTION = 1 THEN
               DISPLAY "Perform <Register new product> operation:"
               CALL "register-new-product"
               PERFORM INVENTORY-MENU
           ELSE IF OPTION = 2 THEN
               DISPLAY "Perform <Check Stock> operation:"
               CALL "check-stock"
               PERFORM INVENTORY-MENU
           ELSE IF OPTION = 3 THEN
               DISPLAY "Perform Search Stock operation:"
               PERFORM INVENTORY-MENU
           ELSE IF OPTION = 0 THEN
               GOBACK
           ELSE
               DISPLAY
               "Invalid option. Please enter a valid choice (0-3):"
               PERFORM INVENTORY-MENU.

           GOBACK.
