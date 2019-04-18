package com.mitocode.dto;

import java.time.LocalDateTime;

public class SignoDTO {

	int id;
	LocalDateTime fecha;
	int pulso;
	int temperatura;
	int ritmoRespiratorio;
	String nombreCompleto;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDateTime getFecha() {
		return fecha;
	}
	public void setFecha(LocalDateTime fecha) {
		this.fecha = fecha;
	}
	public int getPulso() {
		return pulso;
	}
	public void setPulso(int pulso) {
		this.pulso = pulso;
	}
	public int getTemperatura() {
		return temperatura;
	}
	public void setTemperatura(int temperatura) {
		this.temperatura = temperatura;
	}
	public int getRitmoRespiratorio() {
		return ritmoRespiratorio;
	}
	public void setRitmoRespiratorio(int ritmoRespiratorio) {
		this.ritmoRespiratorio = ritmoRespiratorio;
	}
	public String getNombreCompleto() {
		return nombreCompleto;
	}
	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}
	public SignoDTO(int id, LocalDateTime fecha, int pulso, int temperatura, int ritmoRespiratorio,
			String nombreCompleto) {
		super();
		this.id = id;
		this.fecha = fecha;
		this.pulso = pulso;
		this.temperatura = temperatura;
		this.ritmoRespiratorio = ritmoRespiratorio;
		this.nombreCompleto = nombreCompleto;
	}
	
}
