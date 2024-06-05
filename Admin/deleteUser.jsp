<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="../controller/connection.jsp" %>
 
    <%
    
    	String srno = request.getParameter("name");
    try{
    	String sql = "delete from users where name = '" + srno+"'";
    	PreparedStatement ps = connection.prepareStatement(sql);
    	int rs = ps.executeUpdate();
    	response.sendRedirect("./viewSingleUser.jsp");
    }catch(Exception e){
    	System.out.println(e.getMessage());
    }
    
    %>
