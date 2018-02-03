package topseller.service.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import topseller.DAO.CategoryDAO;
import topseller.models.Category;
import topseller.service.CategoryService;

import java.util.ArrayList;
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryDAO categoryDAO;
    @Override
    public ArrayList<Category> getSuperCategories(){
        return this.categoryDAO.getSuperCategories();
    }
}
