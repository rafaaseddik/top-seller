package topseller.DAO.implementations;

import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
import java.util.*;

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
        String sql = "select * from product where closed=0 AND id='" + id + "'";
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
        String sql = "INSERT INTO product (`name`, `price`, `quantity`, `description`, `categoryID`, `shopID`, `status`,`creation_date`) " +
                "VALUES (?, ?, ?,?,?,?,?)";
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        String today = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        jdbcTemplate.update(sql, new Object[] {product.getName(),product.getPrice(),product.getQuantity(),product.getDescription(),product.getCategory().getId(),product.getShop().getId(),product.getStatus().toString() ,today});

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
        String sql = "select * from product WHERE closed=0 Order By creation_date DESC LIMIT "+number;
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

        String sql = "SELECT * FROM product WHERE closed=0 AND name LIKE ? AND categoryID = ?  AND status LIKE ? AND (price BETWEEN ? AND ?) LIMIT ? OFFSET ?";
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
            System.out.println(products.toString());
            System.out.println(products.size());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.searchProducts() : Error getting database");
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public int nb_searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit) {
        String sql = "SELECT COUNT(id) AS nb FROM product WHERE closed=0 AND name LIKE ? AND categoryID = ?  AND status LIKE ? AND (price BETWEEN ? AND ?)";
        ArrayList<Integer> result = new ArrayList<Integer>();
        try{
            String statusString = "%"+(status.equals(ProductStatus.ANY)?"":status.toString())+"%";
            result = (ArrayList<Integer>)jdbcTemplate.query(sql,new Object[]{"%"+name+"%",category.getId(),statusString,min_price,max_price} ,new IntegerMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.nb_searchProducts() : Error getting database");
            e.printStackTrace();
        }

        return result.size()>0?(int)Math.ceil(((double)  result.get(0))/((float)limit)):0;
    }

    @Override
    public int nb_searchProductsNoCategory(String name, double max_price, double min_price, ProductStatus status, int limit) {
        String sql = "SELECT COUNT(id) AS nb FROM product WHERE name LIKE ? AND status LIKE ? AND (price BETWEEN ? AND ?)";
        ArrayList<Integer> result = new ArrayList<Integer>();
        try{
            String statusString = "%"+(status.equals(ProductStatus.ANY)?"":status.toString())+"%";
            result = (ArrayList<Integer>)jdbcTemplate.query(sql,new Object[]{"%"+name+"%",statusString,min_price,max_price} ,new IntegerMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.nb_searchProductsNoCategory() : Error getting database");
            e.printStackTrace();
        }

        return result.size()>0?(int)Math.ceil(((double)  result.get(0))/((float)limit)):0;
    }

    @Override
    public ArrayList<String> getProductImages(Product product){
        String sql = "SELECT imgURL FROM images WHERE productID= ?";
        ArrayList<String> images = new ArrayList<String>();
        images = (ArrayList<String>)jdbcTemplate.query(sql,new Object[]{product.getId()},new StringMapper());
        return images;
    }
    @Override
    public ArrayList<Product> getProductsByShop(Shop shop) {
        String sql = "select * from product where shopID='" + shop.getId() + "'";
        ArrayList<Product> products = new ArrayList<Product>();
        try{
            products = (ArrayList<Product>)jdbcTemplate.query(sql, new ProductMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.getProductByShop() : Error getting database");
            e.printStackTrace();
        }

        return products;
    }
    @Override
    public ArrayList<Product> getSuggestedProducts(Product product, int number) {
        String sql = "SELECT * FROM `product` WHERE (shopID= ? OR categoryID=?) AND id <> ? LIMIT ?";

        ArrayList<Product> products = new ArrayList<Product>();
        try{
            products = (ArrayList<Product>)jdbcTemplate.query(sql,new Object[]{product.getShop().getId(),product.getCategory().getId(),product.getId(),number}, new ProductMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ProductDao.getProductByShop() : Error getting database");
            e.printStackTrace();
        }

        return products;
    }
    @Override
    public ArrayList<Pair<Category,ArrayList<Product>>> getRecommendedProducts(){
        ArrayList<Category> allCategories = this.categoryDAO.getSuperCategories();
        Random random = new Random();
        String sql = "select * from category c where (select count(p.id) from product p where p.categoryID = c.id)>1";
        allCategories = (ArrayList<Category>)jdbcTemplate.query(sql, new CategoryDAOImpl.CategoryMapper());
        System.out.println(allCategories.toString());
        ArrayList<Pair<Category,ArrayList<Product>>> result = new ArrayList<Pair<Category,ArrayList<Product>>>();
        int choice1=random.nextInt(allCategories.size()),choice2=-1,choice3=-1;
        Pair<Category,ArrayList<Product>> firstPair = new Pair<Category,ArrayList<Product>>(allCategories.get(choice1),this.searchProducts("",allCategories.get(choice1),Product.MAX_PRICE,0,ProductStatus.ANY,2,0));
        allCategories.remove(choice1);
        result.add(firstPair);
        if(allCategories.size()>0){
            choice2 = random.nextInt(allCategories.size());
            Pair<Category,ArrayList<Product>> secondPair = new Pair<Category,ArrayList<Product>>(allCategories.get(choice2),this.searchProducts("",allCategories.get(choice2),Product.MAX_PRICE,0,ProductStatus.ANY,2,0));
            allCategories.remove(choice2);
            result.add(secondPair);
            if(allCategories.size()>0) {
                choice3 = random.nextInt(allCategories.size());
                Pair<Category, ArrayList<Product>> thirdPair = new Pair<Category, ArrayList<Product>>(allCategories.get(choice3), this.searchProducts("", allCategories.get(choice3), Product.MAX_PRICE, 0, ProductStatus.ANY, 2, 0));
                result.add(thirdPair);
            }
        }

        return result;
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
            product.setCreation_date((rs.getDate("creation_date")));
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
    private class IntegerMapper implements RowMapper<Integer> {
        public Integer mapRow(ResultSet rs,int argl) throws SQLException{
            return rs.getInt("nb");
        }
    }
}
