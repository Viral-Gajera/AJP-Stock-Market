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
        <title>Authentication</title>
    </head>
    <body class="min-h-screen text-white bg-gradient-to-bl from-gray-900 to-black" >         
            <%@page import="java.sql.*" %>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajp","root","");
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery("select * from user");

                String USER_EMAIL = request.getParameter("email");
                String USER_PASSWORD = request.getParameter("password");
                int USER_ID = -1 ;

                Boolean user_matched = false;

                while(rs.next()){
                    if(USER_EMAIL.equals(rs.getString("email")) && USER_PASSWORD.equals(rs.getString("password"))){
                        user_matched = true;
                        USER_ID = rs.getInt("user_id");
                        break;
                    }
                }
            %>


            <!-- NVIGATION BAR -->
            <section>
                <div
                    class="flex items-center justify-between w-11/12 h-16 mx-auto">
                    <!-- LEFT SECTION : LOGO -->
                    <div class="flex items-center">
                        <span>
                            <a href="./index.html">
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
                    </div>
                </div>
            </section>

            <!-- ALERT -->
            <section class="flex items-center justify-center mt-48 text-black" >
                <div class="px-20 py-5 text-center bg-white rounded" >
                    <div class="my-2 font-bold" >Alert</div>
                    <div class="my-2" >
                        <%
                        if(user_matched){
                            response.sendRedirect("dashbord.jsp?user_id="+USER_ID);
                        }
                        else{
                            out.println("Invalid Email or Password");
                        }
                        %>
                    </div>
                    <div>
                        <button class="px-2 py-2 my-3 text-white rounded bg-primary" >
                            <a href="./login.jsp">Try Again</a>
                        </button>
                    </div>
                </div>
            </section>
    </body>
</html>
