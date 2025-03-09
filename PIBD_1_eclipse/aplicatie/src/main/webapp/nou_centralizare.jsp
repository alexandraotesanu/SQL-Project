<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style_adauga_centralizare.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Centralizare</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	int id_angajat, id_review;
	String id1, id2;
	id1 = request.getParameter("id_angajat");
	id2 = request.getParameter("id_review");
	if (id1 != null && id2 != null) {
		jb.connect();
		jb.adaugaCentralizare(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2));
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
	jb.connect();
	ResultSet rs1 = jb.vedeTabela("Angajati");
	ResultSet rs2 = jb.vedeTabela("Reviewuri");
	%>
	
	<form action="nou_centralizare.jsp" method="post">
		<table>
			<tr>
				<td align="right">Id Angajat:</td>
				<td>Selectati Angajatul: <SELECT NAME="id_angajat">
						<%
						while (rs1.next()) {
							id_angajat = rs1.getInt("id_angajat");
							String NumeAngajat = rs1.getString("nume");
							String PrenumeAngajat = rs1.getString("prenume");
							String AdresaAngajat = rs1.getString("adresa");
							String CnpAngajat = rs1.getString("cnp");
							String PozitieAngajat = rs1.getString("pozitie");
							String DepartamentAngajat = rs1.getString("departament");
						%>
						<OPTION VALUE="<%=id_angajat%>">
							<%=id_angajat%>,
							<%=NumeAngajat%>,
							<%=PrenumeAngajat%>,
							<%=AdresaAngajat%>,
							<%=CnpAngajat%>,
							<%=PozitieAngajat%>,
							<%=DepartamentAngajat%>
						</OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
			</tr>
			<tr>
				<td align="right">Id Review:</td>
				<td>Selectati Review-ul: <SELECT NAME="id_review">
						<%
						while (rs2.next()) {
							id_review = rs2.getInt("id_review");
							String TitluReview = rs2.getString("titlu");
							String NumeReclamant = rs2.getString("nume_reclamant");
							String PrenumeReclamant = rs2.getString("prenume_reclamant");
							String DetaliiReview = rs2.getString("detalii");
							String DataReview = rs2.getString("data_review");
						%>
						<OPTION VALUE="<%=id_review%>">
							<%=id_review%>,
							<%=TitluReview%>,
							<%=NumeReclamant%>,
							<%=PrenumeReclamant%>,
							<%=DetaliiReview%>,
							<%=DataReview%>
						</OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
			</tr>
		</table>
		<input type="submit" value="Adauga Centralizare" />
	</form>
	<%
 }
 %>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>
