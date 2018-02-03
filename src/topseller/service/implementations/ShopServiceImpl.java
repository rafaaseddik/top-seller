package topseller.service.implementations;

import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import topseller.DAO.ShopDAO;
import topseller.models.Category;
import topseller.models.Shop;
import topseller.models.ShopReport;
import topseller.models.User;
import topseller.service.ShopService;

import java.util.ArrayList;
import java.util.List;

@Service
public class ShopServiceImpl implements ShopService {
  @Autowired
  ShopDAO shopDAO;
    @Override
    public Shop getShopByID(int id) {
        return this.shopDAO.getShopByID(id);
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
}
