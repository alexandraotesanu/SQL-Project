package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.entity.Centralizare;
import com.example.demo.service.CentralizareService;
import com.example.demo.entity.Angajat;
import com.example.demo.repository.ReviewRepository;
import com.example.demo.repository.AngajatRepository;
import com.example.demo.entity.Review;

@Controller
public class CentralizareController {
    private CentralizareService centralizareService;

    @Autowired
    private AngajatRepository angajatRepo;

    @Autowired
    private ReviewRepository reviewRepo;

    public CentralizareController(CentralizareService centralizareService) {
        super();
        this.centralizareService = centralizareService;
    }

    @GetMapping("/centralizari")
    public String listCentralizari(Model model) {
        model.addAttribute("centralizari", centralizareService.getAllCentralizari());
        return "centralizari";
    }

    @GetMapping("/centralizari/new")
    public String createCentralizareForm(Model model) {
        List<Angajat> totiangajatii = angajatRepo.findAll();
        List<Review> toatereviewurile = reviewRepo.findAll();
        
        System.out.println("Angajati: " + totiangajatii.size());
        System.out.println("Review-uri: " + toatereviewurile.size());
        
        Centralizare centralizare = new Centralizare();
        model.addAttribute("centralizare", centralizare);
        model.addAttribute("totiangajatii", totiangajatii);
        model.addAttribute("toatereviewurile", toatereviewurile);
        return "create_centralizare";
    }

    @PostMapping("/centralizari")
    public String saveCentralizare(@ModelAttribute("centralizare") Centralizare centralizare) {
        centralizareService.saveCentralizare(centralizare);
        return "redirect:/centralizari";
    }

    @GetMapping("/centralizari/edit/{id}")
    public String editMedicForm(@PathVariable Long id, Model model) {
        List<Angajat> totiangajatii = angajatRepo.findAll();
        List<Review> toatereviewurile = reviewRepo.findAll();
        model.addAttribute("centralizare", centralizareService.getCentralizareById(id));
        model.addAttribute("totiangajatii", totiangajatii);
        model.addAttribute("toatereviewurile", toatereviewurile);
        return "edit_centralizare";
    }

    @PostMapping("/centralizari/{id}")
    public String updateCentralizare(@PathVariable Long id,
                                      @ModelAttribute("centralizare") Centralizare centralizare,
                                      Model model) {
        Centralizare centralizareExistenta = centralizareService.getCentralizareById(id);
        centralizareExistenta.setId(id);
        centralizareExistenta.setAngajat(centralizare.getAngajat());
        centralizareExistenta.setReview(centralizare.getReview());
        centralizareService.updateCentralizare(centralizareExistenta);
        return "redirect:/centralizari";
    }

    @GetMapping("/centralizari/{id}")
    public String deleteCentralizare(@PathVariable Long id) {
        centralizareService.deleteCentralizareById(id);
        return "redirect:/centralizari";
    }
}
