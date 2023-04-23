package com.svalero.dao;

import com.svalero.domain.Product;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ProductDAO {

    @SqlQuery("SELECT * FROM productos")
    @UseRowMapper(ProductMbapper.class)
    List<Product> getProducts();

    @SqlQuery("SELECT * FROM productos WHERE id = ?")
    @UseRowMapper(ProductMbapper.class)
    Product getProduct(int id);

    @SqlUpdate("INSERT INTO productos (name, price, stock, image) VALUES (?, ?, ?, ?)")
    void addProduct (String name, int price, int stock, String image);

    @SqlUpdate("DELETE FROM productos WHERE id = ?")
    void removeProduct(int id_product);

    @SqlUpdate("UPDATE productos SET name = ?, price = ?, stock = ?, image = ? WHERE id = ?")
    void editProduct(String name, int price, int stock, String image, int id);

    @SqlQuery("SELECT * FROM productos WHERE name = ? AND price = ?")
    @UseRowMapper(ProductMbapper.class)
    List<Product> getFilterProducts(String name, int price);

}
