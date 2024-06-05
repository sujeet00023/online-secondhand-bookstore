<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="./connection.jsp" %>


<%

	try{
		
		String email = request.getParameter("adminEmail");
		String password = request.getParameter("adminPassword");
		String sql = "select * from admin where email = '"+email+"' and password ='"+password+"'";
		Statement st = connection.createStatement();
		ResultSet rs= st.executeQuery(sql);
		
		if(rs.next()){
			session.setAttribute("adminEmail",rs.getString("email"));
			response.sendRedirect("../Admin/index.jsp");
		}else{
			response.sendRedirect("../index.jsp?adminmsg=fail");
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