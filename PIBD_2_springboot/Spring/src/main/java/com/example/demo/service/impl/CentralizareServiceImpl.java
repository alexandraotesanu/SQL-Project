package com.example.demo.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Centralizare;
import com.example.demo.repository.CentralizareRepository;
import com.example.demo.service.CentralizareService;

@Service
public class CentralizareServiceImpl implements CentralizareService {

    private CentralizareRepository CentralizareRepository;

    public CentralizareServiceImpl(CentralizareRepository CentralizareRepository) {
        super();
        this.CentralizareRepository = CentralizareRepository;
    }

    @Override
    public List<Centralizare> getAllCentralizari() {
        return CentralizareRepository.findAll();
    }

    @Override
    public Centralizare saveCentralizare(Centralizare Centralizare) {
        return CentralizareRepository.save(Centralizare);
    }

    @Override
    public Centralizare getCentralizareById(Long id) {
        return CentralizareRepository.findById(id).get();
    }

    @Override
    public Centralizare updateCentralizare(Centralizare Centralizare) {
        return CentralizareRepository.save(Centralizare);
    }

    @Override
    public void deleteCentralizareById(Long id) {
        CentralizareRepository.deleteById(id);
    }
}
