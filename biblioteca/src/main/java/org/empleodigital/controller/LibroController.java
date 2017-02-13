package org.empleodigital.controller;

import javax.validation.Valid;

import org.empleodigital.domain.entity.Autor;
import org.empleodigital.domain.entity.Libro;
import org.empleodigital.domain.enumeration.Categoria;
import org.empleodigital.domain.repository.AutorRepositorio;
import org.empleodigital.domain.repository.LibroRepositorio;
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
@RequestMapping("/libros")
public class LibroController {
	@Autowired
	private LibroRepositorio libroRepositorio;
	@Autowired
	private AutorRepositorio autorRepositorio;
	@Autowired
	private PropiedadesEditorAutor pollopepito;

	@RequestMapping(method = RequestMethod.GET)
	public String listarLibro(Model model) {

		Iterable<Libro> listaLibro = libroRepositorio.findAll();
		model.addAttribute("titulo", "Lista de Libros");
		model.addAttribute("libros", listaLibro);
		model.addAttribute("autores", autorRepositorio.findAll());
		model.addAttribute("categorias", Categoria.values());
		return "views/listadoLibros";

	}

	@RequestMapping(method = RequestMethod.POST)
	public String guardarLibro(@Valid @ModelAttribute Libro libro, Model model,
			BindingResult bindingResult) {

		
		System.out.println("entra al controller post");
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors().toString());

		} else {
			libroRepositorio.save(libro);

		}

		model.addAttribute("titulo", "Lista de Libros");
		model.addAttribute("libros", libroRepositorio.findAll());
		model.addAttribute("autores", autorRepositorio.findAll());
		model.addAttribute("categorias", Categoria.values());
		return "views/listadoLibros";
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
	public ResponseEntity<String> borrarLibro(@PathVariable Long id) {
		try {
			libroRepositorio.delete(id);
			return new ResponseEntity<String>(HttpStatus.OK);

		} catch (Exception ex) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);

		}
	}
	
	
	/*
	 * Edita el libro, viene con un id y devuelve un libro completo
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	@ResponseBody
	public ResponseEntity<Libro> buscarIngrediente(@PathVariable Long id) {
		Libro lib = libroRepositorio.findOne(id);
		return new ResponseEntity<>(lib, HttpStatus.OK);
	}
	
	

	@InitBinder
	public void initBinder(WebDataBinder webDateBinder){
		webDateBinder.registerCustomEditor(Autor.class, pollopepito);
	}

}
