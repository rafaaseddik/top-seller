package topseller.DAO;

import javafx.util.Pair;
import topseller.models.*;

import java.util.ArrayList;

public interface ShopDAO {
    public Shop getShopByID(int id);

    ArrayList<Shop> searchShop(String name, Category category, String region, int limit, int page);

    ArrayList<Shop> searchShopNoCategory(String name, String region, int limit, int page);

    public void reportShop(ShopReport shopReport);

    int nb_searchShop(String name, Category category, String region, int limit);

    int  nb_searchShopNoCategory(String name, String region, int limit);

    public void rateShop(Shop shop, Comment comment);
    public void addShop(Shop shop);
    public void updateShop(Shop shop);
    public void deleteShop(Shop shop);
    public void blockShop(Shop shop);
    public ArrayList<ShopReport> getShopReportsList();
    public ArrayList<Shop> getLatestShopsList(int number);

    double getShopRating(Shop shop);

    ArrayList<Shop> getBestShops(int number);

    ArrayList<Comment> getShopComments(Shop shop);
}
