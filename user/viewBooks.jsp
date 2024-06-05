<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
if(session.getAttribute("email")== null){
	response.sendRedirect("../index.jsp");
}
	
	%>    
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="./controller/connection.jsp" %>


<%

String userEmail = (String)session.getAttribute("email");
String sql = "select * from books where user!= '"+userEmail+"'";
Statement st = connection.createStatement();
ResultSet rs = st.executeQuery(sql);

String sql3 = "select * from cart where user = '"+userEmail+"'";
Statement st3 = connection.createStatement();
ResultSet rs3 = st3.executeQuery(sql3);
int countCart = 0;
while(rs3.next()){
	countCart++;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>

<meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/aos.css">

   
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
    
    h3{
    	color:red;
    	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    	font-size:40px;
    	text-shadow: 1px 3px #ff0000;
    	
    }

</style>

<body>

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

 <section class="" id="contact">
        <div class="container">
            <h3 class="text-center m-3">View Books</h3>
            <div class="row">
                <div class="form-group col-md-8">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-primary my-3 " type="submit">Search</button>
                    </form>
                </div>
                <div class="form-group col-md-4">
                    <label for="inputState">Sort by:</label>
                    <select id="inputState" class="form-control mr-sm-2">
                      <option selected>--Select--</option>
                      <option>Available</option>
                      <option>Sold</option>
                    </select>
                </div>
            </div>
<div class="row">
            <%
                while(rs.next()){
            %>
                <div class="col-sm-3 mt-4">
                    <div class="card text-capitalize">
                        <img src="../images/Book/<%out.print(rs.getString("image")); %>" class="card-img-top" alt="..." width="50px"
                        height="200px">
                        <a href="./singleBookView.jsp?book=<% out.print(rs.getString("bno")); %>">
                            <div class="card-body">
                                <h5 class="card-title"><Strong>
                                        <%out.print(rs.getString("book_name")); %>
                                    </Strong></h5>
                                <p class="card-text"><small>Auther : <%out.print(rs.getString("auther_name")); %></small></p>
                                <p class="card-text "><strong class="text-dark"><i class="fa fa-rupee"></i>
                                        <%out.print(rs.getString("selling_price")); %>
                                    </strong>&nbsp;
                                    <small>
                                        <i class="fa fa-rupee"></i>
                                        <s class="text-secondary">
                                            <%out.print(rs.getString("original_price")); %>
                                        </s> &nbsp;&nbsp;<span class="text-success"> <i class="fa fa-rupee"></i>
                                            <%out.print(Integer.parseInt(rs.getString("original_price"))-Integer.parseInt(rs.getString("selling_price")));
                                                %> off
                                        </span>
                                    </small>
                                </p>
                                <p class="card-text">
                                    <small>Free delivery</small>
                                </p>
                                <p class="card-text">
                                    <small class="text-left">Condition : <%out.print(rs.getString("book_condition")); %> </small>
                                    <span class="text-right ml-5"><i class="fa fa-heart-o fa-1x"></i></span>
                                </p>
                                <%
                                    if((Integer.parseInt(rs.getString("original_price"))-Integer.parseInt(rs.getString("selling_price")))>Integer.parseInt(rs.getString("original_price"))/2){
                                        %>
                                        <small class="card-text text-success">
                                            <strong>Deal of the Day</strong>
                                        </small>
                                        <%
                                    }
                                %>
                            </div>
                        </a>
                    </div>
                </div>
                <%}%>
            </div>
            
            <hr>
            <h3 class="text-dark">Recommendations</h3>
            <div class="row">
                <div class="col-sm-3 mt-2">
                    <div class="card text-center">
                        <img src="../images/mpsc.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Mpsc</h5>
                            <p class="card-text">Rs1500</p>
                            <a href="myCart.jsp" class="btn btn-primary">Buy Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 mt-2">
                    <div class="card text-center">
                        <img src="../images/MCA Entrances.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">MCA Entrances</h5>
                            <p class="card-text">Rs.600</p>
                            <a href="myCart.jsp" class="btn btn-primary">Buy Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 mt-2">
                    <div class="card text-center">
                        <img src="../images/mpsc9.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Mpsc</h5>
                            <p class="card-text">100</p>
                            <a href="#" class="btn btn-primary">Buy Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 mt-2">
                    <div class="card text-center">
                        <img src="../images/spoken english.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">spoken english</h5>
                            <p class="card-text">Rs.250</p>
                            <a href="#" class="btn btn-primary">Buy Now</a>
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