package com.ifba.entervista.model;

import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@Entity
@Table(name = "area")
public class Area {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idArea", nullable = false)
    private long id;

    @NotNull
    @NotBlank
    @Column(name = "nombre")
    private String nome;

    public Area(Long id, String nome){
        this.id = id;
        this.nome = nome;
    }

    public Area(){
    }
}
