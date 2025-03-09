package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.demo.entity.Angajat;
import com.example.demo.service.AngajatService;

@Controller
public class AngajatController {

    private AngajatService angajatService;

    public AngajatController(AngajatService angajatService) {
        super();
        this.angajatService = angajatService;
    }

    // Metoda handler care se ocupă cu lista angajaților, returnarea și vizualizarea lor
    @GetMapping("/angajati")
    public String listAngajati(Model model) {
        model.addAttribute("angajati", angajatService.getAllAngajati());
        return "angajati";
    }

    @GetMapping("/angajati/new")
    public String createAngajatForm(Model model) {
        // Creează obiectul angajat pentru a stoca datele din formular
        Angajat angajat = new Angajat();
        model.addAttribute("angajat", angajat);
        return "create_angajat";
    }

    @PostMapping("/angajati")
    public String saveAngajat(@ModelAttribute("angajat") Angajat angajat) {
        angajatService.saveAngajat(angajat);
        return "redirect:/angajati";
    }

    @GetMapping("/angajati/edit/{idAngajat}")
    public String editAngajatForm(@PathVariable Long idAngajat, Model model) {
        model.addAttribute("angajat", angajatService.getAngajatById(idAngajat));
        return "edit_angajat";
    }

    @PostMapping("/angajati/{idAngajat}")
    public String updateAngajat(@PathVariable Long idAngajat,
                                 @ModelAttribute("angajat") Angajat angajat,
                                 Model model) {
        // Preia angajatul din baza de date după câmpul idAngajat
        Angajat angajatExistent = angajatService.getAngajatById(idAngajat);
        angajatExistent.setIdAngajat(idAngajat);
        angajatExistent.setNume(angajat.getNume());
        angajatExistent.setPrenume(angajat.getPrenume());
        angajatExistent.setAdresa(angajat.getAdresa());
        angajatExistent.setCnp(angajat.getCnp());
        angajatExistent.setPozitie(angajat.getPozitie());
        angajatExistent.setDepartament(angajat.getDepartament());
        // Salvează un obiect angajat modificat
        angajatService.updateAngajat(angajatExistent);
        return "redirect:/angajati";
    }

    // Metoda de tip handler folosită pentru a se ocupa cu cererea de ștergere a angajatului
    @GetMapping("/angajati/{idAngajat}")
    public String deleteAngajat(@PathVariable Long idAngajat) {
        angajatService.deleteAngajatById(idAngajat);
        return "redirect:/angajati";
    }
}
