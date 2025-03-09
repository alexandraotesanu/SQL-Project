package com.example.demo.entity;

import java.util.Set;

import jakarta.persistence.*;

@Entity
@Table(name = "Angajati")
public class Angajat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_angajat")
    private Long idAngajat;

    @Column(name = "nume", nullable = false, length = 100)
    private String nume;

    @Column(name = "prenume", nullable = false, length = 100)
    private String prenume;

    @Column(name = "adresa", length = 50)
    private String adresa;

    @Column(name = "cnp", unique = true, nullable = false, length = 13)
    private String cnp;

    @Column(name = "pozitie", length = 50)
    private String pozitie;

    @Column(name = "departament", length = 50)
    private String departament;

    @OneToMany(mappedBy="angajat", cascade = 
    		CascadeType.ALL,orphanRemoval = true)
    		private Set<Centralizare> centr;
    
    public Angajat() {
    }

    public Angajat(String nume, String prenume, String adresa, String cnp, String pozitie, String departament, Set<Centralizare> c) {
        super();
    	this.nume = nume;
        this.prenume = prenume;
        this.adresa = adresa;
        this.cnp = cnp;
        this.pozitie = pozitie;
        this.departament = departament;
        this.centr=c;
    }

    public Long getIdAngajat() {
        return idAngajat;
    }

    public void setIdAngajat(Long idAngajat) {
        this.idAngajat = idAngajat;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getCnp() {
        return cnp;
    }

    public void setCnp(String cnp) {
        this.cnp = cnp;
    }

    public String getPozitie() {
        return pozitie;
    }

    public void setPozitie(String pozitie) {
        this.pozitie = pozitie;
    }

    public String getDepartament() {
        return departament;
    }

    public void setDepartament(String departament) {
        this.departament = departament;
    }
    
    public Set<Centralizare> getCentr() {
    	return this.centr;
    	}
    	public void setCentr(Set<Centralizare> centr) {
    	this.centr = centr;
    	}
}
