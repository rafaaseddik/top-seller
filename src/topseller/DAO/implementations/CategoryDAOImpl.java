package topseller.DAO.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import topseller.DAO.CategoryDAO;
import topseller.models.Category;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public ArrayList<Category> getSuperCategories() {
        // GetParents
        String sql = "SELECT * FROM category ORDER BY parentID";
        HashMap<Integer, Category> parentsMap = new HashMap<Integer, Category>();
        List<Category> categories = new ArrayList<Category>();
        try {
            categories = jdbcTemplate.query(sql, new CategoryMapper());
            for (Category category : categories) {
                if (category.getParentID() < 1) {
                    category.setChildren(new ArrayList<Category>());
                    parentsMap.put(category.getId(), category);
                } else {
                    category.setParent(parentsMap.get(category.getParentID()));
                    parentsMap.get(category.getParentID()).addChild(category);
                }

            }
        } catch (Exception e) {
            System.out.println("-- ERROR : CategoryDao.getSuperCategories() : Error getting database");
            e.printStackTrace();
        }

        return new ArrayList<Category>(parentsMap.values());
    }

    class CategoryMapper implements RowMapper<Category> {

        public Category mapRow(ResultSet rs, int arg1) throws SQLException {
            Category category = new Category();
            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));
            try {
                category.setParentID(rs.getInt("parentID"));
            } catch (Exception e) {
            }
            return category;
        }
    }
}
