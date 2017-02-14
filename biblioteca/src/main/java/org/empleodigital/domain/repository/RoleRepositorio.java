package org.empleodigital.domain.repository;

import javax.management.relation.Role;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepositorio extends JpaRepository<Role, Long>{

}
