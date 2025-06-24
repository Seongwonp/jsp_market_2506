package com.opentime.jsp_market_2506.DAO;

import com.opentime.jsp_market_2506.DTO.Product;
import com.opentime.jsp_market_2506.database.DBConnection;
import lombok.Getter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Getter
public class ProductRepository {
    private final List<Product> products = new ArrayList<>();

    // 싱글턴 타입으로 인스턴스 생성
    private static ProductRepository instance = new ProductRepository();
    public static ProductRepository getInstance() {
        return instance;
    }

    private ProductRepository() {
        Product phone = new Product("P1234", "iPhone 15 Pro", 1600000);
        phone.setDescription("6.1-inch, 2556x1179 Super Retina XDR display, 48-megapixel main camera, A17 Pro chip");
        phone.setCategory("Smart Phone");
        phone.setManufacturer("Apple");
        phone.setUnitsInStock(1000);
        phone.setCondition("New");
        products.add(phone);

        Product notebook = new Product("P1235", "LG Gram 16", 2200000);
        notebook.setDescription("16-inch, WQXGA IPS display, 13th Gen Intel Core i7 processor, ultra-lightweight design");
        notebook.setCategory("Notebook");
        notebook.setManufacturer("LG");
        notebook.setUnitsInStock(1000);
        notebook.setCondition("Refurbished");
        products.add(notebook);

        Product tablet = new Product("P1236", "Galaxy Tab S9 Ultra", 1400000);
        tablet.setDescription("14.6-inch, Dynamic AMOLED 2X display, Snapdragon 8 Gen 2 processor, S Pen support");
        tablet.setCategory("Tablet");
        tablet.setManufacturer("Samsung");
        tablet.setUnitsInStock(1000);
        tablet.setCondition("Old");
        products.add(tablet);
    }

    // 상품 아이디를 받아서 같은 상품 아이디를 가진 Product 객체를 반환. -> 없을 경우에는 null 반환
    public Product getProductById(String productId) {
        String SQL = "SELECT * FROM product WHERE productId=?";
        Product product = null;
        try{
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, productId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                product = Product.builder()
                        .productId(productId)
                        .productName(resultSet.getString("productName"))
                        .unitPrice(resultSet.getInt("unitPrice"))
                        .manufacturer(resultSet.getString("manufacturer"))
                        .description(resultSet.getString("description"))
                        .category(resultSet.getString("category"))
                        .unitsInStock(resultSet.getInt("unitsInStock"))
                        .condition(resultSet.getString("condition"))
                        .build();
                return product;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void addProduct(Product product) {
        products.add(product);
    }


}
