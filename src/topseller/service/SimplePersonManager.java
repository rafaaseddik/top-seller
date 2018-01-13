package topseller.service;

import topseller.models.Person;

import java.util.ArrayList;
import java.util.List;

public class SimplePersonManager implements PersonManager {
    private List<Person> persons;
    @Override
    public List<Person> getPerson() {
        return this.persons;
    }

    @Override
    public void addPerson(String nom, String prenom, int age) {

    }

    public void setPersons(List<Person> persons) {
        this.persons = persons;
    }
}
