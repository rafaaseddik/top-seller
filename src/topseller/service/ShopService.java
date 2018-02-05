package topseller.service;

import javafx.util.Pair;
import topseller.models.*;

import java.util.ArrayList;

public interface ShopService {
    Shop getShopByID(int id);

    ArrayList<Shop> searchShops(String name, Category category, String region, int limit, int page);


    int nb_searchShops(String name, Category category, String region, int limit);

    ArrayList<Shop> getBestShops(int number);

    void rateShop(Shop shop,Comment comment);

    void reportShop(ShopReport shopReport);

    void addShop(Shop shop);

    void updateShop(Shop shop);

    void deleteShop(Shop shop);

    void blockShop(Shop shop);

    ArrayList<ShopReport> getShopReportsList();

    ArrayList<Shop> getLatestShopsList(int number);
}
