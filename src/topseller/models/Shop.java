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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogoURL() {
        return logoURL;
    }

    public void setLogoURL(String logoURL) {
        this.logoURL = logoURL;
    }

    public String getCoverURL() {
        return coverURL;
    }

    public void setCoverURL(String coverURL) {
        this.coverURL = coverURL;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getGlobalScore() {
        return globalScore;
    }

    public void setGlobalScore(Double globalScore) {
        this.globalScore = globalScore;
    }

    public boolean isClosed() {
        return closed;
    }

    public void setClosed(boolean closed) {
        this.closed = closed;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public Category getCategory() {
        return category;
    }

    @Override
    public String toString() {
        return "Shop{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", logoURL='" + logoURL + '\'' +
                ", coverURL='" + coverURL + '\'' +
                ", creationDate=" + creationDate +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", globalScore=" + globalScore +
                ", closed=" + closed +
                ", owner=" + owner +
                ", category=" + category +
                '}';
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    public static Shop getMockShop(){
        Shop shop = new Shop();
        shop.setId(15);
        shop.setName("Apple Store");
        shop.setCategory(Category.getMockCategory());
        shop.setPhone("25011291");
        shop.setAddress("TUNIS");
        shop.setCoverURL("coverURL");
        shop.setCreationDate(new Date(System.currentTimeMillis()));
        shop.setLogoURL("logoURL");
        shop.setOwner(User.getMockUser());
        return shop;
    }
}
