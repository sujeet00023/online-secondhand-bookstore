<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if(session.getAttribute("adminEmail")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@ include file="./controller/connection.jsp"%>
<%
    String email = request.getParameter("email");
    String sql = "select * from users";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    int count = 0;
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>View Books</title>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="../css/style.css">
</head>
<style>
    .cart-basket {
        font-size: 12px;
        position: absolute;
        top: -6px;
        right: -5px;
        width: 18px;
        height: 22px;
        color: #fff;
        background-color: red;
        border-radius: 40%;
    }

    @media screen and (max-width:481px) {
        table {
            font-size: 7px;
        }

        .table td,
        .table th {
            padding: .2rem;
        }

        .navbar-brand {
            font-size: large;
        }
    }
</style>

<body onload="myFunction()">
<script>
function myFunction() {
  $("#viewUserModel").modal()
}
</script>
    <section>
        <nav class="navbar navbar-expand-sm navbar-light bg-light position-relative p-1 m-2 rounded shadow-lg">
            <a class="navbar-brand p-1 head-shadow text-danger" href="index.jsp">SECONDHAND-BOOK STORE</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse " id="navbarSupportedContent">
                <div class="navbar-nav ml-auto mr-lg-5">
                    <ul class="navbar-nav">
                        <li class="nav-link nav-item mr-lg-2 dropdown" id="navbarSupportedContent">
                            <a class="dropdown-toggle text-dark" href="#" role="button" id="dropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user-circle fa-2x" style="font-size:x-large;"> Hi, <%
                                        out.print(session.getAttribute("adminEmail"));%></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="./changePassword.jsp"><i class="fas fa fa-key"></i>
                                    Change
                                    Password</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href=""><i class="fas fa fa-gear"></i> Setting</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-center" href="./controller/logout.jsp"><button
                                        class=" btn btn-danger"><i class="fas fa fa-sign-out"></i> Logout</button></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <nav class="nav nav-justified bg-primary p-2 m-2 rounded shadow ">
            <a class="nav-item nav-link rounded active text-white" href="index.jsp">Dashboard</a>
              <a class="nav-item nav-link text-white active" href="viewBooks.jsp">View Books</a>
        <a class="nav-item nav-link rounded text-white" href="viewOrders.jsp">View Orders</a>
        <a class="nav-item nav-link rounded text-white" href="viewUsers.jsp">View Users</a>
        </nav>
    </section>

    <section class="" id="contact">
        <div class="container">
            <h3 class="text-center m-3">View Users</h3>
           <hr>
           <table class="table">
                <thead>
                <tr class="table bg-light text-dark text-center">
                <th scope="col">Sr No</th>
                <th scope = "col">Name</th>
                <th scope="col">Email ID</th>
                <th scope="col">Gender</th>
                <th scope="col">Contact No</th>
                <th scope="col">City</th>
                <th scope="col">Action</th></tr > 
                </thead>
                <tbody class="text-center text-dark" id="tableBody">
                    <% while(rs.next()){ count++;
                        %>
                <tr>
                    <td><% out.println(count); %></td>
                    <td><% out.println(rs.getString(2)); %></td>
                    <td><% out.println(rs.getString(3)); %></td>
                    <td><% out.println(rs.getString(4)); %></td>
                    <td><% out.println(rs.getString(5)); %></td>
                    <td><% out.println(rs.getString(6)); %></td>
                    <td><a href="viewSingleUser.jsp?id=<% out.println(rs.getString(1)); %>"><button type="button" class="btn btn-secondary mx-1"><i class='fa fa-eye'></i></button></a><a href="./deleteUser.jsp?no=<% out.println(rs.getString(1)); %>"><button type="button" class="btn btn-danger"><i class='fa fa-trash'></i></button></a></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </section>


  
   <footer class="site-footer">
        <div class="container">
            <div class="row">

                <div class="ml-auto col-lg-4 col-md-5">
                    <p class="copyright-text">Copyright &copy; 2024 Online SecondHand BookStore

                        <br>Design By: <a href="#">Sujeet Khupase</a>
                    </p>
                </div>

                <div class="d-flex justify-content-center mx-auto col-lg-5 col-md-7 col-12">
                    <p class="mr-4">
                        <i class="fa fa-envelope-o mr-1">E:</i><br>
                        <a href="https://mail.google.com/mail/">sujeetkhupase196@gmail.com</a>
                        <a href="https://mail.google.com/mail/">supportbooks@gmail.com</a>
                    </p>
                    <p><i class="fa fa-phone mr-1">M:</i>+917820906954 </p>
            </div>
        </div>
         </div>	
         
    </footer>
 
    <div class="modal fade shadow-lg" id="viewUserModel" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title m-2 head-shadow text-dark" id="exampleModalCenterTitle">User Details</h4>
                    <a href="./viewUsers.jsp"><button type="button" class="close" >
                        <span aria-hidden="true">&times;</span>
                    </button></a>
                </div>
                <div class="modal-body shadow-lg">
                    <%
                        
                        //book upload count of user
                        int bookCount = 0;
                        String sql3 = "Select count(*) from books where user='"+email+"'";
                        Statement st3 = connection.createStatement();
                        ResultSet rs3 = st3.executeQuery(sql3);
                        if(rs3.next()){
                            bookCount = Integer.parseInt(rs3.getString(1));
                        }

                         //book sold count of user
                         int bookSoldCount = 0;
                        String sql4 = "Select count(*) from books where user='"+email+"' and status='Sold'";
                        Statement st4 = connection.createStatement();
                        ResultSet rs4 = st4.executeQuery(sql4);
                         if(rs4.next()){
                            bookSoldCount = Integer.parseInt(rs4.getString(1));
                        }

                       
                        String sql2 = "Select * from users where email='"+email+"'";

                        Statement st2 = connection.createStatement();
                        ResultSet rs2 = st2.executeQuery(sql2);
                        if(rs2.next()){
                    %>
                    <ul class="list-group">
                        <li class="list-group-item"><strong>Name :  <% out.print(rs2.getString(1)); %></strong></li>
                        <li class="list-group-item"><strong>Email :<% out.print(rs2.getString(2)); %></strong></li>
                        <li class="list-group-item"><strong>Gender :<% out.print(rs2.getString(3)); %></strong></li>
                        <li class="list-group-item"><strong>Contact No :<% out.print(rs2.getString(4)); %></strong></li>
                        <li class="list-group-item"><strong>City :<% out.print(rs2.getString(5)); %></strong></li>
                        <li class="list-group-item bg-danger"><strong>Total Books Uploaded : <% out.print(bookCount); %></strong></li>
                        <li class="list-group-item bg-success"><strong>Total Books Sold : <% out.print(bookSoldCount); %></strong></li>
                    </ul>
                    <%
                      }
                    %>
                </div>
                <div class="modal-footer mt-2">
                    <a href="./viewUsers.jsp"><button type="button" class="btn btn-secondary shadow">Close</button></a>
                </div>
            </div>
        </div>
    </div>
    <!-- View user Model -->

    <!-- SCRIPTS -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>


</body>

</html>