package com.example.demo.entity;

import jakarta.persistence.*;


@Entity
@Table(name = "Centralizari")
public class Centralizare {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_angajat", nullable = false)
    private Angajat angajat;

    @ManyToOne
    @JoinColumn(name = "id_review", nullable = false)
    private Review review;

    public Centralizare() {
    }

    public Centralizare(Angajat angajat, Review review) {
        super();
    	this.angajat = angajat;
        this.review = review;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Angajat getAngajat() {
        return angajat;
    }

    public void setAngajat(Angajat angajat) {
        this.angajat = angajat;
    }

    public Review getReview() {
        return review;
    }

    public void setReview(Review review) {
        this.review = review;
    }
}
