<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style_modifica_angajat.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Review-uri</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	
	<br />
	

	<form action="m1_review.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>Id Review:</b></td>
				<td><b>Titlu Review:</b></td>
				<td><b>Nume Reclamant:</b></td>
				<td><b>Prenume Reclamant:</b></td>
				<td><b>Detalii:</b></td>
				<td><b>Data Review:</b></td>
			</tr>
			<%
            jb.connect();  // Conectare la baza de date
            ResultSet rs = jb.vedeTabela("Reviewuri");
            long reviewId;
            while (rs.next()) {
                reviewId = rs.getLong("id_review");
            %>
			<tr>
				<td><input type="checkbox" name="primarykey"
					value="<%= reviewId %>" /></td>
				<td><%= reviewId %></td>
				<td><%= rs.getString("titlu") %></td>
				<td><%= rs.getString("nume_reclamant") %></td>
				<td><%= rs.getString("prenume_reclamant") %></td>
				<td><%= rs.getString("detalii") %></td>
				<td><%= rs.getString("data_review") %></td>
			</tr>
			<% 
            }
            %>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Modifica Review">
		</p>
	</form>
	<%
    jb.disconnect();  // Deconectare de la baza de date
    %>

	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a>
	</p>
</body>
</html>
