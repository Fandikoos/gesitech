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

    @SqlQuery("SELECT * FROM productos WHERE id_product = ?")
    @UseRowMapper(ProductMbapper.class)
    Product getProduct(int id_product);

    @SqlUpdate("INSERT INTO productos (name, price, stock) VALUES (?, ?, ?)")
    void addProduct (String name, int price, int stock);
}
