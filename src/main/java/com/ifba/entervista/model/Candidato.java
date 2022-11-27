package com.ifba.entervista.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@Entity
@Table(name = "candidato")
public class Candidato {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idCandidato", nullable = false)
    private Long id;

    @NotBlank
    @NotNull
    @NotEmpty
    @Column(name = "nombre")
    private String nombre;

    @NotBlank
    @NotNull
    @NotEmpty
    @Column(name = "apellido")
    private String apellido;

    @NotBlank
    @NotNull
    @NotEmpty
    @Column(name = "ocupacion")
    private String ocupacion;

    @NotBlank
    @NotNull
    @NotEmpty
    @Column(name = "numeroDeTelefono")
    private String numeroDeTelefono;

    @NotBlank
    @NotNull
    @NotEmpty
    @Column(name = "cumpleanos")
    private String cumpleanos;

    @NotBlank
    @NotNull
    @NotEmpty
    @Column(name = "email")
    private String email;

    public Candidato(Long id, String nombre, String apellido, String ocupacion, String numeroDeTelefono,
            String cumpleanos, String email) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.ocupacion = ocupacion;
        this.numeroDeTelefono = numeroDeTelefono;
        this.cumpleanos = cumpleanos;
        this.email = email;
    }

    public Candidato() {
    }

    
}

