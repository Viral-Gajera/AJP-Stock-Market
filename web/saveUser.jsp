<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Program 6: Forward Action Tag</title>
    </head>
    <body>
        <p>           
            <%@page import="java.sql.*" %>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajp","root","");
                
                PreparedStatement pst = connection.prepareStatement("insert into user (email, password, first_name, last_name, account_no, pan_no) values(?,?,?,?,?,?)");
                
                pst.setString(1, (String) request.getParameter("email"));
                pst.setString(2, (String) request.getParameter("password"));
                pst.setString(3, (String) request.getParameter("first_name"));
                pst.setString(4, (String) request.getParameter("last_name"));
                pst.setString(5, (String) request.getParameter("account_no"));
                pst.setString(6, (String) request.getParameter("pan_no"));

                int r = pst.executeUpdate();
            %>

            <jsp:forward page = "login.jsp" ></jsp:forward>
        </p>
    </body>
</html>
