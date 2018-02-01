package topseller.models;

public class Category {
    private int id;
    private String name;
    private Category parent=null;

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

    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public static Category getMockCategory(){
        Category electronics = new Category();
        electronics.setId(1);
        electronics.setName("Electronics");
        electronics.setParent(null);
        Category phones = new Category();
        phones.setId(2);
        phones.setName("Mobile phones");
        phones.setParent(electronics);
        return phones;
    }

}
