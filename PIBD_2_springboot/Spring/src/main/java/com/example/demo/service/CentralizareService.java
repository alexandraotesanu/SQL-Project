package com.example.demo.service;

import java.util.List;
import com.example.demo.entity.Centralizare;

public interface CentralizareService {
    List<Centralizare> getAllCentralizari();
    Centralizare saveCentralizare(Centralizare centralizare);
    Centralizare getCentralizareById(Long id); 
    Centralizare updateCentralizare(Centralizare centralizare);
    void deleteCentralizareById(Long id);
}
