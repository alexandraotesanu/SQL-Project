<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style_modifica_angajat.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Angajati</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>

	<br />


	<form action="m1_angajat.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdAngajat:</b></td>
				<td><b>Nume:</b></td>
				<td><b>Prenume:</b></td>
				<td><b>Adresa:</b></td>
				<td><b>Cnp:</b></td>
				<td><b>Pozitie:</b></td>
				<td><b>Departament:</b></td>
			</tr>
			<%
            jb.connect();
            ResultSet rs = jb.vedeTabela("Angajati"); // Tabelă: "Angajati"
            long x;
            while (rs.next()) {
                x = rs.getLong("id_angajat"); // Coloană: "id_angajat"
            %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("nume")%></td>
				<td><%= rs.getString("prenume")%></td>
				<td><%= rs.getString("adresa")%></td>
				<td><%= rs.getString("cnp")%></td>
				<td><%= rs.getString("pozitie")%></td>
				<td><%= rs.getString("departament")%></td>
			</tr>
			<%
            }
            rs.close();
            jb.disconnect();
            %>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Modifica linia selectata">
		</p>
	</form>

	<%
    // Gestionarea cererii POST pentru modificarea datelor
    String[] selectedIds = request.getParameterValues("primarykey");

    if (selectedIds != null && selectedIds.length > 0) {
        // Dacă există date selectate
        jb.connect();
        jb.disconnect();
       
    } else if (request.getMethod().equalsIgnoreCase("POST")) {
        // Dacă nu este selectat niciun angajat și a fost apăsat butonul "Modifica"
        out.println("<p align='center'><b>Nu a fost selectat niciun angajat pentru modificare!</b></p>");
    }
    %>

	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>
