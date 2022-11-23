<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0" />

        <!-- TAILWIND CDN -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- FONT-AWESOME CND -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

        <!-- CONFIG JS -->
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

        <!-- CUSTOM CSS -->
        <style type="text/tailwindcss">
            ::-webkit-scrollbar {
                height: 5px;
                width: 5px;
                background-color: rgba(0, 0, 0, 0.807);
            }
            ::-webkit-scrollbar-track {
                background-color: rgba(0, 0, 0, 0.807);
            }
            ::-webkit-scrollbar-thumb {
                background: rgb(255, 255, 255);
                border-radius: 10px;
            }
        </style>
    </head>

    <body
        class="min-h-screen text-white bg-gradient-to-bl from-gray-900 to-black">

        

        <!-- NAVIGATION BAR -->
        <section
            class="sticky top-0 min-w-full border-b border-gray-700 backdrop-blur">
            <div
                class="flex items-center justify-between w-11/12 h-16 mx-auto">
                <!-- LEFT SECTION : LOGO -->
                <div class="flex items-center">
                    <span>
                        <a href="#">
                            <img
                                class="w-10 mx-2"
                                src="./img/tradingview.png"
                                alt="" />
                        </a>
                    </span>
                    <span
                        class="text-xl font-bold text-white">
                        Trading View
                    </span>
                </div>

                <!-- RIGHT SECTION : LINKS -->
                <div class="mr-2 font-bold">
                    <a
                        href="./dashbord.html"
                        class="mx-2 text-xs"
                        id="back-link"
                        >Back</a
                    >
                </div>
            </div>
        </section>

        <section class="mt-5 text-xl font-bold text-center" >
            Holdings
        </section>

        <%@page import="java.sql.*" %>
        <%@page import="java.sql.*" %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajp","root","");

            int USER_ID = Integer.parseInt( request.getParameter("user_id") );
        %>

        <div class="hidden" id="user_id" >
            <% out.println(USER_ID); %>
        </div>

        <!-- SUMMARY -->
        <section class="p-1 mt-5">
            <div class="flex items-center justify-between w-11/12 px-4 py-3 mx-auto bg-gray-800 rounded md:w-8/12">
                <div class="flex flex-col items-center justify-center" >
                    <div>Total invested</div>
                    <div><i class="fa fa-inr"></i> 
                        <%
                            Statement st1 = connection.createStatement();
                            ResultSet rs1 = st1.executeQuery("select * from holdings where user_id=" + USER_ID);

                            float Total = 0;

                            while(rs1.next()){
                                int quantity = rs1.getInt("quantity");
                                int STOCK_ID = rs1.getInt("stock_id");
                                Statement st2 = connection.createStatement();
                                ResultSet rs2 = st2.executeQuery("select * from stock where stock_id=" + STOCK_ID );
                                rs2.next();
                                float price = rs2.getFloat("LTP");
                                Total += ( quantity * price );
                            }

                            out.println(Total);
                        %>
                    </div>
                </div>
                <div class="flex flex-col items-center justify-center" >
                    <div>Total Return</div>
                    <div><i class="fa fa-inr"></i> 0</div>
                </div>
                <div class="flex flex-col items-center justify-center" >
                    <div>Current Value</div>
                    <div><i class="fa fa-inr"></i> 
                        <%
                            st1 = connection.createStatement();
                            rs1 = st1.executeQuery("select * from holdings where user_id=" + USER_ID);

                            Total = 0;

                            while(rs1.next()){
                                int quantity = rs1.getInt("quantity");
                                int STOCK_ID = rs1.getInt("stock_id");
                                Statement st2 = connection.createStatement();
                                ResultSet rs2 = st2.executeQuery("select * from stock where stock_id=" + STOCK_ID );
                                rs2.next();
                                float price = rs2.getFloat("LTP");
                                Total += ( quantity * price );
                            }

                            out.println(Total);
                        %>
                    </div>
                </div>
            </div>
        </section>

        <section class="mt-10 text-xl font-bold text-center" >
            Stock wise  Summaty
        </section>

        <!-- SUMMARY PER EACH STOCK -->
        <section class="p-1 mt-5" >
            <div class="w-11/12 mx-auto md:w-8/12" >

                <%
                    Statement st3 = connection.createStatement();
                    ResultSet rs3 = st3.executeQuery("select * from holdings where user_id = " + USER_ID);
                    
                    while(rs3.next()){
                        int STOCK_ID = rs3.getInt("stock_id");
                        int quantity = rs3.getInt("quantity");

                        Statement st4 = connection.createStatement();
                        ResultSet rs4 = st1.executeQuery("select * from stock where stock_id = " + STOCK_ID);
                        rs4.next();

                        String stock_name = rs4.getString("stock_name");
                        float stock_price = rs4.getFloat("LTP");

                        if( quantity != 0 ){
                            out.println(
                            "<div class='grid grid-cols-4 px-3 py-2 my-2 text-xs bg-gray-700 rounded' > " +
                                "<div class='flex flex-col items-center justify-center' > " +
                                    "<div>Symbol</div>" +
                                    "<div class='text-base' >" + stock_name +"</div> " +
                                "</div> " +
                                "<div class='flex flex-col items-center justify-center' > " +
                                    "<div>QTY</div>" +
                                    "<div class='text-base' >" + quantity + "</div> " +
                                "</div> " +
                                "<div class='flex flex-col items-center justify-center' > " +
                                    "<div>Total investment</div> " +
                                    "<div class='text-base' >" + quantity*stock_price + "</div>" +
                                "</div>" +
                                "<div class='flex flex-col items-center justify-center' >" +
                                    "<div>Total Return</div>" +
                                    "<div class='text-base' >0</div>" +
                                "</div>" +
                            "</div>"
                        );
                        }
                    }
                    

                %>
            </div>
        </section>

        <script>
            let user_id = Number(document.getElementById('user_id').innerHTML);
            let back_link = document.getElementById("back-link");

            back_link.href = "dashbord.jsp?user_id="+user_id;
        </script>

    </body>
</html>
