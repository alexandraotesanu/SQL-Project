<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style_tabela_centralizare.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Centralizare</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Centralizare:</h1>
	<br />
	<p align="center">
		<a href="nou_centralizare.jsp"><b>Adauga o Noua Centralizare</b></a>
	</p>
	<form action="sterge_centralizare.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>Id:</b></td>
				<td><b>Id_Angajat:</b></td>
				<td><b>Nume_Angajat:</b></td>
				<td><b>Prenume_Angajat:</b></td>
				<td><b>Pozitie:</b></td>
				<td><b>Departament:</b></td>
				<td><b>Id_Review:</b></td>
				<td><b>Titlu_Review:</b></td>
				<td><b>Nume_Reclamant:</b></td>
				<td><b>Prenume_Reclamant:</b></td>
				<td><b>Detalii_Review:</b></td>
				<td><b>Data_Review:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeCentralizare(); // Metoda trebuie să fie implementată în JavaBean
			long x;
			while (rs.next()) {
				x = rs.getLong("id");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getInt("id_angajat")%></td>
				<td><%=rs.getString("nume")%></td>
				<td><%=rs.getString("prenume")%></td>
				<td><%=rs.getString("pozitie")%></td>
				<td><%=rs.getString("departament")%></td>
				<td><%=rs.getInt("id_review")%></td>
				<td><%=rs.getString("titlu")%></td>
				<td><%=rs.getString("nume_reclamant")%></td>
				<td><%=rs.getString("prenume_reclamant")%></td>
				<td><%=rs.getString("detalii")%></td>
				<td><%=rs.getDate("data_review")%></td>
			</tr>
			<%
			}
			%>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge Liniile Marcate">
		</p>
	</form>
	<%
	rs.close();
	jb.disconnect();
	%>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a>
	</p>
</body>
</html>
