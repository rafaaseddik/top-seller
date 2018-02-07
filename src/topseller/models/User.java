package topseller.models;

import org.springframework.web.multipart.MultipartFile;

public class User {
    private int id;
    private String fname;
    private String lname;
    private String email;
    private String password;
    private String region;
    private String avatarUrl;
    private String phone;
    private UserType type;
    private int nbStrikes=0;
    private MultipartFile file;
    private String imagesServerURL;
    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getAvatarUrl() { return imagesServerURL+avatarUrl; }
    public String getRawAvatarUrl(){ return avatarUrl;}

    public void setAvatarUrl(String avatarUrl) { this.avatarUrl = avatarUrl; }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public UserType getType() {
        return type;
    }

    public void setType(UserType type) {
        this.type = type;
    }

    public int getNbStrikes() {
        return nbStrikes;
    }

    public void setNbStrikes(int nbStrikes) {
        this.nbStrikes = nbStrikes;
    }

    public void setImagesServerURL(String imagesServerURL) {
        this.imagesServerURL = imagesServerURL;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", email='" + email + '\'' +
                ", region='" + region + '\'' +
                ", avatarUrl='" + avatarUrl + '\'' +
                ", phone='" + phone + '\'' +
                ", type=" + type +
                ", nbStrikes=" + nbStrikes +
                '}';
    }

    public static User getMockUser() {
        User user = new User();
        user.setId(6);
        user.setEmail("rafaaseddik");
        return user;
    }
}
