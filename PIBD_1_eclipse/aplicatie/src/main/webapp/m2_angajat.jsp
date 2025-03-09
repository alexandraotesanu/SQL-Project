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
	

	<%
    // Conectarea la baza de date
    jb.connect();

    // Preluarea parametrilor din URL
    int aux = Integer.parseInt(request.getParameter("id_angajat"));
    String Nume = request.getParameter("nume");
    String Prenume = request.getParameter("prenume");
    String Adresa = request.getParameter("adresa");
    String Cnp = request.getParameter("cnp");
    String Pozitie = request.getParameter("pozitie");
    String Departament = request.getParameter("departament");

    // Valorile și câmpurile care trebuie actualizate în tabel
    String[] valori = {Nume, Prenume, Adresa, Cnp, Pozitie, Departament};
    String[] campuri = {"nume", "prenume", "adresa", "cnp", "pozitie", "departament"};

    // Apelarea metodei pentru actualizarea tabelului "Angajati"
    jb.modificaTabela("Angajati", "id_angajat", aux, campuri, valori);

    // Deconectarea de la baza de date
    jb.disconnect();
  %>

	<h1 align="center">Modificarile au fost efectuate cu succes!</h1>
	<p align="center">
		<a href="index.html"><b>Home</b></a>
	</p>
</body>
</html>
