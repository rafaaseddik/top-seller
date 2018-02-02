package topseller.service;

import topseller.models.Category;

import java.util.ArrayList;

public interface CategoryService {
    ArrayList<Category> getSuperCategories();
}
