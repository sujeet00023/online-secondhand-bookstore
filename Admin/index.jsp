<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
    if(session.getAttribute("adminEmail")==null){
       response.sendRedirect("../index.jsp");
    }
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file= "./controller/connection.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN DASHBOARD</title>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/aos.css">
	<link rel="stylesheet" href="../css/custom.css">
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
        .table th {s
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
</head>

<% 

	String userEmail = (String)session.getAttribute("email");
	String sql1 = "Select * from users";
	Statement st1 = connection.createStatement();
	ResultSet rs1 = st1.executeQuery(sql1);
	int usercount = 0;
	while(rs1.next()){
		usercount++;
	}

	
	String sql2= "select count(*) from books";
	Statement st2 = connection.createStatement();
	ResultSet rs2 = st2.executeQuery(sql2);
	int bookcount = 0;
	if(rs2.next()){
		bookcount = Integer.parseInt(rs2.getString(1));
	}
	int bookSoldCount = 0;
	
	String sql3 = "select count(*) from books where status = 'Sold'";
	Statement st3= connection.createStatement();
	ResultSet rs3 = st3.executeQuery(sql3);
	if(rs3.next()){
		bookSoldCount = Integer.parseInt(rs3.getString(1));
	}
	int totalEarn = bookSoldCount*40;
	
	String sql4 = "select * from orders";
	Statement st4 = connection.createStatement();
	ResultSet rs4 = st3.executeQuery(sql4);
	int countOrders = 0;
	
	while(rs4.next()){
		countOrders++;
	}
	
	
	Date date = new Date();
	SimpleDateFormat uft = new SimpleDateFormat("YYYY-MM-dd");
	String sellindDate = uft.format(date);
	int month = date.getMonth();
	
%>


<body>


<%

if(request.getParameter("loginMsg") != null){
	%>
	<script>
		alert('Login Successfull.........!');
	
		</script>
		<% 
}
if(request.getParameter("accountmsg")!= null){
	%>
	<script>
	alert("Bank Account added Successfully........!");
</script>
<% 
}
if(request.getParameter("bookmsg")!=null){
	%>
	<script>
		alert("Book uploaded successfully......!");
	</script>
	<%
}
%>

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
        <div class="container-sm text-capitalize ">
            <h2 class="text-center m-3 text-dark head-shadow"><strong>Welcome !!</strong></h2>
            <hr>

            <div class="container">
                <div class="row">
                    <div class="col-sm-6 mt-2">
                        <div class="card bg-warning shadow-lg" >
                            <div class="card-body text-center text-white text-shadow">
                              <h5 class="card-title"><i class="fa fa-users fa-3x"></i></h5>
                              <hr>
                              <h2 class="card-subtitle mb-2"><% out.println(usercount);%></h2>
                              <hr>
                              <h3 class="card-text">Users</h3>
                            </div>
                          </div>
                    </div>
                    <div class="col-sm-6 mt-2">
                        <div class="card bg-secondary shadow-lg">
                            <div class="card-body text-center text-white text-shadow">
                              <h5 class="card-title"><i class="fa fa-book fa-3x"></i></h5>
                              <hr>
                              <h2 class="card-subtitle mb-2"><% out.println(bookcount);%></h2>
                              <hr>
                              <h3 class="card-text">Books Uploaded</h3>
                            </div>
                          </div>
                    </div>
                    <div class="col-sm-6 mt-2">
                        <div class="card bg-success shadow-lg">
                            <div class="card-body text-center text-white text-shadow">
                              <h5 class="card-title"><i class="fa fa-bank fa-3x"></i></h5>
                              <hr>
                              <h2 class="card-subtitle mb-2"><i class="fa fa-rupee"></i> <% out.println(totalEarn);%></h2>
                              <hr>
                              <h3 class="card-text text-shadow">Earning's</h3>
                            </div>
                          </div>
                    </div>
                    <div class="col-sm-6 mt-2">
                        <div class="card bg-danger shadow-lg">
                            <div class="card-body text-center text-white text-shadow">
                              <h5 class="card-title"> <i class="fa fa-shopping-bag fa-3x"></i></h5>
                              <hr>
                              <h2 class="card-subtitle mb-2"><% out.println(bookSoldCount);%></h2>
                              <hr>
                              <h3 class="card-text">Book Sold</h3>
                            </div>
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
         </div>	
         
    </footer>


    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/custom.js"></script>

</body>
</html>