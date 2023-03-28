package com.svalero.dao;

import com.svalero.domain.Product;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ProductDAO {

    @SqlQuery("SELECT * FROM PRODUCTOS")
    @UseRowMapper(ProductMbapper.class)
    List<Product> getProducts();

    @SqlUpdate("INSERT INTO productos (ID_PRODUCTO, NOMBRE, STOCK, PRECIO) VALUES (?, ?, ?, ?)")
    void addProduct (int ID_PRODUCTO, String NOMBRE, int STOCK, int PRECIO);
}
