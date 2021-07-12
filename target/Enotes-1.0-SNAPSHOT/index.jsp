<%-- 
    Document   : index
    Created on : Jul 11, 2021, 10:30:04 PM
    Author     : Ahmed
--%>

<%@page import="com.Db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  

        UserDetails details5 = (UserDetails) session.getAttribute("user");
        
        if(details5 != null){
            response.sendRedirect("home.jsp");
        }
    
    %>
<!DOCTYPE html>
<html>
    <head>
        
        <style type="text/css">
            .back-img{
                background: url("imgs/bg_1.jpg");
                width: 100%;
                height: 100vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="all_components/allcss.jsp"%>
    </head>
    <body>
        
        <%@include file="all_components/navbar.jsp" %>
        
        <% 

            Connection conn = DBConnect.getConn();
            System.out.println(conn);
        
        %>
        
        <div class="container-fluid back-img">
       
            <div class="text-center">
                <h1 class="text-white"><i class="fa fa-book" aria-hidden="true"></i> Enotes Save your Notes</h1>
                <a href="login.jsp" class="btn btn-light"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
                <a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
            </div>
        </div>
        

        <!-- footer here -->

    </body>
</html>
