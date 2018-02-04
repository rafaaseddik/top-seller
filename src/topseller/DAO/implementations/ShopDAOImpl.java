package topseller.DAO.implementations;

import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import topseller.DAO.CategoryDAO;
import topseller.DAO.ShopDAO;
import topseller.DAO.UserDAO;
import topseller.models.*;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

    @Override
    public Shop getShopByID(int id) {

        String sql = "SELECT * FROM shop WHERE id='" + id + "'";
        List<Shop> shops = new ArrayList<Shop>();
        try{
            shops = jdbcTemplate.query(sql, new ShopDAOImpl.ShopMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ShopDao.getShopByID() : Error getting database");
            e.printStackTrace();
        }

        return shops.size() > 0 ? shops.get(0) : null;
    }

    @Override
    public ArrayList<Shop> searchShop(String name, Category category, String region, int limit, int page) {

        String sql = "SELECT * FROM shop WHERE name LIKE ? AND categoryID = ?  AND address LIKE ? LIMIT ? OFFSET ?";
        ArrayList<Shop> shops = new ArrayList<Shop>();
        try{
            region = "%"+region+"%";
            shops = (ArrayList<Shop>)jdbcTemplate.query(sql,new Object[]{"%"+name+"%",category.getId(),region,limit,page*limit} ,new ShopDAOImpl.ShopMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ShopDao.searchShop() : Error getting database");
            e.printStackTrace();
        }

        return shops;
    }
    @Override
    public ArrayList<Shop> searchShopNoCategory(String name,String region, int limit, int page) {

        String sql = "SELECT * FROM shop WHERE name LIKE ?  AND address LIKE ? LIMIT ? OFFSET ?";
        ArrayList<Shop> shops = new ArrayList<Shop>();
        try{
            region = "%"+region+"%";
            shops = (ArrayList<Shop>)jdbcTemplate.query(sql,new Object[]{"%"+name+"%",region,limit,page*limit} ,new ShopDAOImpl.ShopMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : ShopDao.searchShop() : Error getting database");
            e.printStackTrace();
        }

        return shops;
    }

    @Override
    public void rateShop(int rating, User user) {

    }

    @Override
    public void reportShop(ShopReport shopReport) {

    }

    @Override
    public void addShop(Shop shop) {

    }

    @Override
    public void updateShop(Shop shop) {

    }

    @Override
    public void deleteShop(Shop shop) {

    }

    @Override
    public void blockShop(Shop shop) {

    }

    @Override
    public ArrayList<ShopReport> getShopReportsList() {
        return null;
    }

    @Override
    public ArrayList<Shop> getLatestShopsList(int number) {
        return null;
    }

    @Override
    public double getShopRating(Shop shop){
        String sql = "SELECT avg(score) as score FROM `score` WHERE shopID= ?";
        List<Double> score;
        score=  jdbcTemplate.query(sql,new Object[]{shop.getId()},new DoubleMapper());
        return score.isEmpty()?0:score.get(0);
    }

    @Override
    public ArrayList<Shop> getBestShops(int number){
        String sql = "SELECT shop.*,avg(score.score) as score from shop, score where shop.id=score.shopID group by shop.id order by score DESC LIMIT ?";
        ArrayList<Shop> shops;
        shops=  (ArrayList<Shop> )jdbcTemplate.query(sql,new Object[]{number},new ShopMapper());
        return shops;
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
            shop.setGlobalScore(ShopDAOImpl.this.getShopRating(shop));
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

    private class DoubleMapper implements RowMapper<Double> {
        public Double mapRow(ResultSet rs,int argl) throws SQLException{
            return rs.getDouble("score");
        }
    }
}
