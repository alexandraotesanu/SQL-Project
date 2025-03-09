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
	jb.connect();
	int aux = Integer.parseInt(request.getParameter("id")); // ID-ul rândului de centralizare
	String id_angajat = request.getParameter("id_angajat");
	String id_review = request.getParameter("id_review");

	// Valorile și câmpurile care vor fi actualizate în tabelul "centralizare"
	String[] valori = { id_angajat, id_review };
	String[] campuri = { "id_angajat", "id_review" };

	// Apel pentru actualizarea rândului specificat
	jb.modificaTabela("Centralizare", "id", aux, campuri, valori);
	jb.disconnect();
	%>
	<h1 align="center">Modificarile au fost efectuate!</h1>
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
</body>
</html>
