package topseller.service;

import javafx.util.Pair;
import topseller.models.*;

import java.util.ArrayList;

public interface ShopService {
    public Shop getShopByID(int id);
    public Shop getAdminShopByID(int id);

    ArrayList<Shop> getAllShops();

    ArrayList<Shop> searchShops(String name, Category category, String region, int limit, int page);


    int nb_searchShops(String name, Category category, String region, int limit);

    ArrayList<Shop> getBestShops(int number);

    void rateShop(Shop shop,Comment comment);

    void reportShop(ShopReport shopReport);

    void addShop(Shop shop);

    void updateShop(Shop shop);

    void deleteShop(Shop shop);

    void blockShop(Shop shop);

    public void unblockShop(Shop shop);

    ArrayList<ShopReport> getShopReportsList();

    ArrayList<Shop> getLatestShopsList(int number);

    ArrayList<Shop> getShopsByUser(User user);
}
