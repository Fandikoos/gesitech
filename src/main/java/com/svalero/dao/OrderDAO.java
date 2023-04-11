package com.svalero.dao;

import com.svalero.domain.Order;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.Date;
import java.util.List;

public interface OrderDAO {

    @SqlQuery("SELECT * FROM pedidos")
    @UseRowMapper(OrderMbapper.class)
    List<Order> getOrders();

    @SqlQuery("SELECT * FROM pedidos WHERE id_order = ?")
    @UseRowMapper(OrderMbapper.class)
    Order getOrder(int id_order);

    @SqlUpdate("INSERT INTO pedidos (id_order, id_customer, id_product, registration_date) VALUE (?, ?, ?, ?)")
    void addOrder (int id_order, int id_customer, int id_product, Date registration_date);

    @SqlUpdate("DELETE FROM pedidos WHERE id_order = ?")
    void removeOrder(int id_order);

    @SqlUpdate("UPDATE pedidos SET id_order = ?, id_customer = ?, id_product = ? WHERE id_order = ?")
    void editOrder(int id_order, int id_customer, int id_product);
}
