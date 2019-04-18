package com.mitocode.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mitocode.model.Usuario;

public interface IUsuarioDAO extends JpaRepository<Usuario, Integer> {
		
	Usuario findOneByUsername(String username);	
	//truco cuando se usa el prefijo findOneBy + name atributo entity spring mappea wiht value 
}