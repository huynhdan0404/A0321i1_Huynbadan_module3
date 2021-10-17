package model.repository.Impl;

import model.bean.Product;
import model.repository.ProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository {
    private static Map<Integer,Product> products;
    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "samsung", 100, true));
        products.put(2, new Product(2, "nokia", 200, true));
        products.put(3, new Product(3, "iphone", 300, true));
        products.put(4, new Product(4, "vsmart", 400, true));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public Product remove(int id) {
        products.remove(id);
        return null;
    }
}
