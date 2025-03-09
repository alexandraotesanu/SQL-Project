package com.example.demo.service;

import java.util.List;
import com.example.demo.entity.Angajat;

public interface AngajatService {
    List<Angajat> getAllAngajati();
    Angajat saveAngajat(Angajat angajat);
    Angajat getAngajatById(Long idAngajat);  
    Angajat updateAngajat(Angajat angajat);
    void deleteAngajatById(Long idAngajat);
}
