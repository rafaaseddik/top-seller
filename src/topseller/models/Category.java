package topseller.models;

import java.util.ArrayList;

public class Category {
    private int id;
    private String name;
    private Category parent=null;
    private int parentID=-1;
    private ArrayList<Category> children=null;

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

    public ArrayList<Category> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<Category> children) {
        this.children = children;
    }
    public void addChild(Category child){
        this.children.add(child);
    }
    public void deleteChild(Category child){
        this.children.remove(child);
    }

    public int getParentID() {
        return parentID;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ((parent==null)?(", parentID=" + parentID):(", parent=" + parent)) +
                ", children=" + children +
                "}\n";
    }

    public static Category getMockCategory(){
        Category electronics = new Category();
        electronics.setId(1);
        electronics.setName("Electronics");
        electronics.setParent(null);
        Category phones = new Category();
        phones.setId(11);
        phones.setName("Mobile phones");
        phones.setParent(electronics);
        return phones;
    }

}
