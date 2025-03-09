<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Șterge Review</title>
 </head>
 <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
 <jsp:setProperty name="jb" property="*" />
 <body>
 <%
 // Preia parametrii de la formular
 String[] reviewIds = request.getParameterValues("primarykey"); 

 if (reviewIds != null && reviewIds.length > 0) {
     // Conectare la baza de date
     jb.connect();
     // Ștergere review-uri pe baza ID-urilor primite
     jb.stergeDateTabela(reviewIds, "Reviewuri", "id_review");
     jb.disconnect();
 %>
     <p align="center">
         <b>Review-ul a fost șters cu succes!</b>
     </p>
 <%
 } else {
 %>
     <p align="center" style="color: red;">
         <b>Nu a fost selectat niciun review pentru ștergere.</b>
     </p>
 <%
 }
 %>
 <p align="center">
     <a href="index.html"><b>Home</b></a>
 </p>
 </body>
</html>
