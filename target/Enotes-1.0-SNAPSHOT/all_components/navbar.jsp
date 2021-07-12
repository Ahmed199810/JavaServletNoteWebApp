<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
    
    
  <%  

        UserDetails user2 = (UserDetails) session.getAttribute("user");
        
        if(user2 == null){
            %>
                <a class="navbar-brand" href="../Enotes"><i class="fa fa-book" aria-hidden="true"></i> Enotes</a>
            <%
        }else{
            %>
                <a class="navbar-brand" href="../Enotes/home.jsp"><i class="fa fa-book" aria-hidden="true"></i> Enotes</a>
            <%
        }
    
    %>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="../Enotes/home.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="../Enotes/addNotes.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Note</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../Enotes/showNotes.jsp"><i class="fa fa-address-book-o" aria-hidden="true"></i> Show Notes</a>
      </li>
    </ul>
      
      <%  

        UserDetails user = (UserDetails) session.getAttribute("user");
        
        if(user != null){
        %>
            
        <a href="../Enotes/login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-user-circle-o" aria-hidden="true"></i> <%= user.getName() %> </a>
            <a href="LogoutServlet" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i> Logout</a>
        <%
        }else{
        %>
            <a href="../Enotes/login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
            <a href="../Enotes/register.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
        <%
        }

      %>
      
    
    
    
  </div>
      
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="container text-center">
                  <i class="fa fa-user fa-3x"></i>
                  <h5></h5>
                  
                  <table class="table">
                      <tbody>
                          <tr>
                              <th>User Id</th>
                              <th><%= user== null? "" : user.getId() %></th>
                          </tr>
                          
                          <tr>
                              <th>User Name</th>
                              <th><%= user== null? "" :user.getName()%></th>
                          </tr>
                          
                          <tr>
                              <th>User Email</th>
                              <th><%= user== null? "" :user.getEmail()%></th>
                          </tr>
                      </tbody>
                  </table>
                  
              </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
</nav>