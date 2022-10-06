package com.ifba.entervista.models;

import java.util.ArrayList;
import java.util.List;

// import java.util.ArrayList;
// import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Candidatos")
public class CandidateModel {
    

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private static Integer id;

    @Column(name="Primer Nombre")
    private String firstName;

    @Column(name="Apellido")
    private String lastName;

    @Column(name = "Ocupación")
    private String occupation;

    @Column(name = "Teléfono")
    private String phoneNumber;

    @Column(name="Cumpleaños")
    private String birthday;

    @Column(name="email")
    private String email;


    // possible list of candidates
    List<CandidateModel> candidates = new ArrayList<>();


    public CandidateModel(String firstName, String lastName, String occupation, String phoneNumber, String birthday,
            String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.occupation = occupation;
        this.phoneNumber = phoneNumber;
        this.birthday = birthday;
        this.email = email;
    }

    // Getters and setters

    public Integer getId() {
        return id;
    }

    // public void setId(Integer id) {
    //     this.id = id;
    // }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        if(firstName!=null){
            if(firstName!=""){
                this.firstName = firstName;   
            }
        }
        
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        if(lastName!=null){
            if(lastName!=""){
                this.lastName = lastName;
            }
        }
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        if(occupation!=null){
            if(occupation!=""){
                this.occupation = occupation;
            }
        }
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        if(phoneNumber!=null){
            if(phoneNumber!=""){
                this.phoneNumber = phoneNumber;                
            }
        }
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        if(birthday!=null){
            if(birthday!=""){
                this.birthday = birthday;
            }
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if(email!=null){
            if(email!=""){
                this.email = email;
            }
        }
    }


    public void setCandidates(CandidateModel candidate){
        // candidates.add(candidate);
        candidates.add(candidate);
    }

    public List<CandidateModel> getCandidates(){
        return candidates;
    }
}
