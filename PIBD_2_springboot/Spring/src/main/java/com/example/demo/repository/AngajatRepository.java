package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.entity.Angajat;

public interface AngajatRepository extends JpaRepository<Angajat, Long> {
}
