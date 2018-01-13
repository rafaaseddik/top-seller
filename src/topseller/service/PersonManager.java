package topseller.service;

import topseller.models.Person;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public interface PersonManager extends Serializable {
    public List<Person> getPerson();
    public void addPerson(String nom,String prenom,int age);
}
