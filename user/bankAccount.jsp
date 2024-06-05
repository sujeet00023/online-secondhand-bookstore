<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@page import="java.sql.*" %>
<%@ include file="./controller/connection.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
    String userEmail=(String)session.getAttribute("email");
    String sql3="select * from cart where user = '"+userEmail+"'"; 
    Statement st3=connection.createStatement(); 
    ResultSet rs3=st3.executeQuery(sql3); 
    int countCart=0;
     while(rs3.next()){ 
         countCart++; 
         } 
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <title>My books</title>

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
    .text-shadow {
    color: white;
    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
    }

    @media screen and (max-width:481px) {
        table {
            font-size: 4.5px;
        }

        .table td,
        .table th {
            padding: .1rem;
        }

        .navbar-brand {
            font-size: large;
        }

        img {
            width: 20px;
            height: 20px;
        }
        .container-sm{
            display:inline;
        }
    }
</style>
<script>

function updateTime() {
	  var now = new Date();
	  var hours = now.getHours();
	  var minutes = now.getMinutes();
	  var seconds = now.getSeconds();
	  
	  
		hours = (hours < 10 ? "0" : "") + hours;
		minutes = (minutes < 10 ? "0" : "") + minutes;
		seconds = (seconds < 10 ? "0" : "") + seconds;
	document.getElementById("current-Time").innerHTML = hours + ":" + minutes + ":" + seconds;	
}


setInterval(updateTime, 1000);

updateTime();

</script>


<body>
<%
    if(request.getParameter("msg")!=null){
       %>
        <script>
         alert("Bank Account already exists!\nPlease try another account.");
        </script>
       <%
    }
    if(request.getParameter("addAccount")!=null){
       %>
        <script>
         alert("Please add your bank account first?");
        </script>
       <%
    }
    
%>
<%

Date currentDate = new Date();
SimpleDateFormat sdf= new SimpleDateFormat("YYYY-MM-dd");

String FormattedDate = sdf.format(currentDate);

%>
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
                                        out.print(session.getAttribute("name"));%></i>
                            </a>
                            <div>
                          <%=FormattedDate %> <span id="current-Time"> </span></div>
                            <div>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="./myOrders.jsp"><i class="fas fa fa-shopping-bag"></i> My
                                    Orders</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="./changePassword.jsp"><i class="fas fa fa-key"></i>
                                    Change
                                    Password</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="./bankAccount.jsp"><i class="fas fa fa-plus"></i> Add
                                    Bank
                                    Account</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-center" href="./controller/logout.jsp"><button
                                        class=" btn btn-danger"><i class="fas fa fa-sign-out"></i> Logout</button></a>
                            </div>
                        </li>
                        <li class="nav-link nav-item">
                            <a href="myCart.jsp" class="cart position-relative d-inline-flex">
                                <i class="fa fa-shopping-cart fa-2x"></i>
                                <span class="cart-basket d-flex align-items-center justify-content-center">
                                    <strong>
                                        <% out.print(countCart); %>
                                    </strong>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <nav class="nav nav-justified bg-primary p-2 m-2 rounded shadow ">
            <a class="nav-item nav-link rounded active text-white" href="index.jsp">Dashboard</a>
            <a class="nav-item nav-link rounded text-white" href="uploadBook.jsp">Upload
                Books</a>
            <a class="nav-item nav-link rounded text-white" href="myBooks.jsp">My Books</a>
            <a class="nav-item nav-link rounded text-white" href="viewBooks.jsp">View Books</a>
        </nav>
    </section>

    <!-- CONTACT -->
    <section>
        <div class="container my-3 shadow rounded p-4">
            <h2 class="text-center  text-warning text-shadow"><strong>Bank Account Details </strong></h2>
            <hr>
          <div class="container shadow-lg col-5 p-4">
            <form action="./controller/bankAccount.jsp">
                <div class="form-group">
                  <label for="inputEmail4">Your Name</label>
                  <input type="text" class="form-control" id="inputEmail4" name="userName" placeholder="Your Name" required>
                </div>
                <div class="form-group">
                  <label for="inputAddress">Account No:</label>
                  <input type="text" class="form-control" id="inputAddress" name="accountNo" placeholder="Enter your account no" required>
                </div>
                <div class="form-group">    
                  <label for="inputAddress2">Bank Name</label>
                  <input type="text" class="form-control" id="inputAddress2" name="bankName" placeholder="Enter your bank name" required>
                </div>
                  <div class="form-group">
                    <label for="inputCity">IFCE Code:</label>
                    <input type="text" class="form-control" name="code" id="inputCity" required>
                  </div>
                  <div class="form-group">
                    <label for="inputZip">Branch</label>
                    <input type="text" class="form-control" name="branch" id="inputZip" required>
                  </div>
                <button type="submit" class="btn btn-primary">Add Account</button>
              </form>
          </div>
        </div>
    </section>


    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
            <div class="row">

                <div class="ml-auto col-lg-4 col-md-5">
                    <p class="copyright-text">Copyright &copy; 2022 SecondHand Book-Store

                        <br>Design By: <a href="#">Saurabh & Smruti</a>
                    </p>
                </div>

                <div class="d-flex justify-content-center mx-auto col-lg-5 col-md-7 col-12">
                    <p class="mr-4">
                        <i class="fa fa-envelope-o mr-1"></i><br>
                        <a href="#">saurabhdoshi2001@gmail.com</a>
                        <a href="#">gandhesm31@gmail.com</a>
                    </p>
                    <p><i class="fa fa-phone mr-1"></i> 7058734788 <br> 9119566586</p>
            
                </div>
            </div>
        </div>
    </footer>


    <!-- SCRIPTS -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>

</body>

</html>