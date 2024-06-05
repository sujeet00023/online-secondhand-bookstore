<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.Date" %> 
<%@ page import="java.text.SimpleDateFormat" %>   
<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="../controller/connection.jsp"%>

<%
    String userEmail = (String)session.getAttribute("email");
    String sql = "Select * from books where user = '"+userEmail+"'";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    int bookcount = 0;
    while(rs.next()){
        bookcount++;
    }

    int bookSoldCount = 0;
    int totalEarn = 0;
    String sql2 =  "select * from books where user = '"+userEmail+"' and status='Sold'";
    Statement st2 = connection.createStatement();
    ResultSet rs2 = st2.executeQuery(sql2);
    while(rs2.next()){
     bookSoldCount++;
     totalEarn += Integer.parseInt(rs2.getString("selling_price"))-40;
     
    }
    String sql3 = "select * from cart where user = '"+userEmail+"'";
    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql3);
    int countCart = 0;
    while(rs3.next()){
        countCart++;
    }
%>


<!DOCTYPE html>
<html lang="en">

<head>

    <title>My books</title>
    <link rel="icon" href="../images/bookStore.jpeg">
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
    <link rel="stylesheet" href="../css/custom.css">
    

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
    
    h3{
    	color:red;
    	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    	font-size:40px;
    	text-shadow: 1px 3px #ff0000;
    	
    }

</style>
<body>

<% 
   if (request.getParameter("loginMsg") !=null) {
       %>
        <script>
            alert('Login Successfull...!');
        </script>
        <%
    }
    if(request.getParameter("accountmsg")!=null){
       %>
        <script>
         alert("Bank Account added successfully!");
        </script>
       <%
    }
    if(request.getParameter("bookmsg")!=null){
       %>
        <script>
         alert("Book uploaded successfully!");
        </script>
       <%
    }
    if(request.getParameter("passMsg")!=null){
       %>
        <script>
         alert("Password changed successfully!");
        </script>
       <%
    }
%>


<%

Date currentDate = new Date();

SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");

String FormattedDate = sdf.format(currentDate);
%>




    <section>
        <nav class="navbar navbar-expand-sm navbar-light bg-light position-relative p-1 m-2 rounded shadow-lg">
            <a class="navbar-brand p-1 head-shadow text-danger" href="index.jsp">SECONDHAND BOOKSTORE</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse " id="navbarSupportedContent">
                <div class="navbar-nav ml-auto mr-lg-5">
                    <ul class="navbar-nav">
                    
                        <li class="nav-link nav-item mr-lg-2 dropdown" id="navbarSupportedContent">
                            <a class=" dropdown-toggle text-dark" href="#" role="button" id="dropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user-circle fa-2x" style="font-size:x-large;"> Hi, <%
                                        out.print(session.getAttribute("name"));%></i>
                                        
                              
                            </a>
                            <div>
                            
                            </div>
                            	<%=FormattedDate %> <span id="current-Time">
                            
                             </span>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdo wn-item" href="./myOrders.jsp"><i class="fas fa fa-shopping-bag"></i> My
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
    
    
    <section>
        <div class="container my-5">
            <h2 class="text-center m-3 text-danger text-shadow"><strong>Welcome to Our Website !! </strong></h2>
            <p id="currentTime"></p>
            <hr>
            <div class="row">
                <div class="col-sm-4">
                    <div class="card bg-info shadow-lg" style="width: 18rem;">
                        <div class="card-body text-white text-center">
                            <h2 class="card-title text-shadow"><strong>Uploaded Books</strong></h2>
                            <hr>
                            <h3 class="card-text text-shadow">  <strong><% out.print(bookcount); %></strong></h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card bg-warning shadow-lg" style="width: 18rem;">
                        <div class="card-body text-white text-center">
                            <h2 class="card-title text-shadow"><strong>Books Sold</strong></h2>
                            <hr>
                            <h3 class="card-text text-shadow"><strong><% out.print(bookSoldCount); %></strong></h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card bg-success shadow-lg" style="width: 18rem;">
                        <div class="card-body text-white text-center">
                            <h2 class="card-title text-shadow"><strong>Earnings</strong></h2>
                            <hr>
                            <h3 class="card-text text-shadow"><i class="fa fa-rupee fa-1x"> </i> <strong><% out.print(totalEarn);%></strong></h3>
                        </div>
                    </div>
                </div>
               
            </div>
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
         	
    </footer>

	
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

    <!-- SCRIPTS -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>

</body>

</html>
