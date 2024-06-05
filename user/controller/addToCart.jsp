<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="./connection.jsp" %>    
<%
	String book_no = request.getParameter("book");
	String userEmail = (String)session.getAttribute("email");
	
	
	try{
		String sql2 = "select * from cart where user ='"+userEmail + "' and book_no= '"+book_no+" ' ";
		Statement st2 = connection.createStatement();
		ResultSet rs2 = st2.executeQuery(sql2);
		
		if(rs2.next()){
			response.sendRedirect("../singleBookView.jsp?book="+book_no+"&&status1=already");
			
		}else{
			String sql = "insert into cart values(?,?,?)";
			PreparedStatement ps= connection.prepareStatement(sql);
			ps.setString(1, null);
			ps.setString(2,userEmail);
			ps.setString(3, book_no);
			
			int rs=ps.executeUpdate();
			response.sendRedirect("../singleBookView.jsp?book="+book_no+"&&status2=success");
		}
	}catch(Exception e){
		System.out.print(e.getMessage());
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