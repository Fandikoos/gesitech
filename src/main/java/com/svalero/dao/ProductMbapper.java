package com.svalero.dao;

import com.svalero.domain.Product;
import org.jdbi.v3.core.statement.StatementContext;
import org.jdbi.v3.core.mapper.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMbapper implements RowMapper<Product> {

    @Override
    public Product map(ResultSet rs, StatementContext ctx) throws SQLException{
        return new Product(rs.getInt("ID_PRODUCTO"),
                rs.getString("NOMBRE"),
                rs.getInt("STOCK"),
                rs.getInt("PRECIO"));
    }
}
