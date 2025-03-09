<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <link rel="stylesheet" type="text/css" href="style_tabela.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Angajati</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Angajati:</h1>
	<br />
	<p align="center">
		<a href="nou_angajat.jsp"><b>Adauga un nou angajat.</b></a>
			
	</p>
	<form action="sterge_angajat.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdAngajat:</b></td>
				<td><b>Nume:</b></td>
				<td><b>Prenume:</b></td>
				<td><b>Adresa:</b></td>
				<td><b>CNP:</b></td>
				<td><b>Pozitie:</b></td>
				<td><b>Departament:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeTabela("Angajati");
			long x;
			while (rs.next()) {
				x = rs.getInt("id_angajat");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getString("nume")%></td>
				<td><%=rs.getString("prenume")%></td>
				<td><%=rs.getString("adresa")%></td>
				<td><%=rs.getString("cnp")%></td>
				<td><%=rs.getString("pozitie")%></td>
				<td><%=rs.getString("departament")%></td>
				<%
				}
				%>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
	rs.close();
	jb.disconnect();
	%>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>
