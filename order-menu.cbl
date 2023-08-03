       IDENTIFICATION DIVISION.
       PROGRAM-ID. order-menu.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  OPTION PIC 9.

       PROCEDURE DIVISION.
       ORDER-MENU.
           DISPLAY "Order Management Menu"
           DISPLAY "1. Place order"
           DISPLAY "2. View order"
           DISPLAY "3. Update order status"
           DISPLAY "4. Cancel order"
           DISPLAY "5. Search order"
           DISPLAY "0. Back to Main Menu"
           DISPLAY "Enter your choice (0-5):"
           ACCEPT OPTION

           PERFORM PROCESS-OPTION UNTIL OPTION = 0.

       PROCESS-OPTION.
           IF OPTION = 1 THEN
               DISPLAY "Perform <Place Order> operation:"
               CALL "place-order"
               DISPLAY "Returning to the Order Management Menu..."
               PERFORM ORDER-MENU
           ELSE IF OPTION = 2 THEN
               DISPLAY "Perform <View Order> operation:"
               CALL "view-order"
               DISPLAY "Returning to the Order Management Menu..."
               PERFORM ORDER-MENU
           ELSE IF OPTION = 3 THEN
               DISPLAY "Perform <Update Order Status> operation:"

               PERFORM ORDER-MENU
           ELSE IF OPTION = 4 THEN
                  DISPLAY "Perform <Cancel Order> operation:"

                  PERFORM ORDER-MENU
           ELSE IF OPTION = 5 THEN
                  DISPLAY "Perform <Search Order> operation:"

                  PERFORM ORDER-MENU
           ELSE IF OPTION = 0 THEN
               GOBACK
           ELSE
               DISPLAY
               "Invalid option. Please enter a valid choice (0-5):"
               PERFORM ORDER-MENU.
