package org.empleodigital.propiedadeseditor;

import java.beans.PropertyEditorSupport;

import javax.management.relation.Role;

import org.empleodigital.domain.repository.RoleRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RolePropertyEditor extends PropertyEditorSupport {
	@Autowired
	RoleRepositorio roleRepo;

	@Override
	public void setAsText(String text) {
		long idRol = Long.parseLong(text);
		Role rol = roleRepo.findOne(idRol);
		setValue(rol);
	}
}
