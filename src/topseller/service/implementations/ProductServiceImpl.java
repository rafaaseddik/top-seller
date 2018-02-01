package topseller.service.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import topseller.DAO.ProductDAO;
import topseller.models.Product;
import topseller.models.ProductReport;
import topseller.service.ProductService;

import java.util.ArrayList;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDAO productDAO;

    @Override
    public Product getProductByID(int id) {
        return this.productDAO.getProductByID(id);
    }

    @Override
    public void reportProduct(ProductReport productReport) {
        this.productDAO.reportProduct(productReport);

    }
    @Override
    public void addProduct(Product product){
        this.productDAO.addProduct(product);
    }
    @Override
    public void updateProduct(Product product) {
        this.productDAO.updateProduct(product);
    }
    @Override
    public void deleteProduct(Product product) {
        this.productDAO.deleteProduct(product);
    }
    @Override
    public void blockProduct(Product product) {
        this.productDAO.blockProduct(product);
    }
    //TODO
    @Override
    public ArrayList<ProductReport> getProductReportsList() {
        return this.productDAO.getProductReportsList();
    }
    public ArrayList<Product> getLatestProductsList(int number){
        return this.productDAO.getLatestProductsList(number);
    }
}
