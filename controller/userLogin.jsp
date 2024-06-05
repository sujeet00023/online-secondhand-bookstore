<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="./connection.jsp" %>

<%  
    String email = request.getParameter("loginEmail");
    String password = request.getParameter("loginPassword");

    try {

        String sql = "Select * from users where email='" + email + "' and password='" + password + "'";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(sql);

        if (rs.next()) {
            session.setAttribute("name",rs.getString("name"));
            session.setAttribute("email",rs.getString("email"));
            
            response.sendRedirect("../user/index.jsp?loginMsg=success");
        }else{
            response.sendRedirect("../index.jsp?loginMsg=failed");
            }
        
    } catch (Exception e1) {
        out.println(e1.getMessage());
    }

%>