package com.mitocode.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mitocode.dto.SignoDTO;
import com.mitocode.model.Signo;

public interface ISignoDAO extends JpaRepository<Signo, Integer> {

//	fecha:11/04/2019
//	autor: yrosado
//	descripcion:Realizo un select y lo cargo en el constructor de la clase SignoDTO del paquete com.mitocode
	@Query(value="select new com.mitocode.dto.SignoDTO(s.idsigno,s.fecha,s.pulso,s.temperatura,s.ritmoRespiratorio,concat(pa.nombres,' ',pa.apellidos) as nombres) "
			+ "from signo as s "
			+ "inner join paciente as pa on pa.id_paciente=s.id_paciente "
			+ "where pa.nombre =:nombre", nativeQuery = true)
	List<SignoDTO> listaSignoPorUsuario(@Param("nombre") String nombre	);
}
