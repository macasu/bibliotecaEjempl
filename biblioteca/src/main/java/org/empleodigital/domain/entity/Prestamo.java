package org.empleodigital.domain.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Prestamo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="usuario")
	private Usuario usuario;
	
	@OneToOne
	@JoinColumn(name="libro")
	private Libro libro;
	
	@NotNull
	@NotEmpty
	private Date fecharecogida;
	@NotNull
	@NotEmpty
	private Date fechaentrega;
	@NotNull
	private boolean entregado;
	
}
