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
	String sql = "select * from books";
Statement st = connection.createStatement();
ResultSet rs = st.executeQuery(sql);
int count=0;


Statement st3 = connection.createStatement();
ResultSet rs3 = st3.executeQuery(sql);

int bookcount = 0;
while(rs3.next()){
	bookcount++;
}


String sql4 = "select * from books where status = 'Sold'";
Statement st4 = connection.createStatement();
ResultSet rs4 = st4.executeQuery(sql4);
int soldbookcount = 0;
while(rs4.next()){
	soldbookcount++;
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIEW BOOKS</title>
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
    .head-shadow {
        color: white;
        text-shadow: 1px 1px 2px black, 0 0 25px rgb(146, 146, 175), 0 0 5px rgb(140, 140, 151);
    }
    .text-shadow {
    color: white;
    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px blue;
    }

    @media screen and (max-width:481px) {
        table {
            font-size: 5px;
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

        .container-sm {
            display: inline;
        }

        .btn-danger,
        .btn-secondary,
        .btn-primary,
        .btn-dark {
            font-size: xx-small;
        }
    }
</style>   
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
            <a class="nav-item nav-link rounded active text-white" href="index.jsp">DashBoard</a>
              <a class="nav-item nav-link text-white active" href="viewBooks.jsp">View Books</a>
        <a class="nav-item nav-link rounded text-white" href="viewOrders.jsp">View Orders</a>
        <a class="nav-item nav-link rounded text-white" href="viewUsers.jsp">View Users</a>
        </nav>
        </section>
        
        
        		<section>
        				<div class="conatiner-sm m-2 text-capitalize">
        					<h2 class="text-center head-shadow text-dark m-3">VIEW BOOKS</h2>
        						<hr>
        							<table class="table text-center shadow-lg rounded">
        								<thead>
        									<tr class="text-info head-shadow-lg rounded">
        										<td colspan="7">
        											<h2 class="rounded shadow p-1">
        													<strong>Total Book Uploaded: <% out.print(bookcount); %></strong>
        														
        												</h2>
        											</td>
        								<td colspan="7">
        									<h2 class="rounded shadow p-1">
        										<strong>Total Books Sold: <% out.print(soldbookcount); %></strong>
        										</h2>
        								</td>
        							</tr>
        							
        					<tr class="bg-dark text-white shadow rounded"> 
        					
        							<th scope="col">SR NO</th>
        							<th scope="col">USERNAME</th>
        							<th scope="col">IMAGE</th>
        							<th scope="col">BOOK NAME</th>
        							<th scope="col">AUTHOR NAME</th>
        							<th scope="col">CATEGORY</th>
        							<th scope="col">LANGUAGE</th>
        							<th scope="col">PURCHASE DATE</th>
        							<th scope="col">BOOK CONDITION</th>
        							<th scope="col">ORIGINAL PRICE</th>
        							<th scope="col">SELLING PRICE</th>
        							<th scope="col">UPLOAD DATE</th>
        							<th scope="col">BOOK STATUS</th>
        							<th scope="col">SELLING DATE</th>
        					</tr>
        			</thead>
        	<tbody>
      		<%
      			while(rs.next()){
      				count++;
      				String sql2 = "select * from users where email = '"+rs.getString("user")+"'";
      				Statement st2 = connection.createStatement();
      				ResultSet rs2 = st2.executeQuery(sql2);
      				rs2.next();
      			
      		
      		
      		%>  
      		
      		
      		<tr class="rounded shadow">
      		<td><% out.print(count); %></td>
      		<td><% out.print(rs2.getString("name")); %></td>
      		<td><img src="../images/Book/<% out.print(rs.getString("image")); %>" width="100px" height="100px" class="shadow rounded"></td>
      		<td><% out.print(rs.getString("book_name")); %></td>
      		<td><% out.print(rs.getString("auther_name")); %></td>
      		<td><% out.print(rs.getString("category")); %></td>
      		<td><% out.print(rs.getString("book_language")); %></td>
      		<td><% out.print(rs.getString("purchase_date")); %></td>
      		<td><% out.print(rs.getString("book_condition")); %></td>
      		<td><% out.print(rs.getString("original_price")); %></td>
      		<td><% out.print(rs.getString("selling_price")); %></td>
      		<td><% out.print(rs.getString("upload_date")); %></td>
      		<td><% out.print(rs.getString("status")); %></td>
      		<td><% out.print(rs.getString("selling_date")); %></td>
      		
      		</tr>

      		<%} %>
      		</tbody>
        													
   		</table>
        				
    </div>
</section>

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