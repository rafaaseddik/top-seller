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
            System.out.println("-- ERROR : ProductDao.getProductByID() : Error getting database");
            e.printStackTrace();
        }

        return shops.size() > 0 ? shops.get(0) : null;
    }

    @Override
    public ArrayList<Shop> searchShopByName(String name) {
        return null;
    }

    @Override
    public ArrayList<Shop> searchShopByCategory(Category category) {
        return null;
    }

    @Override
    public ArrayList<Shop> searchShopByRegion(String region) {
        return null;
    }

    @Override
    public ArrayList<Shop> searchShopInProximity(Pair<Float, Float> center, int distance) {
        return null;
    }

    @Override
    public ArrayList<Shop> searchShopByRating(int rating) {
        return null;
    }

    @Override
    public void ratetShop(int rating, User user) {

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
}
