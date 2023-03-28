package com.svalero.dao;

import com.svalero.domain.Product;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ProductDAO {

    @SqlQuery("SELECT * FROM PRODUCTOS")
    @UseRowMapper(ProductMbapper.class)
    List<Product> getProducts();
}
