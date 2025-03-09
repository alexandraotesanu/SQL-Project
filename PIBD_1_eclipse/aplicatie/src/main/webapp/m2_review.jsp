<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<br />
	

	<%
        // Conectare la baza de date
        jb.connect();
        
        // Preia valorile din formular
        int idReview = java.lang.Integer.parseInt(request.getParameter("id_review"));
        String titlu = request.getParameter("titlu");
        String numeReclamant = request.getParameter("nume_reclamant");
        String prenumeReclamant = request.getParameter("prenume_reclamant");
        String detalii = request.getParameter("detalii");
        String dataReview = request.getParameter("data_review");

        // Câmpurile care urmează a fi modificate
        String[] valori = {titlu, numeReclamant, prenumeReclamant, detalii, dataReview};
        String[] campuri = {"titlu", "nume_reclamant", "prenume_reclamant", "detalii", "data_review"};

        // Apelarea metodei care modifică datele în tabelul "reviewuri"
        jb.modificaTabela("Reviewuri", "id_review", idReview, campuri, valori);

        // Deconectare de la baza de date
        jb.disconnect();
    %>

	<h1 align="center">Modificarile au fost efectuate!</h1>
	<p align="center">
		<a href="index.html"><b>home</b></a>
	</p>
</body>
</html>
