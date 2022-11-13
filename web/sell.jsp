<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- TAILWIND CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- TAILWIND CDN CUSTOMIZATION -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: "#2196F3",
                    },
                },
            },
        };
    </script>

    <!-- CUSTOM STYLE -->
    <style type="text/tailwindcss">
        @layer utilities {
            ::-webkit-scrollbar {
                width: 0px;
            }
        }
    </style>

    <!-- APP TITLE -->
    <title>Sell page</title>
</head>
<body  >
<body class="min-h-screen text-white bg-gradient-to-bl from-gray-900 to-black" >

        <!-- DATABASE ACCESS -->
        <%@page import="java.sql.*" %>
        <%
            int USER_ID = Integer.parseInt(request.getParameter("user_id"));
            int STOCK_ID = Integer.parseInt(request.getParameter("stock_id"));

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajp","root","");
            Statement st = connection.createStatement();

            ResultSet rs = st.executeQuery("select quantity from holdings " + " where user_id = " + USER_ID + " and stock_id = " + STOCK_ID);

            Statement st1 = connection.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from stock where stock_id = " + STOCK_ID);
            rs1.next();
            String stock = rs1.getString("stock_name");

            int QUANTITY = 0;
            
            if(rs.next()){
                QUANTITY = rs.getInt("quantity");
            }
            else{
                QUANTITY = 0;
                out.println("No stock found <br>");
            }



            /* response.sendRedirect("dashbord.jsp?user_id="+USER_ID); */


        %>

        <section class="flex items-center justify-center min-h-screen" >
            <div class="flex flex-col items-center justify-center px-20 py-5 text-black bg-white rounded" >
                <div>
                    <%
                    if(QUANTITY == 0){
                        out.println("<img src='./img/multiplication.png' alt=''>");
                    }
                    else{
                        out.println("<img src='./img/checkmark-red.png' alt=''>");
                    }
                    %>
                    
                </div>
                <div class="mt-5">
                    <%
                        if(QUANTITY == 0){
                            out.println("You can not sell this stock");
                        }
                        else{
                            QUANTITY -= 1;
                            out.println( stock + " (Qty:1) Sell successfully");
                
                            int NumberOfRowUpdated = st.executeUpdate("update holdings set quantity = " + QUANTITY + " where `user_id` = " + USER_ID + " and `stock_id` = " + STOCK_ID );
                        }
                    %>
                </div>

                <div class="mt-1" >Total Quantity : <% out.println(QUANTITY); %> </div>
            </div>
        </section>

        <div class="hidden" id="user_id" >
            <% out.println(USER_ID); %>
        </div>

        <script>
            let user_id = Number(document.getElementById("user_id").innerHTML)
            setTimeout(function(){
                window.location.href = "dashbord.jsp?user_id="+user_id;
            }, 3000);
        </script>
    
</body>
</html>