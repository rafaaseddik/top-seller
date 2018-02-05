package topseller.DAO.implementations;

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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Repository
public class ShopDAOImpl implements ShopDAO {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    UserDAO userDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    ProductDAO productDAO;

    @Override
    public Shop getShopByID(int id) {

        String sql = "SELECT * FROM shop WHERE closed=0 AND id='" + id + "'";
        List<Shop> shops = new ArrayList<Shop>();
        try {
            shops = jdbcTemplate.query(sql, new ShopDAOImpl.ShopMapper());
        } catch (Exception e) {
            System.out.println("-- ERROR : ShopDao.getShopByID() : Error getting database");
            e.printStackTrace();
        }

        return shops.size() > 0 ? shops.get(0) : null;
    }

    @Override
    public ArrayList<Shop> searchShop(String name, Category category, String region, int limit, int page) {

        String sql = "SELECT * FROM shop WHERE closed=0 AND name LIKE ? AND categoryID = ?  AND address LIKE ? LIMIT ? OFFSET ?";
        ArrayList<Shop> shops = new ArrayList<Shop>();
        try {
            region = "%" + region + "%";
            shops = (ArrayList<Shop>) jdbcTemplate.query(sql, new Object[]{"%" + name + "%", category.getId(), region, limit, page * limit}, new ShopDAOImpl.ShopMapper());
        } catch (Exception e) {
            System.out.println("-- ERROR : ShopDao.searchShop() : Error getting database");
            e.printStackTrace();
        }

        return shops;
    }

    @Override
    public ArrayList<Shop> searchShopNoCategory(String name, String region, int limit, int page) {

        String sql = "SELECT * FROM shop WHERE closed=0 AND name LIKE ?  AND address LIKE ? LIMIT ? OFFSET ?";
        ArrayList<Shop> shops = new ArrayList<Shop>();
        try {
            region = "%" + region + "%";
            shops = (ArrayList<Shop>) jdbcTemplate.query(sql, new Object[]{"%" + name + "%", region, limit, page * limit}, new ShopDAOImpl.ShopMapper());
        } catch (Exception e) {
            System.out.println("-- ERROR : ShopDao.searchShop() : Error getting database");
            e.printStackTrace();
        }

        return shops;
    }

    @Override
    public void rateShop(Shop shop, int rating, User user) {
        String sql = "INSERT INTO score (userID,shopID,date,score) " +
                "VALUES (?, ?, ?,?)";
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        String today = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        jdbcTemplate.update(sql, new Object[]{user.getId(), shop.getId(), today, rating});

    }

    @Override
    public void reportShop(ShopReport shopReport) {
        String sql = "INSERT INTO shopreport (`description`, `shopID`, `userID`) " +
                "VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, new Object[]{shopReport.getDescription(), shopReport.getSubject().getId(), shopReport.getUser().getId()});

    }

