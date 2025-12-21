package com.minio.film_dizi_system.controller;

import com.minio.film_dizi_system.model.Film;
import com.minio.film_dizi_system.service.FilmService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/film")
public class FilmController {

    private final FilmService filmService;

    public FilmController(FilmService filmService) {
        this.filmService = filmService;
    }

    // Film listeleme
    @GetMapping("/list")
    public String listFilms(Model model) {
        model.addAttribute("films", filmService.getAllFilms());
        return "film_list";  // templates/film_list.html
    }

    // Film ekleme formu
    @GetMapping("/add")
    public String showAddFilmForm(Model model) {
        model.addAttribute("film", new Film());
        return "film_add";  // templates/film_add.html
    }

    // Film kaydetme
    @PostMapping("/add")
    public String saveFilm(@ModelAttribute Film film) {
        filmService.saveFilm(film);
        return "redirect:/film/list";
    }

    // Film düzenleme formu
    @GetMapping("/edit/{id}")
    public String editFilm(@PathVariable Integer id, Model model) {
        Film film = filmService.getFilmById(id);
        model.addAttribute("film", film);
        return "film_edit";
    }

    // Film güncelleme
    @PostMapping("/update")
    public String updateFilm(@ModelAttribute Film film) {
        filmService.saveFilm(film);
        return "redirect:/film/list";
    }

    // Film silme
    @GetMapping("/delete/{id}")
    public String deleteFilm(@PathVariable Integer id) {
        filmService.deleteFilm(id);
        return "redirect:/film/list";
    }
    @GetMapping("/hello")
    @ResponseBody
    public String hello() { return "HELLO"; }

    @GetMapping("/test-view")
    public String testView() {
        return "test";
    }
    
    

}
