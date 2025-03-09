<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Angajati</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
 // Se preiau valorile cheii primare (id-urile angajaților selectați pentru ștergere)
 String[] s = request.getParameterValues("primarykey");
 
 if (s != null && s.length > 0) {
     // Conectarea la baza de date
     jb.connect();
     
     // Apelarea metodei pentru ștergerea datelor din tabelă
     jb.stergeDateTabela(s, "angajati", "id_angajat");
     
     // Deconectarea de la baza de date
     jb.disconnect();
 %>
	<p align="center">
		<b>Datele au fost șterse cu succes.</b> <br /> <a href="index.html"><b>Home</b></a>
	</p>
	<%
 } else {
 %>
	<p align="center" style="color: red;">
		<b>Nu a fost selectat niciun angajat pentru ștergere!</b> <br /> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
 }
 %>
</body>
</html>