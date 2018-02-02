package topseller.service;

import javafx.util.Pair;
import topseller.models.Category;
import topseller.models.Shop;
import topseller.models.ShopReport;
import topseller.models.User;

import java.util.ArrayList;

public interface ShopService {
    Shop getShopByID(int id);

    ArrayList<Shop> searchShopByName(String name);

    ArrayList<Shop> searchShopByCategory(Category category);

    ArrayList<Shop> searchShopByRegion(String region);

    ArrayList<Shop> searchShopInProximity(Pair<Float, Float> center, int distance);

    ArrayList<Shop> searchShopByRating(int rating);

    void ratetShop(int rating, User user);

    void reportShop(ShopReport shopReport);

    void addShop(Shop shop);

    void updateShop(Shop shop);

    void deleteShop(Shop shop);

    void blockShop(Shop shop);

    ArrayList<ShopReport> getShopReportsList();

    ArrayList<Shop> getLatestShopsList(int number);
}
