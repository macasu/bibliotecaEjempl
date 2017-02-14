package org.empleodigital.domain.repository;

import java.util.List;

import org.empleodigital.domain.entity.Autor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface AutorRepositorio  extends JpaRepository<Autor,Long>{


	List<Autor> findAllByNombreContaining(String nombre);

}
