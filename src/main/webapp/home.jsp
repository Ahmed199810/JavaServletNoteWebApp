<%-- 
    Document   : home
    Created on : Jul 12, 2021, 4:59:36 AM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    UserDetails userDetails4 = (UserDetails) session.getAttribute("user");
    
    if(userDetails4 == null){
        response.sendRedirect("../Enotes/login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        
    </head>
    <body>
        <%@include file="all_components/navbar.jsp" %>
        <div class="container-fluid p-0">
            <%@include file="all_components/allcss.jsp"%>
            <div class="card py-5">
                <div class="card-body text-center">
                    <img alt="" src="imgs/edit.png" class="img-fluid mx-auto" style="max-width: 300px;">
                    <h1>Start Taking your Notes</h1>
                    <a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
                </div>
            </div>
        </div>
    </body>
</html>
