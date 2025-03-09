<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style_nou_angajat.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Review</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	// Verifică dacă datele au fost trimise prin POST
	String titlu = request.getParameter("Titlu");
	String numeReclamant = request.getParameter("NumeReclamant");
	String prenumeReclamant = request.getParameter("PrenumeReclamant");
	String detalii = request.getParameter("Detalii");
	String dataReview = request.getParameter("DataReview");

	// Dacă utilizatorul a completat formularul
	if (titlu != null && !titlu.isEmpty()) {
		// Conectare la baza de date
		jb.connect();
		// Adăugare review în baza de date
		jb.adaugaReview(titlu, numeReclamant, prenumeReclamant, detalii, dataReview);
		// Deconectare de la baza de date
		jb.disconnect();
	%>
	<p>Review-ul a fost adăugat cu succes!</p>
	<%
	} else {
	%>
	
	<form action="nou_review.jsp" method="post">
		<table>
			<tr>
				<td align="right">Titlu Review:</td>
				<td><input type="text" name="Titlu" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Nume Reclamant:</td>
				<td><input type="text" name="NumeReclamant" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenume Reclamant:</td>
				<td><input type="text" name="PrenumeReclamant" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Detalii Review:</td>
				<td><textarea name="Detalii" rows="5" cols="40"></textarea></td>
			</tr>
			<tr>
				<td align="right">Data Review (yyyy-mm-dd):</td>
				<td><input type="text" name="DataReview" size="20" /></td>
			</tr>
		</table>
		<input type="submit" value="Adaugă Review" />
	</form>
	<%
	}
	%>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>
