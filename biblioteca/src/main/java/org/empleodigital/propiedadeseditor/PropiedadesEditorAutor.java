package org.empleodigital.propiedadeseditor;

import java.beans.PropertyEditorSupport;

import org.empleodigital.domain.entity.Autor;
import org.empleodigital.domain.repository.AutorRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PropiedadesEditorAutor extends PropertyEditorSupport{
@Autowired private AutorRepositorio autorRepositorio;
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		long idAutor = Long.parseLong(text);
		Autor autor= autorRepositorio.findOne(idAutor);
		setValue(autor);

	}
	
}
