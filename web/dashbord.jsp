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
        class="min-h-screen text-white bg-gradient-to-bl from-gray-900 via-black to-black">

        <%@page import="java.sql.*" %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection =
                DriverManager.getConnection("jdbc:mysql://localhost:3306/ajp","root","");
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("select * from stock");

           int USER_ID = Integer.parseInt( request.getParameter("user_id") );
        %>

        <div class="hidden" id="user_id" >
            <% out.println(USER_ID); %>
        </div>

        <!-- NAVIGATION BAR -->
        <section
            class="sticky top-0 z-10 min-w-full border-b border-gray-700 backdrop-blur">
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
                        href="./Holding.jsp"
                        class="mx-2 text-xs"
                        id="holdings-links"
                        >Holdings</a
                    >
                </div>
            </div>
        </section>

        <!-- MAIN SECTION -->
        <section class="mt-2">
            <div
                class="grid grid-cols-1 p-1 mx-auto md:grid-cols-2 lg:w-11/12">
                <!-- YOUR INVETMENT -->
                <div class="p-1 m-1 md:order-2">
                    <div
                        class="flex flex-col p-2">
                        <div
                            class="pl-5 pr-5 mt-2 text-base font-bold">
                            Your Invetment
                        </div>
                        <div
                            class="flex justify-between px-8 py-3 mt-8 bg-gray-800 rounded-lg mx-7">
                            <div>
                                <div><i class="fa fa-inr"></i> 0</div>
                                <div>
                                    Total&nbsp;Returns
                                </div>
                            </div>
                            <div
                                class="flex flex-col items-end">
                                <div>
                                    <i class="fa fa-inr"></i> <%
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
                                <div>
                                    Total&nbsp;Invested
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- MARTET OVERVIEW -->
                <div class="p-1 m-1 md:order-1">
                    <div
                        class="p-2 overflow-x-auto">
                        <div
                            class="pl-5 mt-2 text-base font-bold">
                            Market Overview
                        </div>
                        <div
                            class="flex py-3 pl-5 overflow-x-auto">
                            <!-- NIFTY 50 -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    <%
                                        rs.next();
                                        out.println(rs.getString(2));
                                    %>
                                </div>
                                <div
                                    class="text-lg">
                                    <%
                                        out.println(rs.getFloat(3));
                                    %>
                                </div>
                                <div
                                    class="text-green-500">
                                    240.80 (1.84%)
                                </div>
                            </div>
                            <!-- SENSEX -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    <%
                                        rs.next();
                                        out.println(rs.getString(2));
                                    %>
                                </div>
                                <div
                                    class="text-lg">
                                    <%
                                        out.println(rs.getFloat(3));
                                    %>
                                </div>
                                <div
                                    class="text-red-500">
                                    246.80 (0.41%)
                                </div>
                            </div>
                            <!-- BANK NIFTY -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    <%
                                        rs.next();
                                        out.println(rs.getString(2));
                                    %>
                                </div>
                                <div
                                    class="text-lg">
                                    <%
                                        out.println(rs.getFloat(3));
                                    %>
                                </div>
                                <div
                                    class="text-green-500">
                                    7.65 (0.03%)
                                </div>
                            </div>

                            <!-- NIFTY 500 -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    <%
                                        rs.next();
                                        out.println(rs.getString(2));
                                    %>
                                </div>
                                <div
                                    class="text-lg">
                                    <%
                                        out.println(rs.getFloat(3));
                                    %>
                                </div>
                                <div
                                    class="text-green-500">
                                    7.65 (0.03%)
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- TOP GAINER -->
                <div class="p-1 m-1 md:order-3">
                    <div
                        class="p-2 overflow-x-auto">
                        <div
                            class="pl-5 mt-2 text-base font-bold">
                            Top Gainer
                        </div>
                        <div
                            class="flex py-3 pl-5 overflow-x-auto">
                            <!-- CARD -->
                            <!-- NIFTY 50 -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    Nifty 50
                                </div>
                                <div
                                    class="text-lg">
                                    17,739.13
                                </div>
                                <div
                                    class="text-green-500">
                                    240.80 (1.84%)
                                </div>
                            </div>
                            <!-- SENSEX -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    Sensex
                                </div>
                                <div
                                    class="text-lg">
                                    60,993.69
                                </div>
                                <div
                                    class="text-red-500">
                                    246.80 (0.41%)
                                </div>
                            </div>
                            <!-- BANK NIFTY -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    Bank Nifty
                                </div>
                                <div
                                    class="text-lg">
                                    41,305.50
                                </div>
                                <div
                                    class="text-green-500">
                                    7.65 (0.03%)
                                </div>
                            </div>
                            <!-- BANK NIFTY -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    Bank Nifty
                                </div>
                                <div
                                    class="text-lg">
                                    41,305.50
                                </div>
                                <div
                                    class="text-green-500">
                                    7.65 (0.03%)
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- TOP LOSSER -->
                <div
                    class="p-1 m-1 md:order-4">
                    <div
                        class="p-2 overflow-x-auto">
                        <div
                            class="pl-5 mt-2 text-base font-bold">
                            Top Losser
                        </div>
                        <div
                            class="flex py-3 pl-5 overflow-x-auto">
                            <!-- CARD -->
                            <!-- NIFTY 50 -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    Nifty 50
                                </div>
                                <div
                                    class="text-lg">
                                    17,739.13
                                </div>
                                <div
                                    class="text-green-500">
                                    240.80 (1.84%)
                                </div>
                            </div>
                            <!-- SENSEX -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    Sensex
                                </div>
                                <div
                                    class="text-lg">
                                    60,993.69
                                </div>
                                <div
                                    class="text-red-500">
                                    246.80 (0.41%)
                                </div>
                            </div>
                            <!-- BANK NIFTY -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    Bank Nifty
                                </div>
                                <div
                                    class="text-lg">
                                    41,305.50
                                </div>
                                <div
                                    class="text-green-500">
                                    7.65 (0.03%)
                                </div>
                            </div>
                            <!-- BANK NIFTY -->
                            <div
                                class="m-2 w-52 min-w-[200px] rounded-lg border border-gray-800 bg-gray-800 p-5 text-center text-xs hover:border-white">
                                <div class="">
                                    Bank Nifty
                                </div>
                                <div
                                    class="text-lg">
                                    41,305.50
                                </div>
                                <div
                                    class="text-green-500">
                                    7.65 (0.03%)
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- WATCHLIST -->
                <div
                    class="p-1 mt-6 md:order-5">

                    <div>
                        <!-- WATCHLIST HEADING -->
                        <div class="pt-2 pr-5 text-base font-bold pl-7" >
                            WatchList
                        </div>

                        <!-- WATCHLIST TAB -->
                        <div class="flex items-center gap-4 pt-5 pl-8" >
                            <div class="border-b-[3px] border-primary" >WatchList 1</div>
                            <div>WatchList 2</div>
                            <div>WatchList 3</div>
                            <div>
                                <img class="w-5" src="./Img/icons8-plus-48.png" alt="">
                            </div>
                        </div>

                        <!-- WATCHLIST STOCK -->
                        <div class="mt-5 watchlist-stock" >
                            <div class="overflow-auto rounded-lg mx-9">

                                
                                <div href="#" class="group" >
                                    <div class="flex items-center justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>                            
                                            <%
                                                rs.next();
                                                out.println(rs.getString(2));
                                            %>
                                        </div>
                                        <div class="hidden group-hover:inline-block">
                                            <button class="px-3 py-1 mx-1 rounded bg-primary">Buy</button>
                                            <button class="px-3 py-1 mx-1 bg-red-500 rounded">Sell</button>
                                            <div class="hidden" >
                                                <% out.println(rs.getInt(1)); %>
                                            </div>
                                        </div>
                                        <div><i class="fa fa-inr"></i>
                                            <%
                                                out.println(rs.getFloat(3));
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div href="#" class="group" >
                                    <div class="flex items-center justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>                            
                                            <%
                                                rs.next();
                                                out.println(rs.getString(2));
                                            %>
                                        </div>
                                        <div class="hidden group-hover:inline-block">
                                            <button class="px-3 py-1 mx-1 rounded bg-primary">Buy</button>
                                            <button class="px-3 py-1 mx-1 bg-red-500 rounded">Sell</button>
                                            <div class="hidden" >
                                                <% out.println(rs.getInt(1)); %>
                                            </div>
                                        </div>
                                        <div><i class="fa fa-inr"></i>
                                            <%
                                                out.println(rs.getFloat(3));
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div href="#" class="group" >
                                    <div class="flex items-center justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>                            
                                            <%
                                                rs.next();
                                                out.println(rs.getString(2));
                                            %>
                                        </div>
                                        <div class="hidden group-hover:inline-block">
                                            <button class="px-3 py-1 mx-1 rounded bg-primary">Buy</button>
                                            <button class="px-3 py-1 mx-1 bg-red-500 rounded">Sell</button>
                                            <div class="hidden" >
                                                <% out.println(rs.getInt(1)); %>
                                            </div>
                                        </div>
                                        <div><i class="fa fa-inr"></i>
                                            <%
                                                out.println(rs.getFloat(3));
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div href="#" class="group" >
                                    <div class="flex items-center justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>                            
                                            <%
                                                rs.next();
                                                out.println(rs.getString(2));
                                            %>
                                        </div>
                                        <div class="hidden group-hover:inline-block">
                                            <button class="px-3 py-1 mx-1 rounded bg-primary">Buy</button>
                                            <button class="px-3 py-1 mx-1 bg-red-500 rounded">Sell</button>
                                            <div class="hidden" >
                                                <% out.println(rs.getInt(1)); %>
                                            </div>
                                        </div>
                                        <div><i class="fa fa-inr"></i>
                                            <%
                                                out.println(rs.getFloat(3));
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div href="#" class="group" >
                                    <div class="flex items-center justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>                            
                                            <%
                                                rs.next();
                                                out.println(rs.getString(2));
                                            %>
                                        </div>
                                        <div class="hidden group-hover:inline-block">
                                            <button class="px-3 py-1 mx-1 rounded bg-primary">Buy</button>
                                            <button class="px-3 py-1 mx-1 bg-red-500 rounded">Sell</button>
                                            <div class="hidden" >
                                                <% out.println(rs.getInt(1)); %>
                                            </div>
                                        </div>
                                        <div><i class="fa fa-inr"></i>
                                            <%
                                                out.println(rs.getFloat(3));
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div href="#" class="group" >
                                    <div class="flex items-center justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>                            
                                            <%
                                                rs.next();
                                                out.println(rs.getString(2));
                                            %>
                                        </div>
                                        <div class="hidden group-hover:inline-block">
                                            <button class="px-3 py-1 mx-1 rounded bg-primary">Buy</button>
                                            <button class="px-3 py-1 mx-1 bg-red-500 rounded">Sell</button>
                                            <div class="hidden" >
                                                <% out.println(rs.getInt(1)); %>
                                            </div>
                                        </div>
                                        <div><i class="fa fa-inr"></i>
                                            <%
                                                out.println(rs.getFloat(3));
                                            %>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                
                </div>

                <!-- STOCK IN NEWS -->
                <div
                    class="p-1 mt-5 md:order-6">

                    <div>
                        <!-- HEADING -->
                        <div class="pt-4 pr-5 text-base font-bold pl-7" >
                            Stock In News
                        </div>

                        <!-- STOCK -->
                        <div class="mt-5 " >
                            <div class="overflow-auto rounded-lg mx-9" >
                                <a href="">
                                    <div class="flex justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>Vodaphone idea</div>
                                        <div><i class="fa fa-inr"></i> 8.65</div>
                                    </div>
                                </a>
                                <a href="">
                                    <div class="flex justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>DCX System</div>
                                        <div><i class="fa fa-inr"></i> 308.45</div>
                                    </div>
                                </a>
                                <a href="">
                                    <div class="flex justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>Reliance Industry</div>
                                        <div><i class="fa fa-inr"></i> 2631.80</div>
                                    </div>
                                </a>
                                <a href="">
                                    <div class="flex justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>West Coast Paper Mils</div>
                                        <div><i class="fa fa-inr"></i> 583.30</div>
                                    </div>
                                </a>
                                <a href="">
                                    <div class="flex justify-between px-5 py-4 bg-gray-800 border-b border-gray-500 hover:bg-gray-600" >
                                        <div>ABB India</div>
                                        <div><i class="fa fa-inr"></i> 3155.85</div>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </section>
        
        <script>
            let user_id = Number(document.getElementById('user_id').innerHTML);
            let holdings_links = document.getElementById("holdings-links");
            holdings_links.href = "Holding.jsp?user_id="+user_id;

            let watchlist_stock = document.querySelector('.watchlist-stock'); 

            watchlist_stock.addEventListener('click', function(event){
                if (event.target.innerHTML === "Buy"){
                    let stock_id = Number(event.target.parentElement.children[2].innerHTML);
                    let URL = "buy.jsp?user_id=" + user_id + "&stock_id=" + stock_id;
                    console.log(user_id);
                    console.log(stock_id);
                    console.log(URL);
                    window.location.href=URL;
                }
                if (event.target.innerHTML === "Sell"){
                    let stock_id = Number(event.target.parentElement.children[2].innerHTML);
                    let URL = "sell.jsp?user_id=" + user_id + "&stock_id=" + stock_id;
                    console.log(user_id);
                    console.log(stock_id);
                    console.log(URL);
                    window.location.href=URL;
                }
            });
        </script>

    </body>
</html>
