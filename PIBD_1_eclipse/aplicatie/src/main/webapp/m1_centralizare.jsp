<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <link rel="stylesheet" type="text/css" href="style_adauga_centralizare.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	
	<%
    try {
        // Conectează-te la baza de date
        jb.connect();
        String primaryKey = request.getParameter("primarykey");

        if (primaryKey == null || primaryKey.isEmpty()) {
            // Afișează un mesaj de eroare dacă primaryKey nu este furnizat
            out.println("<h3 align='center' style='color:red;'>Nu ai selectat nimic pentru modificare!</h3>");
        } else {
            int aux = Integer.parseInt(primaryKey);
            ResultSet rs = jb.intoarceCentralizareId(aux);

            if (!rs.first()) {
                out.println("<h3 align='center' style='color:red;'>Linia selectată pentru modificare nu există!</h3>");
            } else {
                // Preia ID-urile selectate
                int idAngajatSelectat = rs.getInt("id_angajat");
                int idReviewSelectat = rs.getInt("id_review");

                // Preia datele din tabelele Angajati și Reviewuri
                ResultSet rsAngajati = jb.vedeTabela("Angajati");
                ResultSet rsReviewuri = jb.vedeTabela("Reviewuri");

    %>
	<!-- Formularul pentru modificarea datelor -->
	<form action="m2_centralizare.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">Id Centralizare:</td>
				<td><input type="text" name="id" size="30" value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Id Angajat:</td>
				<td><select name="id_angajat">
						<%
                    while (rsAngajati.next()) {
                        int idAngajat = rsAngajati.getInt("id_angajat");
                        String numeAngajat = rsAngajati.getString("nume");
                        String prenumeAngajat = rsAngajati.getString("prenume");
                        String pozitie = rsAngajati.getString("pozitie");
                        String departament = rsAngajati.getString("departament");
                        if (idAngajat == idAngajatSelectat) {
                    %>
						<option value="<%=idAngajat%>" selected><%=idAngajat%>, <%=numeAngajat%>, <%=prenumeAngajat%>, <%=pozitie%>, <%=departament%></option>
						<%
                        } else {
                    %>
						<option value="<%=idAngajat%>"><%=idAngajat%>, <%=numeAngajat%>, <%=prenumeAngajat%>, <%=pozitie%>, <%=departament%></option>
						<%
                        }
                    }
                    %>
				</select></td>
			</tr>
			<tr>
				<td align="right">Id Review:</td>
				<td><select name="id_review">
						<%
                    while (rsReviewuri.next()) {
                        int idReview = rsReviewuri.getInt("id_review");
                        String titluReview = rsReviewuri.getString("titlu");
                        String numeReclamant = rsReviewuri.getString("nume_reclamant");
                        String prenumeReclamant = rsReviewuri.getString("prenume_reclamant");
                        String dataReview = rsReviewuri.getString("data_review");
                        if (idReview == idReviewSelectat) {
                    %>
						<option value="<%=idReview%>" selected><%=idReview%>, <%=titluReview%>, <%=numeReclamant%>, <%=prenumeReclamant%>, <%=dataReview%></option>
						<%
                        } else {
                    %>
						<option value="<%=idReview%>"><%=idReview%>, <%=titluReview%>, <%=numeReclamant%>, <%=prenumeReclamant%>, <%=dataReview%></option>
						<%
                        }
                    }
                    %>
				</select></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia selectata">
		</p>
	</form>
	<%
                rsAngajati.close();
                rsReviewuri.close();
            }
            rs.close();
        }
    } catch (Exception e) {
        // Gestionează erorile și afișează un mesaj de eroare
        out.println("<h3 align='center' style='color:red;'>Eroare: " + e.getMessage() + "</h3>");
    } finally {
        // Deconectare sigură de la baza de date
        jb.disconnect();
    }
    %>
	<p align="center">
		<a href="index.html"><b>Home</b></a>
	</p>
</body>
</html>
