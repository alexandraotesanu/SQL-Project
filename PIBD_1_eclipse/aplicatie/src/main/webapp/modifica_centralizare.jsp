<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style_modifica_angajat.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Centralizare</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>

	<br />
	
		
	
	<form action="m1_centralizare.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>Id Centralizare:</b></td>
				<td><b>Id Angajat:</b></td>
				<td><b>Nume Angajat:</b></td>
				<td><b>Prenume Angajat:</b></td>
				<td><b>Adresa Angajat:</b></td>
				<td><b>CNP Angajat:</b></td>
				<td><b>Pozitie:</b></td>
				<td><b>Departament:</b></td>
				<td><b>Id Review:</b></td>
				<td><b>Titlu Review:</b></td>
				<td><b>Nume Reclamant:</b></td>
				<td><b>Prenume Reclamant:</b></td>
				<td><b>Detalii Review:</b></td>
				<td><b>Data Review:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeCentralizare(); // Metoda care returnează toate datele din tabela Centralizare
			long x;
			while (rs.next()) {
				x = rs.getInt("id");
				int id_angajat = rs.getInt("id_angajat");
				String nume_angajat = rs.getString("nume");
				String prenume_angajat = rs.getString("prenume");
				String adresa_angajat = rs.getString("adresa");
				String cnp_angajat = rs.getString("cnp");
				String pozitie = rs.getString("pozitie");
				String departament = rs.getString("departament");

				int id_review = rs.getInt("id_review");
				String titlu_review = rs.getString("titlu");
				String nume_reclamant = rs.getString("nume_reclamant");
				String prenume_reclamant = rs.getString("prenume_reclamant");
				String detalii_review = rs.getString("detalii");
				java.sql.Date data_review = rs.getDate("data_review");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=id_angajat%></td>
				<td><%=nume_angajat%></td>
				<td><%=prenume_angajat%></td>
				<td><%=adresa_angajat%></td>
				<td><%=cnp_angajat%></td>
				<td><%=pozitie%></td>
				<td><%=departament%></td>
				<td><%=id_review%></td>
				<td><%=titlu_review%></td>
				<td><%=nume_reclamant%></td>
				<td><%=prenume_reclamant%></td>
				<td><%=detalii_review%></td>
				<td><%=data_review%></td>
			</tr>
			<%
			}
			%>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<%
	jb.disconnect();
	%>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>
