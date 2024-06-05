<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    if(session.getAttribute("adminEmail")==null){
       response.sendRedirect("../index.jsp");
    }
%>
<%@ page import="java.sql.*" %>
<%@ include file="./controller/connection.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	String userEmail = (String)session.getAttribute("email");

	String sql= "select order_no,order_id,buyer_name,selling_date,address,sum(price),payment_mode,book_no from orders group by order_no";
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	int count = 0;
	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ORDRES</title>
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
            font-size: 5px;
            display: inline-block;
            color: red;
        }


        .table td,
        .table th {
            padding: .20rem;
            vertical-align: top; 
            border-top: 1px solid #dee2e6;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;

        }
        .navbar-brand{
            font-size:large;
        }

    }

    @media screen and (max-width:1481px) {
        table {
            font-size: 10px;
            display: inline-block;
            color: red;
        }


        .table td,
        .table th {
            padding: .50rem;
            vertical-align: top; 
            border-top: 1px solid #dee2e6
        }
        .navbar-brand{
            font-size:large;
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
</head>
<body>

<%

Date currentDate = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
String formattedDate = sdf.format(currentDate);


%>  

<section>
        <nav class="navbar navbar-expand-sm navbar-light bg-light position-relative p-1 m-2 rounded shadow-lg">
            <a class="navbar-brand p-1 head-shadow text-danger" href="index.jsp">SECONDHAND BOOK STORE</a>
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
                            <div>
                            	<%= formattedDate %> <span id='current-Time'></span>
                            </div>
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


	<section>
		<div class="conatiner text-capitalize">
		<h2 class="text-center head-shadow text-dark m-3">VIEW ORDRES</h2>
			<hr>
				<table class="table text-center rounded shadow">
					<thead class="thead-dark shadow">
						<tr>
							<th scope="col">SR NO</th>
							<th scope="col">USERNAME</th>
							<th scope="col">ORDER ID</th>
							<th SCOPE="COL">DATE</th>
							<th scope="col">SHIPPING ADDRESS</th>
							<th scope="col">TOTAL AMOUNT</th>
							<th scope="col">MODE OF PAYMNET</th>
						</tr>
				</thead>			
						<tbody>
							<% while (rs.next()){
								count++;
									String sql2= "select * from books where bno = '"+rs.getString("book_no") + "'";
									Statement st2 =connection.createStatement();
									ResultSet rs2 = st2.executeQuery(sql2);
									rs2.next();
								
								%>				
									
									<tr>
									
										<td><% out.println(count); %></td>
										<td><% out.println(rs.getString("buyer_name")); %></td>
										<td><% out.println(rs.getString("order_id")); %></td>
										<td><% out.println(rs.getString("selling_date")); %></td>
										<td><% out.println(rs.getString("address")); %></td>
										<td><% out.println(rs.getString(6)); %></td>
										<td><% out.println(rs.getString("payment_mode")); %></td>
								
								
							<% }%>
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


    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>
		
</body>
</html>