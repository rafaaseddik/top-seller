package topseller.models;

public enum UserType {
    ADMIN,VENDOR,VISITOR;
    public static UserType toUserType(String usertype){
        switch(usertype){
            case "ADMIN" : return ADMIN;
            case "VENDOR" : return VENDOR;
            case "VISITOR" : return VISITOR;
            default:return VISITOR;
        }
    }
}
