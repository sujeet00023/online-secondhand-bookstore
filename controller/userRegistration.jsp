<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="./connection.jsp" %>

<%  String name = request.getParameter("regName");
    String email = request.getParameter("regEmail");
    String gender = request.getParameter("regGender");
    String contactNo = request.getParameter("regContactNo");
    String city = request.getParameter("regCity");
    String password = request.getParameter("regPassword");
    String answer = request.getParameter("regAnswer");

    try {

        String sql = "Select * from users where email='" + email + "'";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(sql);

        if (rs.next()) {
            response.sendRedirect("../index.jsp?msg1=exists");
        }else{
                PreparedStatement ps = connection.prepareStatement("insert into users(name,email,gender,contactno,city,password,answer) values(?,?,?,?,?,?,?)");

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, gender);
                ps.setString(4, contactNo);
                ps.setString(5, city);
                ps.setString(6, password);
                ps.setString(7, answer);
                ps.executeUpdate();

                response.sendRedirect("../index.jsp?msg=success");
            }
        
    } catch (Exception e1) {
        out.println(e1.getMessage());
    }

%>