    @Override
    public void addShop(Shop shop) {
        String sql = "INSERT INTO `shop` (name, logo_url, cover_url, creation_date, address ,phone, longitude, latitude, userID, categoryID) " +
                "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        String today = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        jdbcTemplate.update(sql, new Object[]{shop.getName(), shop.getLogoURL(), shop.getCoverURL(),
                today, shop.getAddress(), shop.getPhone(), shop.getLongitude(), shop.getLatitude(),
                shop.getOwner().getId(), shop.getCategory().getId()});
    }

    @Override
    public void updateShop(Shop shop) {
        String sql = "UPDATE `shop` SET " +
                "`name` = ?, `logo_url` = ?, `cover_url` = ?, `address` = ?, `phone` = ?, `longitude` = ?, " +
                "`latitude` = ?, `userID` = ?, `categoryID` = ? WHERE `shop`.`id` = ?";
        jdbcTemplate.update(sql, new Object[]{shop.getName(), shop.getLogoURL(), shop.getCoverURL(),
                shop.getAddress(), shop.getPhone(), shop.getLongitude(), shop.getLatitude(),
                shop.getOwner().getId(), shop.getCategory().getId(), shop.getId()});
    }

    @Override
    public void deleteShop(Shop shop) {
        ArrayList<Product> shopProducts = this.productDAO.getProductsByShop(shop);
        for(Product product : shopProducts)
            productDAO.deleteProduct(product);
        String sql = "DELETE  from shop WHERE ID="+shop.getId();
        jdbcTemplate.update(sql);
    }

    @Override
    public void blockShop(Shop shop) {
        String sql = "UPDATE shop set `closed`=1 WHERE ID="+shop.getId();
        jdbcTemplate.update(sql);
    }

    @Override
    public ArrayList<ShopReport> getShopReportsList() {
        String sql = "select * from shopreport";
        ArrayList<ShopReport> shops = new ArrayList<ShopReport>();
        try{
            shops = (ArrayList<ShopReport>)jdbcTemplate.query(sql, new ShopReportMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ShopDao.getShopReportsList() : Error getting database");
            e.printStackTrace();
        }

        return shops;
    }

    @Override
    public ArrayList<Shop> getLatestShopsList(int number) {
        String sql = "SELECT * from shop WHERE closed=0 Order By creation_date DESC LIMIT ?";
        ArrayList<Shop> shops;
        shops = (ArrayList<Shop>) jdbcTemplate.query(sql, new Object[]{number}, new ShopMapper());
        return shops;
    }

    @Override
    public double getShopRating(Shop shop) {
        String sql = "SELECT avg(score) as score FROM `score` WHERE shopID= ?";
        List<Double> score;
        score = jdbcTemplate.query(sql, new Object[]{shop.getId()}, new DoubleMapper());
        return score.isEmpty() ? 0 : score.get(0);
    }

    @Override
    public ArrayList<Shop> getBestShops(int number) {
        String sql = "SELECT shop.*,avg(score.score) as score from shop, score where shop.id=score.shopID group by shop.id order by score DESC LIMIT ?";
        ArrayList<Shop> shops;
        shops = (ArrayList<Shop>) jdbcTemplate.query(sql, new Object[]{number}, new ShopMapper());
        return shops;
    }
    @Override
    public ArrayList<Comment> getShopComments(Shop shop){
        String sql = "Select * from score where shopID= ?";
        ArrayList<Comment> comments = new ArrayList<>();
        comments = (ArrayList<Comment> )jdbcTemplate.query(sql,new Object[]{shop.getId()},new CommentMapper());
        return comments;
    }
    class ShopMapper implements RowMapper<Shop> {
        public Shop mapRow(ResultSet rs, int arg1) throws SQLException {
            Shop shop = new Shop();
            shop.setId(rs.getInt("id"));
            shop.setName(rs.getString("name"));
            shop.setLogoURL(rs.getString("logo_url"));
            shop.setCoverURL(rs.getString("cover_url"));
            shop.setCreationDate(rs.getDate("creation_date"));
            shop.setAddress(rs.getString("address"));
            shop.setLongitude(rs.getDouble("longitude"));
            shop.setLatitude(rs.getDouble("latitude"));
            shop.setClosed(rs.getBoolean("closed"));
            shop.setOwner(ShopDAOImpl.this.userDAO.getUserByID(rs.getInt("userID")));
            shop.setCategory(ShopDAOImpl.this.categoryDAO.getCategoryByID(rs.getInt("categoryID")));
            shop.setCommentsList(ShopDAOImpl.this.getShopComments(shop));
            return shop;
        }
    }

    class ShopReportMapper implements RowMapper<ShopReport> {
        UserDAO userDAO = ShopDAOImpl.this.userDAO;

        public ShopReport mapRow(ResultSet rs, int arg1) throws SQLException {
            ShopReport shopReport = new ShopReport();
            shopReport.setId(rs.getInt("id"));
            shopReport.setDescription(rs.getString("description"));
            shopReport.setValidated(rs.getBoolean("validated"));
            shopReport.setSubject(ShopDAOImpl.this.getShopByID(rs.getInt("shopID")));
            shopReport.setUser(this.userDAO.getUserByID(rs.getInt("userID")));
            return shopReport;
        }
    }

    class CommentMapper implements RowMapper<Comment> {
        UserDAO userDAO = ShopDAOImpl.this.userDAO;

        public Comment mapRow(ResultSet rs, int arg1) throws SQLException {
            Comment comment = new Comment();
            comment.setId(rs.getInt("id"));
            comment.setUser(this.userDAO.getUserByID(rs.getInt("userID")));
            comment.setDate(rs.getDate("date"));
            comment.setText(rs.getString("comment"));
            comment.setScore(rs.getInt("score"));
            return comment;
        }
    }

    private class DoubleMapper implements RowMapper<Double> {
        public Double mapRow(ResultSet rs, int argl) throws SQLException {
            return rs.getDouble("score");
        }
    }
}
