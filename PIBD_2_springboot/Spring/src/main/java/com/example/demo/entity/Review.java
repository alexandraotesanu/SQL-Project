package com.example.demo.entity;


import jakarta.persistence.*;
import java.util.Set;
import java.time.LocalDateTime;

@Entity
@Table(name = "Reviewuri")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_review")
    private Long idReview;

    @Column(name = "titlu", length = 100)
    private String titlu;

    @Column(name = "nume_reclamant", nullable = false, length = 100)
    private String numeReclamant;

    @Column(name = "prenume_reclamant", nullable = false, length = 100)
    private String prenumeReclamant;

    @Column(name = "detalii", length = 255)
    private String detalii;

    @Column(name = "data_review")
    private LocalDateTime dataReview;

    @OneToMany(mappedBy="review", cascade = 
    		CascadeType.ALL,orphanRemoval = true)
    		private Set<Centralizare> centr;
    
    public Review() {
    }

    public Review(String titlu, String numeReclamant, String prenumeReclamant, String detalii, LocalDateTime dataReview, Set<Centralizare> c) {
    	super();
    	this.titlu = titlu;
        this.numeReclamant = numeReclamant;
        this.prenumeReclamant = prenumeReclamant;
        this.detalii = detalii;
        this.dataReview = dataReview;
        this.centr = c;
    }

    public Long getIdReview() {
        return idReview;
    }

    public void setIdReview(Long idReview) {
        this.idReview = idReview;
    }

    public String getTitlu() {
        return titlu;
    }

    public void setTitlu(String titlu) {
        this.titlu = titlu;
    }

    public String getNumeReclamant() {
        return numeReclamant;
    }

    public void setNumeReclamant(String numeReclamant) {
        this.numeReclamant = numeReclamant;
    }

    public String getPrenumeReclamant() {
        return prenumeReclamant;
    }

    public void setPrenumeReclamant(String prenumeReclamant) {
        this.prenumeReclamant = prenumeReclamant;
    }

    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }

    public LocalDateTime getDataReview() {
        return dataReview;
    }

    public void setDataReview(LocalDateTime dataReview) {
        this.dataReview = dataReview;
    }
    
    public Set<Centralizare> getCentr() {
    	return this.centr;
    	}
    	public void setCentr(Set<Centralizare> centr) {
    	this.centr = centr;
    	}
}