package topseller.models;

public enum UserType {
    ADMIN,VENDOR,CLIENT;
    public static UserType toUserType(String usertype){
        switch(usertype){
            case "ADMIN" : return ADMIN;
            case "VENDOR" : return VENDOR;
            case "VISITOR" : return CLIENT;
            default:return CLIENT;
        }
    }
}
