<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <link rel="stylesheet" type="text/css" href="style_nou_angajat.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga angajat</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	String Nume = request.getParameter("nume");
	String Prenume = request.getParameter("prenume");
	String Adresa = request.getParameter("adresa");
	String Cnp = request.getParameter("cnp");
	String Pozitie = request.getParameter("pozitie");
	String Departament = request.getParameter("departament");
	if (Nume != null) {
		jb.connect();
		jb.adaugaAngajat(Nume, Prenume, Adresa, Cnp, Pozitie, Departament);
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
	%>
	
	<form action="nou_angajat.jsp" method="post">
		<table>
			<tr>
				<td align="right">Nume Angajat:</td>
				<td><input type="text" name="nume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenume Angajat:</td>
				<td><input type="text" name="prenume" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="adresa" size="30" /></td>
			</tr>
			<tr>
				<td align="right">CNP:</td>
				<td><input type="text" name="cnp" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Pozitie:</td>
				<td><input type="text" name="pozitie" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Departament:</td>
				<td><input type="text" name="departament" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga angajatul" />
	</form>
	<%
	}
	%>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>
