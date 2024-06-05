<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
    Connection connection = null;
    try {

        //Class.forName("com.mysql.jdbc.Driver"); This is deprecated
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/secondhand_bookstore", "root", "1234");
        String sql = "";

    } catch (Exception e) {
        System.out.println(e);
    }
%>