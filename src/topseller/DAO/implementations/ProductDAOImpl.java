package topseller.DAO.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import topseller.DAO.CategoryDAO;
import topseller.DAO.ProductDAO;
import topseller.DAO.ShopDAO;
import topseller.DAO.UserDAO;
import topseller.models.*;


import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    UserDAO userDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    ShopDAO shopDAO;

    @Override
    public Product getProductByID(int id) {
        String sql = "select * from product where id='" + id + "'";
        List<Product> products = new ArrayList<Product>();
        try{
            products = jdbcTemplate.query(sql, new ProductMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.getProductByID() : Error getting database");
            e.printStackTrace();
        }

        return products.size() > 0 ? products.get(0) : null;
    }

    @Override
    public void reportProduct(ProductReport productReport) {
        String sql = "INSERT INTO productreport (`description`, `productID`, `userID`) " +
                "VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, new Object[] { productReport.getDescription(),productReport.getSubject().getId(),productReport.getUser().getId()});

    }
    @Override
    public void addProduct(Product product){
        String sql = "INSERT INTO product (`name`, `price`, `quantity`, `description`, `categoryID`, `shopID`, `status`) " +
                "VALUES (?, ?, ?,?,?,?,?)";
        jdbcTemplate.update(sql, new Object[] {product.getName(),product.getPrice(),product.getQuantity(),product.getDescription(),product.getCategory().getId(),product.getShop().getId(),product.getStatus().toString() });

    }
    @Override
    public void updateProduct(Product product) {

        String sql = "UPDATE product set `name` = ? , `price`=?, `quantity`=?, `description`=?, `categoryID`=?, `shopID`=?, `status`=?" +
                " WHERE ID="+product.getId();
        jdbcTemplate.update(sql, new Object[] {product.getName(),product.getPrice(),product.getQuantity(),product.getDescription(),product.getCategory().getId(),product.getShop().getId(),product.getStatus().toString() });

    }

    @Override
    public void deleteProduct(Product product) {
        String sql = "DELETE  from product WHERE ID="+product.getId();
        jdbcTemplate.update(sql);

    }

    @Override
    public void blockProduct(Product product) {
        String sql = "UPDATE product set `closed`=1 WHERE ID="+product.getId();
        jdbcTemplate.update(sql);
    }

    @Override
    public ArrayList<ProductReport> getProductReportsList() {
        String sql = "select * from productreport";
        ArrayList<ProductReport> products = new ArrayList<ProductReport>();
        try{
            products = (ArrayList<ProductReport>)jdbcTemplate.query(sql, new ProductReportMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.getProductByID() : Error getting database");
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public ArrayList<Product> getLatestProductsList(int number) {
        String sql = "select * from product order by id DESC LIMIT "+number;
        ArrayList<Product> products = new ArrayList<Product>();
        try{
            products = (ArrayList<Product>)jdbcTemplate.query(sql, new ProductMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.getLatestProductsList() : Error getting database");
            e.printStackTrace();
        }

        return products;
    }
    @Override
    public ArrayList<Product> searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit, int page) {

        String sql = "SELECT * FROM product WHERE name LIKE ? AND categoryID = ?  AND status LIKE ? AND (price BETWEEN ? AND ?) LIMIT ? OFFSET ?";
        ArrayList<Product> products = new ArrayList<Product>();
        try{
            String statusString = "%"+(status.equals(ProductStatus.ANY)?"":status.toString())+"%";
            products = (ArrayList<Product>)jdbcTemplate.query(sql,new Object[]{"%"+name+"%",category.getId(),statusString,min_price,max_price,limit,page*limit} ,new ProductMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.searchProducts() : Error getting database");
            e.printStackTrace();
        }

        return products;
    }
    @Override
    public ArrayList<Product> searchProductsNoCategory(String name, double max_price, double min_price, ProductStatus status, int limit, int page) {

        String sql = "SELECT * FROM product WHERE name LIKE ?  AND status LIKE ? AND (price BETWEEN ? AND ?) LIMIT ? OFFSET ?";
        ArrayList<Product> products = new ArrayList<Product>();
        try{
            String statusString = "%"+(status.equals(ProductStatus.ANY)?"":status.toString())+"%";
            products = (ArrayList<Product>)jdbcTemplate.query(sql,new Object[]{"%"+name+"%",statusString,min_price,max_price,limit,page*limit} ,new ProductMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.searchProducts() : Error getting database");
            e.printStackTrace();
        }

        return products;
    }
    @Override
    public ArrayList<String> getProductImages(Product product){
        String sql = "SELECT imgURL FROM images WHERE productID= ?";
        ArrayList<String> images = new ArrayList<String>();
        images = (ArrayList<String>)jdbcTemplate.query(sql,new Object[]{product.getId()},new StringMapper());
        return images;
    }
    class ProductMapper implements RowMapper<Product> {
        public Product mapRow(ResultSet rs, int arg1) throws SQLException {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getFloat("price"));
            product.setQuantity(rs.getInt("quantity"));
            product.setDescription(rs.getString("description"));
            product.setClosed(rs.getBoolean("closed"));
            product.setStatus(ProductStatus.toProductStatus(rs.getString("status")));
            product.setCategory(ProductDAOImpl.this.categoryDAO.getCategoryByID(rs.getInt("categoryID")));
            product.setImages(ProductDAOImpl.this.getProductImages(product));
            product.setShop(ProductDAOImpl.this.shopDAO.getShopByID(rs.getInt("shopID")));
            return product;
        }
    }
    class ProductReportMapper implements RowMapper<ProductReport> {
        UserDAO userDAO = ProductDAOImpl.this.userDAO;
        public ProductReport mapRow(ResultSet rs, int arg1) throws SQLException {
            ProductReport productReport = new ProductReport();
            productReport.setId(rs.getInt("id"));
            productReport.setDescription(rs.getString("description"));
            productReport.setValidated(rs.getBoolean("validated"));
            productReport.setSubject(ProductDAOImpl.this.getProductByID(rs.getInt("productID")));
            productReport.setUser(this.userDAO.getUserByID(rs.getInt("userID")));
            return productReport;
        }
    }

    private class StringMapper implements RowMapper<String> {
        public String mapRow(ResultSet rs,int argl) throws SQLException{
            return rs.getString("imgURL");
        }
    }
}
