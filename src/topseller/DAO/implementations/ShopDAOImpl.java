package topseller.DAO.implementations;

import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
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
    UserDAO userDAO;
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

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
            /*shop.setPrice(rs.getFloat("price"));
            shop.setQuantity(rs.getInt("quantity"));
            shop.setDescription(rs.getString("description"));
            shop.setClosed(rs.getBoolean("closed"));
            shop.setStatus(ProductStatus.toProductStatus(rs.getString("status")));*/
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
