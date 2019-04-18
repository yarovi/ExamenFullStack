package com.mitocode.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mitocode.exception.ModeloNotFoundException;
import com.mitocode.model.Signo;
import com.mitocode.service.ISignoService;

@RestController
@RequestMapping("/signo")
public class SignoController {
	private static final Log LOG = LogFactory.getLog(SignoController.class);
	@Autowired
	private ISignoService service;
	
	@PostMapping
	public ResponseEntity<Signo> registrar(@RequestBody Signo signo) {
		LOG.info("creando  ... "+ signo);
		signo=service.registrar(signo);
		return new ResponseEntity<Signo>(signo, HttpStatus.OK);
	}
	
	@PutMapping
	public Signo modificar(@RequestBody Signo signo) {
		LOG.info("actualizondo   ... "+ signo);
		return service.modificar(signo);
	}
	
	@DeleteMapping(value ="/{id}")
	public void eliminar(@PathVariable("id") Integer id) {
		Signo signo = service.listarId(id);
		if (signo == null) {
			throw new ModeloNotFoundException("ID NO ENCONTRADO" + id);
		} else {
			service.eliminar(id);
		}
	}
	
	@GetMapping(value="/{id}")
	public Signo listarPorId(@PathVariable("id") Integer id) {
		Signo signo=service.listarId(id);
		LOG.info("listando x ID  ... "+ signo);
		return signo;
	}
	
	@GetMapping
	public ResponseEntity<List<Signo>> listar(){//		List<Signo lsSigno =service.listaSignoPorUsuario(nombre);
//		nombre = (nombre == null) ? "" : nombre;
		List<Signo> lsSigno =service.listar();
		LOG.info("listando  ... "+ lsSigno );

		return new ResponseEntity<List<Signo>>(lsSigno,HttpStatus.OK);
	}
	

}
