<%@ page import="javax.servlet.*" %>
<%@ include file="./connection.jsp"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.util.Date, java.text.*" %>
<%
    String bno = request.getParameter("bno");
    String bookName = request.getParameter("bookName");
    String autherName = request.getParameter("autherName");
    String category = request.getParameter("category");
    String bookLanguage = request.getParameter("bookLanguage");
    String purchaseDate = request.getParameter("purchaseDate");
    String bookCondition = request.getParameter("bookCondition");

    int oprice = Integer.parseInt(request.getParameter("originalPrice"))+40;
    String originalPrice = ""+oprice;
    //String originalPrice = request.getParameter("originalPrice");
    int price = Integer.parseInt(request.getParameter("sellingPrice"))+40;
    String sellingPrice = ""+price;
    //String originalPrice = request.getParameter("originalPrice");

    String description = request.getParameter("description");
    String imageFile = request.getParameter("imageFile");
    String userEmail = (String)session.getAttribute("email");
    String status = "Pending";

    Date date = new Date();

    SimpleDateFormat ft = new SimpleDateFormat ("00-00-0000");
    String selling_date = ft.format(date);

    SimpleDateFormat uft = new SimpleDateFormat ("dd-MM-YYYY");
    String upload_date = uft.format(date);

    try{
    
        String sql = "update books set book_name=?,auther_name=?,category=?,book_language=?,purchase_date=?,book_condition=?,original_price=?,selling_price=?,description=?,image=? where user=? and bno=?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, bookName);
            ps.setString(2, autherName);
            ps.setString(3, category);
            ps.setString(4, bookLanguage);
            ps.setString(5, purchaseDate);
            ps.setString(6, bookCondition);
            ps.setString(7, originalPrice);
            ps.setString(8, sellingPrice);
            ps.setString(9, description);
            ps.setString(10, imageFile);
            ps.setString(11, userEmail);
            ps.setString(12, bno);
            ps.executeUpdate();
            response.sendRedirect("../myBooks.jsp?updatemsg=success");
    
    }catch(Exception e){
        out.print(e);
    }

  
%>