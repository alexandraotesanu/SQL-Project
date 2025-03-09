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
	

	<%
    try {
        // Obține ID-ul review-ului selectat
        String primaryKey = request.getParameter("primarykey");

        if (primaryKey == null || primaryKey.isEmpty()) {
            // Dacă nu este selectat nimic, afișează un mesaj de eroare
            out.println("<h3 align='center' style='color:red;'>Nu ai selectat nimic pentru modificare!</h3>");
        } else {
            // Conectare la baza de date
            jb.connect();

            // Convertim și preluăm linia corespunzătoare
            int aux = Integer.parseInt(primaryKey);
            ResultSet rs = jb.intoarceLinieDupaId("Reviewuri", "id_review", aux);

            if (!rs.first()) {
                out.println("<h3 align='center' style='color:red;'>Review-ul selectat nu există!</h3>");
            } else {
                // Atribuie valorile câmpurilor pentru review-ul respectiv
                String titlu = rs.getString("titlu");
                String nume_reclamant = rs.getString("nume_reclamant");
                String prenume_reclamant = rs.getString("prenume_reclamant");
                String detalii = rs.getString("detalii");
                String data_review = rs.getString("data_review");

                rs.close();
                jb.disconnect();
    %>

	<!-- Formularul pentru editarea unui review -->
	<form action="m2_review.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">Id Review:</td>
				<td><input type="text" name="id_review" size="30" value="<%= aux %>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Titlu Review:</td>
				<td><input type="text" name="titlu" size="30" value="<%= titlu %>" /></td>
			</tr>
			<tr>
				<td align="right">Nume Reclamant:</td>
				<td><input type="text" name="nume_reclamant" size="30" value="<%= nume_reclamant %>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume Reclamant:</td>
				<td><input type="text" name="prenume_reclamant" size="30" value="<%= prenume_reclamant %>" /></td>
			</tr>
			<tr>
				<td align="right">Detalii Review:</td>
				<td><textarea name="detalii" rows="4" cols="30"><%= detalii %></textarea></td>
			</tr>
			<tr>
				<td align="right">Data Review:</td>
				<td><input type="text" name="data_review" size="30" value="<%= data_review %>" readonly /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica Review">
		</p>
	</form>
	<%
            }
        }
    } catch (Exception e) {
        // Gestionează excepții și afișează mesaj de eroare
        out.println("<h3 align='center' style='color:red;'>Eroare: " + e.getMessage() + "</h3>");
    } finally {
        jb.disconnect();
    }
    %>

	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a>
	</p>
</body>
</html>
