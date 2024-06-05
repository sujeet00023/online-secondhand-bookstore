<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
    if(session.getAttribute("email")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@ page import="java.sql.*" %>
<%@ include file="./controller/connection.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    String userEmail = (String)session.getAttribute("email");

    String sql3 = "select * from cart where user = '"+userEmail+"'";
    Statement st3 = connection.createStatement();
    ResultSet rs3 = st3.executeQuery(sql3);
    int count = 0;
    while(rs3.next()){
        count++;
    }

    String sql = "select * from orders where buyer_email= '"+userEmail+"'";
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery(sql);
    int orderCount=0;
%>


   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MY ORDERS</title>
 <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/style.css">
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
</head>
<body>

<%

Date currentDate = new Date();

SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
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
                            <%= FormattedDate %> <span id="current-Time"></span>
                            </div>
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
                                        <% out.print(count); %>
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
        <div class="container text-capitalize">
            <h3 class="text-center m-3">My Orders</h3>
            <div class="row">
                <div class="form-group col-md-8">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-primary my-3 " type="submit">Search</button>
                    </form>
                </div>

            </div>

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Sr.No.</th>
                        <th scope="col">Order ID</th>
                        
                        <th scope="col">Date</th>
                        <th scope="col">Shipping Address</th>
                        <th scope="col">Total Amount</th>
                        <th scope="col">Mode of Payment</th>
                    </tr>
                </thead>
                <tbody class="">
                <%
                    while(rs.next()){
                        String sql2 = "select * from books where bno='"+rs.getString("book_no")+"'";
                        Statement st2 = connection.createStatement();
                        ResultSet rs2 = st2.executeQuery(sql2);
                        rs2.next(); 
                        orderCount++;

                %>
                    <tr>
                        <td><% out.print(orderCount); %></td>
                        <td><% out.print(rs.getString("order_id")); %></td>
                        
                        <td><% out.print(rs.getString("selling_date")); %></td>
                        <td><% out.print(rs.getString("address")); %><br>Mob No. <% out.print(rs.getString("mobile_no")); %></td>
                        <td><% out.print(rs.getString("price")); %></td>
                        <td><% out.print(rs.getString("payment_mode")); %></td>
                    </tr>
                   <% }%>
                </tbody>
            </table>


        </div>
    </section>    
<script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>
</body>
</html>