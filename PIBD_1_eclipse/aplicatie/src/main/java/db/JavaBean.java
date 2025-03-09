package db;
import java.sql.*;

public class JavaBean {
	String error;
	Connection con;

	public JavaBean() {
	}

	// Metoda de conectare la baza de date
	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proiect_bd", "root", "1234");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect()

	public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "1234");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd)

	public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "parola");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd, String ip)

	public void disconnect() throws SQLException {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException sqle) {
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	} // disconnect()

	// Adaugă un angajat
	public void adaugaAngajat(String nume, String prenume, String adresa, String cnp, String pozitie, String departament) throws SQLException, Exception {
		if (con != null) {
			try {
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO Angajati(nume, prenume, adresa, cnp, pozitie, departament) VALUES('" 
						+ nume + "', '" + prenume + "', '" + adresa + "', '" + cnp + "', '" + pozitie + "', '" + departament + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaAngajat()

	// Adaugă un review
	public void adaugaReview(String titlu, String numeReclamant, String prenumeReclamant, String detalii, String dataReview) throws SQLException, Exception {
		if (con != null) {
			try {
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO Reviewuri(titlu, nume_reclamant, prenume_reclamant, detalii, data_review) VALUES('" 
						+ titlu + "', '" + numeReclamant + "', '" + prenumeReclamant + "', '" + detalii + "', '" + dataReview + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaReview()

	// Adaugă o centralizare (legătura între angajat și review)
	public void adaugaCentralizare(int idAngajat, int idReview) throws SQLException, Exception {
		if (con != null) {
			try {
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO Centralizare(id_angajat, id_review) VALUES('" + idAngajat + "', '" + idReview + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaCentralizare()

	// Vizualizează toate datele dintr-o tabelă
	public ResultSet vedeTabela(String tabela) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("SELECT * FROM `proiect_bd`.`" + tabela + "`;");
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()

	// Vizualizează centralizările
	public ResultSet vedeCentralizare() throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("SELECT a.nume, a.prenume, a.adresa, a.cnp, a.pozitie, a.departament, "
					+ "b.titlu , b.nume_reclamant , b.prenume_reclamant , b.detalii, b.data_review, "
					+ "c.id, c.id_angajat, c.id_review FROM Angajati a "
					+ "JOIN Centralizare c ON a.id_angajat = c.id_angajat "
					+ "JOIN Reviewuri b ON b.id_review = c.id_review;");
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeCentralizare()

	// Sterge datele dintr-o tabelă pe baza unui ID
	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
		if (con != null) {
			try {
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
				for (int i = 0; i < primaryKeys.length; i++) {
					long aux = java.lang.Long.parseLong(primaryKeys[i]);
					delete.setLong(1, aux);
					delete.execute();
				}
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			} catch (Exception e) {
				error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
				throw new Exception(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeDateTabela()

	// Sterge toate datele dintr-o tabelă
	public void stergeTabela(String tabela) throws SQLException, Exception {
		if (con != null) {
			try {
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("DELETE FROM " + tabela + ";");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeTabela()

	// Modifică datele dintr-o tabelă
	public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
		String update = "UPDATE " + tabela + " SET ";
		String temp = "";
		if (con != null) {
			try {
				for (int i = 0; i < campuri.length; i++) {
					if (i != (campuri.length - 1)) {
						temp += campuri[i] + "='" + valori[i] + "', ";
					} else {
						temp += campuri[i] + "='" + valori[i] + "' ";
					}
				}
				update += temp + "WHERE " + IDTabela + " = '" + ID + "';";
				Statement stmt = con.createStatement();
				stmt.executeUpdate(update);
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of modificaTabela()

	// Returnează datele centralizate pe baza ID-ului
	public ResultSet intoarceCentralizareId(int ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("SELECT a.nume NumeAngajat, a.prenume PrenumeAngajat, a.adresa, a.cnp, a.pozitie, a.departament, "
					+ "b.titlu TitluReview, b.nume_reclamant NumeReview, b.prenume_reclamant PrenumeReview, b.detalii, b.data_review, "
					+ "c.id, c.id_angajat, c.id_review FROM Angajati a "
					+ "JOIN Centralizare c ON a.id_angajat = c.id_angajat "
					+ "JOIN Reviewuri b ON b.id_review = c.id_review WHERE c.id = '" + ID + "';");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceCentralizareId()

	// Funcția intoarceLinie - returnează o singură linie din tabelă
	public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
	    ResultSet rs = null;
	    try {
	        // Execută interogarea pentru tabelul specificat
	        String queryString = "SELECT * FROM " + tabela + " WHERE id_angajat = " + ID + ";";
	        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	        rs = stmt.executeQuery(queryString);
	    } catch (SQLException sqle) {
	        error = "SQLException: Interogarea nu a fost posibila.";
	        throw new SQLException(error);
	    } catch (Exception e) {
	        error = "A aparut o exceptie in timp ce se extrageau datele.";
	        throw new Exception(error);
	    }
	    return rs;
	} // end of intoarceLinie()

	// Funcția intoarceLinieDupaId - returnează o linie din tabelă pe baza unui ID
	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
	    ResultSet rs = null;
	    try {
	        // Execută interogarea în funcție de numele câmpului denumit `denumireId`
	        String queryString = "SELECT * FROM " + tabela + " WHERE " + denumireId + " = " + ID + ";";
	        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	        rs = stmt.executeQuery(queryString);
	    } catch (SQLException sqle) {
	        error = "SQLException: Interogarea nu a fost posibila.";
	        throw new SQLException(error);
	    } catch (Exception e) {
	        error = "A aparut o exceptie in timp ce se extrageau datele.";
	        throw new Exception(error);
	    }
	    return rs;
	} // end of intoarceLinieDupaId()
}
