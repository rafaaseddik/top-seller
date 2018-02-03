package topseller.DAO;

import javafx.util.Pair;
import topseller.models.*;

import java.util.ArrayList;

public interface ShopDAO {
    public Shop getShopByID(int id);
    public ArrayList<Shop> searchShopByName(String name);
    public ArrayList<Shop> searchShopByCategory(Category category);
    public ArrayList<Shop> searchShopByRegion(String region);
    public ArrayList<Shop> searchShopInProximity(Pair<Float,Float> center,int distance);
    public ArrayList<Shop> searchShopByRating(int rating);
    public void reportShop(ShopReport shopReport);
    public void ratetShop(int rating,User user);
    public void addShop(Shop shop);
    public void updateShop(Shop shop);
    public void deleteShop(Shop shop);
    public void blockShop(Shop shop);
    public ArrayList<ShopReport> getShopReportsList();
    public ArrayList<Shop> getLatestShopsList(int number);
}
