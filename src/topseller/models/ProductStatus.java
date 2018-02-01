package topseller.models;

public enum ProductStatus {
    NEW,USED,BROKEN,BARELY_USED;
    public static ProductStatus toProductStatus(String productstatus){
        switch(productstatus){
            case "NEW" : return NEW;
            case "USED" : return USED;
            case "BROKEN" : return BROKEN;
            case "BARELY_USED" : return BARELY_USED;
            default:return NEW;
        }
    }
}
