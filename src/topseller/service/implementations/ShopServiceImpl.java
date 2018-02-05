package topseller.service.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import topseller.DAO.ShopDAO;
import topseller.models.Category;
import topseller.models.Shop;
import topseller.models.ShopReport;
import topseller.models.User;
import topseller.service.ShopService;

import java.util.ArrayList;

@Service
public class ShopServiceImpl implements ShopService {
  @Autowired
  ShopDAO shopDAO;
    @Override
    public Shop getShopByID(int id) {
        return this.shopDAO.getShopByID(id);
    }
  @Override
  public ArrayList<Shop> searchShops(String name, Category category, String region, int limit, int page){
    if(category.equals(Category.ANY_CATEGORY()))
      return this.shopDAO.searchShopNoCategory(name,region,limit,page);
    return this.shopDAO.searchShop(name,category,region,limit,page);
  }
  @Override
  public ArrayList<Shop> getBestShops(int number){
    return this.shopDAO.getBestShops(number);
  }

    @Override
    public void rateShop(Shop shop, int rating, User user) {
      this.shopDAO.rateShop(shop, rating,user);
    }

    @Override
    public void reportShop(ShopReport shopReport) {
      this.shopDAO.reportShop(shopReport);
    }

    @Override
    public void addShop(Shop shop) {
        shopDAO.addShop(shop);
    }

    @Override
    public void updateShop(Shop shop) {
      shopDAO.updateShop(shop);
    }

    @Override
    public void deleteShop(Shop shop) {
      shopDAO.deleteShop(shop);
    }

    @Override
    public void blockShop(Shop shop) {
        shopDAO.blockShop(shop);
    }

    @Override
    public ArrayList<ShopReport> getShopReportsList() {
        return shopDAO.getShopReportsList();
    }

    @Override
    public ArrayList<Shop> getLatestShopsList(int number) {
        return shopDAO.getLatestShopsList(number);
    }
}
