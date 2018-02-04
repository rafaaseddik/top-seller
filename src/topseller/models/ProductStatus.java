package topseller.models;

public enum ProductStatus {
    NEW,USED,BROKEN,BARELY_USED,ANY;
    public static ProductStatus toProductStatus(String productstatus){
        switch(productstatus){
            case "NEW" : return NEW;
            case "USED" : return USED;
            case "BROKEN" : return BROKEN;
            case "ANY" : return ANY;
            case "BARELY_USED" : return BARELY_USED;
            default:return ANY;
        }
    }
}
