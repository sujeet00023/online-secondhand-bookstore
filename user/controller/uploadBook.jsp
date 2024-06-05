<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="./connection.jsp" %>


<%

	String bookName = request.getParameter("bookName");
	String autherName = request.getParameter("autherName");
	String category = request.getParameter("category");
	String bookLanguage = request.getParameter("bookLanguage");
	String purchaseDate = request.getParameter("purchaseDate");
	String bookCondition  = request.getParameter("bookCondition");
	
	
	int oprice = Integer.parseInt(request.getParameter("originalPrice")) + 40;
	String originalPrice = ""+oprice;
	
	int price = Integer.parseInt(request.getParameter("sellingPrice")) + 40 ;
	String sellingPrice = "" + price;
	
	
	String description = request.getParameter("description");
	String imageFile = request.getParameter("imageFile");
	String userEmail = (String)session.getAttribute("email");
	String status = "pending";
	
	Date date = new Date();
	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
	String selling_date = sdf.format(date);
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("YYYY-MM-dd");
	String upload_date = sdf1.format(date);
	
	
	try{
		
		String sql1 = "select * from bankaccounts where email = '" + userEmail + "'";
		Statement st = connection.createStatement();
		ResultSet rs  = st.executeQuery(sql1);
		
		if(rs.next()){
			
			String sql = "Insert into books(bno,user,book_name,auther_name,category,book_language,purchase_date,book_condition,original_price,selling_price,description,image,status,selling_date,upload_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, null);
			ps.setString(2, userEmail);
			ps.setString(3, bookName);
			ps.setString(4, autherName);
			ps.setString(5, category);
			ps.setString(6, bookLanguage);
			ps.setString(7, purchaseDate);
			ps.setString(8, bookCondition);
			ps.setString(9, originalPrice);
			ps.setString(10, sellingPrice);
			ps.setString(11, description);
			ps.setString(12, imageFile);
			ps.setString(13, status);
			ps.setString(14, selling_date);
			ps.setString(15, upload_date);
			
			ps.executeUpdate();
			
			response.sendRedirect("../index.jsp?bookmsg=success");
		}else{
			response.sendRedirect("../bankAccount.jsp?addAccount=notexists");
		}
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	
	
	



%>














    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>