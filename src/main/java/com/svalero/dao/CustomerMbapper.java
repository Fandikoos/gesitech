package com.svalero.dao;

import com.svalero.domain.Customer;
import com.svalero.util.DateUtils;
import org.jdbi.v3.core.statement.StatementContext;
import org.jdbi.v3.core.mapper.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
public class CustomerMbapper implements RowMapper<Customer>{

    @Override
    public Customer map(ResultSet rs, StatementContext ctx) throws SQLException{
        return new Customer (rs.getInt("id_customer"),
                rs.getString("name"),
                rs.getString("surname"),
                rs.getString("address"),
                rs.getInt("phone"));
    }


}
