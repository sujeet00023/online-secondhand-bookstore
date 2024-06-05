<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
if(session.getAttribute("email")== null){
	response.sendRedirect("../index.jsp");
}
	
	%>    
<%@ page import="java.sql.*" %>
<%@ include file="./controller/connection.jsp" %>
<%@ page import="java.util.Date" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%

	String userEmail = (String)session.getAttribute("email");
	String sql3 = "select * from cart where user ='" + userEmail + "'";
	Statement st3=connection.createStatement();
	ResultSet rs3 = st3.executeQuery(sql3);
	int count = 0;
		while(rs3.next()){
			count++;
		}



%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>UPLOAD BOOKS</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/aos.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/custom.css"> 
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

<body>


<%

Date currentDate = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("YYY-MM-dd");

String formattedDate = sdf.format(currentDate);

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
                          <%=formattedDate %> <span id="current-Time"> </span></div>
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
   					
        <div class="container p-2 shadow-lg rounded ">
            <form class="p-3 rounded" id="sellForm" action="./controller/uploadBook.jsp" method="get"
                enctype="multipart/form-data">
   <h3 class=" text-center mb-4 bg-light rounded p-2 shadow ">Upload Books</h3>
                <div class="form-row shadow p-3 rounded">
                    <div class="form-group col-md-6">
                        <label for="inputBookName4">Book Name:</label>
                        <input type="text" class="form-control" name="bookName" id="bookName" placeholder="BookName"
                            required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputAutherName4">Auther Name:</label>
                        <input type="text" class="form-control" name="autherName" id="autherName"
                            placeholder="AutherName" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputState">Category:</label>
                        <select id="category" name="category" class="form-control" required>
                            <option value="">--Select Category--</option>
                            <option>Science</option>
                            <option>Mpsc Exam</option>
                          	<option> Sbi Ipo Exam</option>
                          	<option>Upsc Exam </option>
                          	<option>Neet Exam </option>
                            <option>Drama</option>
                            <option>Story</option>
                            <option>Action and Adventure</option>
                            <option>Romance</option>
                            <option>Engineering</option>
                            <option>Under Graduation</option>
                            <option>Medical books</option>
                            <option>Mystery</option>
                            <option>Horror</option>
                            <option>Health</option>
                            <option>Travel</option>
                            <option>Childrens</option>
                            <option>Dictionaries</option>
                            <option>History</option>
                            <option>Computer Science</option>
                            <option>Coding</option>
                            <option>Cookbooks</option>
                            <option>Mathematics</option>
                            <option>Autobiographics</option>
                            <option>Fantasy</option>
                            <option>Kadambari</option>
                            <option>Others</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputState">Book Language:</label>
                        <select id="bookLanguage" name="bookLanguage" class="form-control" required>
                            <option value="">--Select Book Language--</option>
                            <option>English</option>
                            <option>Hindi</option>
                            <option>Marathi</option>
                            <option>Punjabi</option>
                            <option>Telugu</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputState">Purchase Date:</label>
                        <input type="Date" class="form-control" name="purchaseDate" id="purchaseDate"
                            placeholder="BookName" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputState">Book Condition:</label>
                        <select id="bookCondition" name="bookCondition" class="form-control" required>
                            <option value="">--Select Book Conditions--</option>
                            <option>New</option>
                            <option>Good</option>
                            <option>Fair</option>
                            <option>Poor</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputState">Original Price:</label>
                        <input type="text" class="form-control" name="originalPrice" id="originalPrice"
                            placeholder="Enter Price" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputState">Selling Price:</label>
                        <input type="text" class="form-control" onchange="checkPrice()" name="sellingPrice" id="sellingPrice"
                            placeholder="Enter Price" required>
                            <span><small class="text-danger" id="priceWarn"></small></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputState">Description:</label>
                        <textarea class="form-control" id="description" name="description"
                            placeholder="Enter Description" required></textarea>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="formFile">Upload Image:</label><br>
                        <input name="imageFile" type="file" id="bookImage" required>
                    </div>
                </div>
                 <div class="text-center"> 
                <button type="submit" class="btn btn-primary col-2 mt-4 shadow-lg" id="submit">Submit</button>
                
            </form>
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




	<script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/custom.js"></script>

</body>
</html>