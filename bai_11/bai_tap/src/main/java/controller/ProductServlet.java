package controller;

import model.bean.Product;
import model.service.Impl.ProductServiceImpl;
import model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = {"","/product"})
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                creatProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "find":
                findProduct(request,response);
                break;
        }
    }

    private void findProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        Product resusltProduct = productService.findById(id);

        request.setAttribute("resusltProduct",resusltProduct);
        request.getRequestDispatcher("/product/find.jsp").forward(request,response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        productService.remove(id);
        showListProduct(request,response);
    }

    private void creatProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        String name = request.getParameter("nameProduct");
        double price = Double.parseDouble(request.getParameter("priceProduct"));
        boolean status = Boolean.parseBoolean(request.getParameter("statusProduct"));
        Product product = new Product(id,name,price,status);
        productService.save(product);
        showListProduct(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                creatFormProduct(request,response);
                break;
            case "delete":
                deleteFormProduct(request,response);
                break;
            case "find":
                findFormProduct(request,response);
                break;
            default:
                showListProduct(request,response);
        }
    }

    private void findFormProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/product/find.jsp");
    }

    private void deleteFormProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/product/delete.jsp");
    }

    private void creatFormProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/product/create.jsp").forward(request,response);
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList =  productService.findAll();
        request.setAttribute("productList",productList);
        request.getRequestDispatcher("/product/list.jsp").forward(request,response);
    }
}
