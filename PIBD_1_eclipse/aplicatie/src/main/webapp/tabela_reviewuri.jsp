<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Reviewuri</title>
 <link rel="stylesheet" type="text/css" href="style_tabela_review.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Reviewuri:</h1>
	<br />
	<p align="center">
		<a href="nou_review.jsp"><b>Adauga o noua recenzie</b></a>

	<!-- Formular pentru stergerea reviewurilor -->
	<form action="sterge_review.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>Id Review:</b></td>
				<td><b>Titlu:</b></td>
				<td><b>Nume Reclamant:</b></td>
				<td><b>Prenume Reclamant:</b></td>
				<td><b>Detalii:</b></td>
				<td><b>Data Review:</b></td>
			</tr>
			<%
        // Conectare la baza de date
        jb.connect();

        // Interogarea pentru a obține toate review-urile din tabela "Reviewuri"
        ResultSet rs = jb.vedeTabela("Reviewuri");
        long idReview;
        
        // Iterăm prin rezultatele query-ului
        while (rs.next()) {
          idReview = rs.getInt("id_review");
      %>
			<tr>
				<td><input type="checkbox" name="primarykey"
					value="<%= idReview %>" /></td>
				<td><%= idReview %></td>
				<td><%= rs.getString("titlu") %></td>
				<td><%= rs.getString("nume_reclamant") %></td>
				<td><%= rs.getString("prenume_reclamant") %></td>
				<td><%= rs.getString("detalii") %></td>
				<td><%= rs.getTimestamp("data_review") %></td>
			</tr>
			<%
        }

        // Închidem rezultatul și deconectăm de la baza de date
        rs.close();
        jb.disconnect();
      %>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>

	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a>
	</p>
</body>
</html>
