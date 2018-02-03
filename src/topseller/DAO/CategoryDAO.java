package topseller.DAO;

import topseller.models.Category;

import java.util.ArrayList;

public interface CategoryDAO {
    public ArrayList<Category> getSuperCategories();

    Category getCategoryByID(int ID);
}
