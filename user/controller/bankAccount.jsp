<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.math.*" %>
<%@ include file="./connection.jsp" %>

<%
   try{
            String name = request.getParameter("userName");
            String accountNo = request.getParameter("accountNo");
            String bankName = request.getParameter("bankName");
            String code = request.getParameter("code");
            String branch = request.getParameter("branch");
            String email = (String)session.getAttribute("email");

            String sql1 = "select * from bankaccounts where account_no = '"+accountNo+"'";
            Statement st1 = connection.createStatement();
            ResultSet rs = st1.executeQuery(sql1);
            if(rs.next()){
                response.sendRedirect("../account.jsp?msg=exists");
            }else{
                String sql = "insert into bankaccounts(srno,name,email,account_no,bank_name,ifsc_code,branch) values(?,?,?,?,?,?,?)";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1,null);
                ps.setString(2,name);
                ps.setString(3,email);
                ps.setString(4,accountNo);
                ps.setString(5,bankName);
                ps.setString(6,code);
                ps.setString(7,branch);
                ps.executeUpdate();
                
                response.sendRedirect("../index.jsp?accountmsg=success");
            }
    }catch(Exception e){
        out.println(e);
    }
%>