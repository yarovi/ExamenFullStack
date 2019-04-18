package com.mitocode.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.mitocode.dto.SignoDTO;
//import com.mitocode.dto.SignoDTO;
import com.mitocode.model.Signo;

public interface ISignoService extends ICRUD<Signo> {

	Signo registrar(Signo dto);
//	fecha:11/04/2019
//	autor: yrosado
//	descripcion:retorna una lista de un tipo de dato personalizado
	List<SignoDTO> listaSignoPorUsuario(@Param("nombre") String nombre	);
	
}
