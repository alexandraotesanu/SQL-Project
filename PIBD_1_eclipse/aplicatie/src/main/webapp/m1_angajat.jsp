<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <link rel="stylesheet" type="text/css" href="style_nou_angajat.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	
	<br />
	

	<%
	try {
	    String primaryKey = request.getParameter("primarykey");

	    if (primaryKey == null || primaryKey.isEmpty()) {
	        // Dacă nu s-a selectat nimic, afișăm mesajul de eroare
	        out.println("<h3 align='center' style='color:red;'>Nu ai selectat nimic pentru modificare!</h3>");
	    } else {
	        jb.connect();

	        // Conversie și preluare linie
	        int aux = Integer.parseInt(primaryKey);
	        ResultSet rs = jb.intoarceLinieDupaId("Angajati", "id_angajat", aux);

	        if (!rs.first()) {
	            out.println("<h3 align='center' style='color:red;'>Angajatul selectat nu există!</h3>");
	        } else {
	            // Preluăm valorile din baza de date
	            String Nume = rs.getString("nume");
	            String Prenume = rs.getString("prenume");
	            String Adresa = rs.getString("adresa");
	            String Pozitie = rs.getString("pozitie");
	            String Cnp = rs.getString("cnp");
	            String Departament = rs.getString("departament");

	            rs.close();
	            jb.disconnect();
	%>

	<!-- Formularul pentru modificarea unui angajat -->
	<form action="m2_angajat.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdAngajat:</td>
				<td><input type="text" name="id_angajat" size="30" value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="nume" size="30" value="<%=Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume:</td>
				<td><input type="text" name="prenume" size="30" value="<%=Prenume%>" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="adresa" size="30" value="<%=Adresa%>" /></td>
			</tr>
			<tr>
				<td align="right">Cnp:</td>
				<td><input type="text" name="cnp" size="13" value="<%=Cnp%>" /></td>
			</tr>
			<tr>
				<td align="right">Pozitie:</td>
				<td><input type="text" name="pozitie" size="30" value="<%=Pozitie%>" /></td>
			</tr>
			<tr>
				<td align="right">Departament:</td>
				<td><input type="text" name="departament" size="30" value="<%=Departament%>" /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica angajatul">
		</p>
	</form>
	<%
	        }
	    }
	} catch (Exception e) {
	    out.println("<h3 align='center' style='color:red;'>Eroare: " + e.getMessage() + "</h3>");
	} finally {
	    jb.disconnect();
	}
	%>

	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>
