package com.svalero.dao;

import com.svalero.domain.Order;
import com.svalero.util.DateUtils;
import org.jdbi.v3.core.statement.StatementContext;
import org.jdbi.v3.core.mapper.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
public class OrderMbapper implements RowMapper<Order>{

    @Override
    public Order map(ResultSet rs, StatementContext ctx) throws SQLException{
        return new Order(rs.getInt("id_order"),
                rs.getInt("id_customer"),
                rs.getInt("id_product"),
                DateUtils.getLocalDate(rs.getDate("registration_date"))
        );
    }


}
