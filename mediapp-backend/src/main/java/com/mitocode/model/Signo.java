package com.mitocode.model;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

@Entity
@Table(name = "signo")
public class Signo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idSigno;
	@JsonSerialize(using = ToStringSerializer.class) 
	@Column(name="fecha")
	private LocalDateTime fecha;
	
	@Column(name="temperatura")
	private int temperatura;
	
	@Column(name="pulso")
	private Integer pulso;
	
	@Column(name="ritmoRespiratorio")
	private Integer ritmoRespiratorio;
	
	//relacion bidireccion
//	@JsonIgnore (maldita anitacion no debiste estar habilitado )
	@ManyToOne
	@JoinColumn(name = "id_paciente", nullable = false, foreignKey = @ForeignKey(name = "consulta_paciente"))
	private Paciente paciente;	

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public Integer getIdSigno() {
		return idSigno;
	}

	public void setIdSigno(Integer idSigno) {
		this.idSigno = idSigno;
	}

	public LocalDateTime getFecha() {
		return fecha;
	}

	public void setFecha(LocalDateTime fecha) {
		this.fecha = fecha;
	}

	public int getTemperatura() {
		return temperatura;
	}

	public void setTemperatura(int temperatura) {
		this.temperatura = temperatura;
	}

	public Integer getPulso() {
		return pulso;
	}

	public void setPulso(Integer pulso) {
		this.pulso = pulso;
	}

	public Integer getRitmoRespiratorio() {
		return ritmoRespiratorio;
	}

	public void setRitmoRespiratorio(Integer ritmoRespiratorio) {
		this.ritmoRespiratorio = ritmoRespiratorio;
	}

	@Override
	public String toString() {
		return "Signo [idSigno=" + idSigno + ", fecha=" + fecha + ", temperatura=" + temperatura + ", pulso=" + pulso
				+ ", ritmoRespiratorio=" + ritmoRespiratorio + ", paciente=" + paciente + "]";
	}


	
}
