package com.example.demo.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Angajat;
import com.example.demo.repository.AngajatRepository;
import com.example.demo.service.AngajatService;

@Service
public class AngajatServiceImpl implements AngajatService {

    private AngajatRepository AngajatRepository;  

    public AngajatServiceImpl(AngajatRepository AngajatRepository) {
        super();
        this.AngajatRepository = AngajatRepository; 
    }

    @Override
    public List<Angajat> getAllAngajati() {
        return AngajatRepository.findAll();  
    }

    @Override
    public Angajat saveAngajat(Angajat Angajat) {
        return AngajatRepository.save(Angajat);  
    }

    @Override
    public Angajat getAngajatById(Long idAngajat) {
        return AngajatRepository.findById(idAngajat).get();  
    }

    @Override
    public Angajat updateAngajat(Angajat Angajat) {
        return AngajatRepository.save(Angajat);  
    }

    @Override
    public void deleteAngajatById(Long idAngajat) {
        AngajatRepository.deleteById(idAngajat);  
    }
}
