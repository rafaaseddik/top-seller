package topseller.models;

import java.util.Date;

public class Shop extends Subject{
    private int id;
    private String name;
    private String logoURL;
    private String coverURL;
    private Date creationDate;
    private String address;
    private String phone;
    private Double longitude;
    private Double latitude;
    private Double globalScore;
    private boolean closed;
    private User owner;
    private Category category;
}
