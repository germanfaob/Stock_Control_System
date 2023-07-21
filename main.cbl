       IDENTIFICATION DIVISION.
       PROGRAM-ID. main-program.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  MENU-OPTION PIC 9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM DISPLAY-MENU
           PERFORM PROCESS-OPTION UNTIL MENU-OPTION = 0
           DISPLAY "Exiting the program..."
           STOP RUN.

       DISPLAY-MENU.
           DISPLAY "Stock Management Menu"
           DISPLAY "1. Inventary Tracking"
           DISPLAY "2. Order Management"
           DISPLAY "3. Entry and Exit Registration"
           DISPLAY "4. Reports Generation"
           DISPLAY "0. Exit"
           DISPLAY "Enter your choice (0-4)".
           ACCEPT MENU-OPTION.

       PROCESS-OPTION.
           IF MENU-OPTION = 1 THEN
               CALL "inventory"
               DISPLAY "Returning to the main manu."
               PERFORM DISPLAY-MENU
           ELSE
               DISPLAY
               "Invalid option. Please enter a valid choice (0-4):"
               PERFORM DISPLAY-MENU
           END-IF.


       END PROGRAM main-program.
