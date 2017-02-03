package org.empleodigital.controller;


import javax.validation.Valid;

import org.empleodigital.domain.entity.Autor;
import org.empleodigital.domain.repository.AutorRepositorio;
import org.empleodigital.propiedadeseditor.PropiedadesEditorAutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("/autores")
public class AutorController {
	@Autowired
	private AutorRepositorio autorRepositorio;
	@Autowired
	private PropiedadesEditorAutor pollopepito;

	@RequestMapping(method = RequestMethod.GET)
	public String listarAutor(Model model) {

		
		model.addAttribute("titulo", "Lista de Autor");
		model.addAttribute("autores", autorRepositorio.findAll());
		
		return "views/listadoAutor";

	}
	@RequestMapping(method = RequestMethod.POST)
	public String guardarAutor(@Valid @ModelAttribute Autor autor, Model model,
			BindingResult bindingResult) {

		
		System.out.println("entra al controller post");
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors().toString());

		} else {
			autorRepositorio.save(autor);

		}

		model.addAttribute("titulo", "Lista de Autor");
		model.addAttribute("autores", autorRepositorio.findAll());
		
		return "views/listadoAutor";
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
	public ResponseEntity<String> borrarAutor(@PathVariable Long id) {
		try {
			autorRepositorio.delete(id);
			return new ResponseEntity<String>(HttpStatus.OK);

		} catch (Exception ex) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);

		}
	}
	

	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	@ResponseBody
	public Autor buscarAutor(@PathVariable Long id) {
		Autor autor =autorRepositorio.findOne(id);
		return autor;
	}
	@InitBinder
	public void initBinder(WebDataBinder webDateBinder){
		webDateBinder.registerCustomEditor(Autor.class, pollopepito);
	}

}
