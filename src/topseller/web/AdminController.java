package topseller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import topseller.config.GlobalVariables;
import topseller.models.*;
import topseller.service.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    CategoryService categoryService;
    @Autowired
    UserService userService;
    @Autowired
    ShopService shopService;
    @Autowired
    FileService fileService;
    @Autowired
    ProductService productService;

    @RequestMapping(value = "/users",method = RequestMethod.GET)
    public String getListUsers(Model model, HttpSession session){
        ArrayList<User> listUsers = new ArrayList<User>();
        listUsers.add(User.getMockUser());
        listUsers.add(User.getMockUser());
        listUsers.add(User.getMockUser());
        listUsers.add(User.getMockUser());
        model.addAttribute("listUsers",listUsers);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        return "admin/users";
    }

    @RequestMapping(value = "/products",method = RequestMethod.GET)
    public String getListProducts(Model model, HttpSession session){
        ArrayList<Product> listProducts = productService.searchProducts("",Category.ANY_CATEGORY(),1000,0,ProductStatus.ANY,1000,0);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        model.addAttribute("listProducts",listProducts);
        return "admin/products";
    }

    @RequestMapping(value = "/reports",method = RequestMethod.GET)
    public String getListReports(Model model, HttpSession session){
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        return "admin/reports";
    }


    @RequestMapping(value = "/messages",method = RequestMethod.GET)
    public String getListMessages(Model model, HttpSession session){
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        return "admin/messages";
    }



    @RequestMapping(value = "/shops",method = RequestMethod.GET)
    public String getPage(Model model, HttpSession session) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.ADMIN)) return "redirect:/login/signin";
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        ArrayList<Shop> listMyShops = shopService.getShopsByUser((User)session.getAttribute("loggedUser"));
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
        model.addAttribute("listMyShops",listMyShops);
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "myShops";
        model.addAttribute("pageName",pageName);
        return "account/listShops";
    }

    @RequestMapping(value = "/shop/edit",method = RequestMethod.GET)
    public String getEditShop(Model model, HttpSession session , @ModelAttribute("id") int id) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        Shop shop = shopService.getShopByID(id);
        ArrayList<Product> listProducts = productService.getProductsByShop(shop);
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
        model.addAttribute("shop",shop);
        model.addAttribute("shopForm",new ShopForm(shop.getName(),shop.getLogoURL(),shop.getCoverURL(),shop.getAddress(),shop.getPhone(),shop.getLongitude(),shop.getLatitude(),shop.getCategory().getId()));
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "myshop";
        model.addAttribute("pageName",pageName);
        model.addAttribute("type","edit");
        model.addAttribute("listProducts",listProducts);
        return "account/editShop";
    }

    @RequestMapping(value = "/shop/add",method = RequestMethod.GET)
    public String getAddShop(Model model, HttpSession session) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
        model.addAttribute("shopForm",new ShopForm("","","","","0",0.0,0.0,1));
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "myshop";
        model.addAttribute("pageName",pageName);
        model.addAttribute("type","create");
        return "account/editShop";
    }

    @RequestMapping(value = "/shop/add",method = RequestMethod.POST)
    public String doAddShop(Model model, HttpSession session , @RequestParam("logoFile") MultipartFile logoFile ,  @RequestParam("coverFile") MultipartFile coverFile,  @ModelAttribute("shopForm") ShopForm shopForm) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        Shop shop = new Shop();
        if(shopForm.getName() != "") shop.setName(shopForm.getName());
        Category c = new Category();
        c.setId(shopForm.getCategoryId());
        shop.setCategory(c);
        shop.setPhone(shopForm.getPhone());
        shop.setAddress(shopForm.getAddress());
        shop.setLatitude(shopForm.getLatitude());
        shop.setLongitude(shopForm.getLongitude());
        shop.setOwner((User)session.getAttribute("loggedUser"));


        try {
            if(logoFile != null && !logoFile.isEmpty()) {shop.setLogoURL(fileService.writeFile(logoFile.getBytes(),System.currentTimeMillis()+logoFile.getOriginalFilename())); }
            if(coverFile != null &&  !logoFile.isEmpty()) shop.setCoverURL(fileService.writeFile(coverFile.getBytes(),System.currentTimeMillis()+coverFile.getOriginalFilename()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(shop.toString());
        shopService.addShop(shop);


        return "redirect:/account/shops";
    }

    @RequestMapping(value = "/shop/edit",method = RequestMethod.POST)
    public String doEditShop(Model model, HttpSession session , @ModelAttribute("id") int id , @RequestParam("logoFile") MultipartFile logoFile ,  @RequestParam("coverFile") MultipartFile coverFile,  @ModelAttribute("shopForm") ShopForm shopForm) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        Shop shop = shopService.getShopByID(id);
        if(shopForm.getName() != "") shop.setName(shopForm.getName());
        Category c = new Category();
        c.setId(shopForm.getCategoryId());
        shop.setCategory(c);
        shop.setPhone(shopForm.getPhone());
        shop.setAddress(shopForm.getAddress());
        shop.setLatitude(shopForm.getLatitude());
        shop.setLongitude(shopForm.getLongitude());


        try {
            if(logoFile != null && !logoFile.isEmpty()) {shop.setLogoURL(fileService.writeFile(logoFile.getBytes(),System.currentTimeMillis()+logoFile.getOriginalFilename())); }
            if(coverFile != null && !coverFile.isEmpty()) shop.setCoverURL(fileService.writeFile(coverFile.getBytes(),System.currentTimeMillis()+coverFile.getOriginalFilename()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        shopService.updateShop(shop);

        return "redirect:/account/shops";
    }

    @RequestMapping(value = "/shop/delete",method = RequestMethod.GET)
    public String doEditShop(Model model, HttpSession session , @ModelAttribute("id") int id ) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        Shop shop = shopService.getShopByID(id);
        shopService.deleteShop(shop);

        return "redirect:/account/shops";
    }

    @RequestMapping(value = "/shop/product/remove",method = RequestMethod.GET)
    public String deleteProductById(Model model, HttpSession session , @ModelAttribute("id") int id , @ModelAttribute("shopId") int shopId) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        Product p = productService.getProductByID(id);
        if(p != null) {
            productService.deleteProduct(p);
        }
        return "redirect:/account/shop/edit?id="+shopId;
    }

    @RequestMapping(value = "/shop/product/photo/remove",method = RequestMethod.GET)
    public String removePhoto(Model model, HttpSession session , @ModelAttribute("id") int id , @ModelAttribute("shopId") int shopId , @ModelAttribute("name") String photoName) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        Product p = productService.getProductByID(id);
        if(p != null && photoName != "") {
            productService.deletePictureFromProduct(p,photoName);
        }
        return "redirect:/account/shop/product/edit?id="+id+"&shopId="+shopId;
    }

    @RequestMapping(value = "/shop/product/edit",method = RequestMethod.GET)
    public String showEditProduct(Model model, HttpSession session , @ModelAttribute("id") int id , @ModelAttribute("shopId") int shopId) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        Shop shop = shopService.getShopByID(shopId);
        Product product = productService.getProductByID(id);
        if(product == null) return "redirect:/account/shop/edit?id="+shopId;
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
        model.addAttribute("shop",shop);
        model.addAttribute("product",product);
        model.addAttribute("shopId",shopId);
        model.addAttribute("id",id);
        model.addAttribute("type","edit");
        ArrayList<String> images = new ArrayList<String>();
        for (int i=0;i<8;i++) images.add("");
        if(product.getImages() != null)
            for(int i=0;i<product.getImages().size();i++){
                images.set(i,product.getImages().get(i).toString());
            }
        model.addAttribute("productForm",new ProductForm(product.getName(),product.getPrice(),product.getQuantity(),product.getDescription(),product.getCategory().getId(),product.getStatus().toString(),images));
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "myshop";
        model.addAttribute("pageName",pageName);
        return "account/editProduct";
    }

    @RequestMapping(value = "/shop/product/add",method = RequestMethod.GET)
    public String showAddProduct(Model model, HttpSession session , @ModelAttribute("shopId") int shopId) {
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        ArrayList<Category> listSuperCategories = categoryService.getSuperCategories();
        Shop shop = shopService.getShopByID(shopId);
        model.addAttribute("listSuperCategories",listSuperCategories);
        model.addAttribute("imagesServerURL", GlobalVariables.imagesServerURL());
        model.addAttribute("shop",shop);
        model.addAttribute("shopId",shopId);
        model.addAttribute("type","create");
        model.addAttribute("productForm",new ProductForm("",0,0,"",1,ProductStatus.NEW.toString(),new ArrayList<String>()));
        model.addAttribute("loggedUser",(User)session.getAttribute("loggedUser"));
        String pageName = "myshop";
        model.addAttribute("pageName",pageName);
        return "account/editProduct";
    }

    @RequestMapping(value = "/shop/product/edit",method = RequestMethod.POST)
    public String doEditProdut(@ModelAttribute("shopId") int shopId, Model model, HttpSession session , @ModelAttribute("id") int id, @RequestParam("filePhoto")MultipartFile file, @ModelAttribute("productForm") ProductForm productForm){
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        Product p = productService.getProductByID(id);
        if(productForm.getName() != null) p.setName(productForm.getName());
        Category g = new Category();
        g.setId(productForm.getCategoryId());
        p.setCategory(g);
        if(productForm.getDescription() != null) p.setDescription(productForm.getDescription());
        if(productForm.getPrice() != 0) p.setPrice(productForm.getPrice());
        p.setStatus(ProductStatus.toProductStatus(productForm.getPstatus()));
        p.setQuantity(productForm.getQuantity());
        if(file != null && !file.isEmpty()) {
            try {
                productService.addPictureToProduct(p,fileService.writeFile(file.getBytes(),System.currentTimeMillis()+file.getOriginalFilename()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        productService.updateProduct(p);
        return "redirect:/account/shop/product/edit?id="+id;
    }

    @RequestMapping(value = "/shop/product/add",method = RequestMethod.POST)
    public String doAddProduct(@ModelAttribute("shopId") int shopId, Model model, HttpSession session , @RequestParam("filePhoto")MultipartFile file, @ModelAttribute("productForm") ProductForm productForm){
        if((User)session.getAttribute("loggedUser") == null || (((User) session.getAttribute("loggedUser")).getType() != UserType.VENDOR)) return "redirect:/login/signin";
        Product p = new Product();
        if(productForm.getName() != null) p.setName(productForm.getName());
        Category g = new Category();
        g.setId(productForm.getCategoryId());
        p.setCategory(g);
        if(productForm.getDescription() != null) p.setDescription(productForm.getDescription());
        if(productForm.getPrice() != 0) p.setPrice(productForm.getPrice());
        p.setStatus(ProductStatus.toProductStatus(productForm.getPstatus()));
        p.setQuantity(productForm.getQuantity());
        p.setShop(shopService.getShopByID(shopId));
        System.out.println(p.toString());
        productService.addProduct(p);
        if(file != null && !file.isEmpty()) {
            try {
                productService.addPictureToProduct(p,fileService.writeFile(file.getBytes(),System.currentTimeMillis()+file.getOriginalFilename()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/account/shop/edit?id="+shopId;
    }


}
