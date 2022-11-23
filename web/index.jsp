<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- MATA TAGS -->
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0" />

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
        <title>Home page</title>
    </head>

    <body
        class="min-h-screen text-white bg-gradient-to-bl from-gray-900 to-black">
        
        <!-- DATABASE ACCESS -->
        <%@page import="java.sql.*" %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection =
                DriverManager.getConnection("jdbc:mysql://localhost:3306/ajp","root","");
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("select * from stock");
        %>
        
        
        <!-- NAVIGATION BAR -->
        <section>
            <div
                class="flex items-center justify-between w-11/12 h-16 mx-auto">
                <!-- LEFT SECTION : LOGO -->
                <div class="flex items-center">
                    <span>
                        <a href="./index.jsp">
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
                        class="mx-2 login-btn hover:text-primary"
                        href="./login.jsp">
                        Login
                    </a>
                    <a
                        class="mx-2 signUp-btn hover:text-primary"
                        href="./signUp.jsp">
                        Sign up
                    </a>
                </div>
            </div>
        </section>

        <!-- HERO SECTION -->
        <section
            class="flex items-center justify-center mt-24">
            <div
                class="flex flex-col items-center justify-center w-5/6 h-96">
                <!-- TEXT : Analyse.... -->
                <div class="text-4xl italic">
                    <span
                        class="bg-primary m-2 inline-block skew-x-[10deg] p-2 text-6xl">
                        Analyse
                    </span>
                    All Your
                </div>
                <div class="text-4xl italic">
                    Stock Market Data Here
                </div>
                <div
                    class="text-primary m-3 inline skew-x-[-10deg] bg-white p-3 text-7xl font-bold">
                    Trading View
                </div>
            </div>
        </section>

        <!-- MARKET OVERWIEW -->
        <section class="h-auto mb-10 mt-52">
            <div
                class="w-5/6 mx-auto my-2 bg-gray-800 rounded-lg">
                <div
                    class="pt-5 text-2xl font-bold text-center">
                    Market Overview
                </div>
                <div
                    class="flex flex-wrap items-center justify-center pb-8 mt-8">
                    <!-- CARD -->

                    <!-- NIFTY 50 -->
                    <div
                        class="p-5 m-2 text-center bg-black border border-black rounded-lg w-52 hover:border-white">
                        <div class="">
                            <%
                                rs.next();
                                out.println(rs.getString(2));
                            %>
                        </div>
                        <div class="text-2xl">
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
                        class="p-5 m-2 text-center bg-black border border-black rounded-lg w-52 hover:border-white">
                        <div class="">
                            <%
                                rs.next();
                                out.println(rs.getString(2));
                            %>
                        </div>
                        <div class="text-2xl">
                            <%
                                out.println(rs.getFloat(3));
                            %>
                        </div>
                        <div class="text-red-500">
                            614.01 (1.03%)
                        </div>
                    </div>

                    <!-- BANK NIFTY -->
                    <div
                        class="p-5 m-2 text-center bg-black border border-black rounded-lg w-52 hover:border-white">
                        <div class="">
                            <%
                                rs.next();
                                out.println(rs.getString(2));
                            %>
                        </div>
                        <div class="text-2xl">
                            <%
                                out.println(rs.getFloat(3));
                            %>
                        </div>
                        <div class="text-red-500">
                            496.12 (1.03%)
                        </div>
                    </div>

                    <!-- NIFTY 500 -->
                    <div
                        class="p-5 m-2 text-center bg-black border border-black rounded-lg w-52 hover:border-white">
                        <div class="">
                            <%
                                rs.next();
                                out.println(rs.getString(2));
                            %>
                        </div>
                        <div class="text-2xl">
                            <%
                                out.println(rs.getFloat(3));
                            %>
                        </div>
                        <div
                            class="text-green-500">
                            0.90 (1.58%)
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
