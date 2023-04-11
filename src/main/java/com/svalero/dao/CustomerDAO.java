package com.svalero.dao;

import com.svalero.domain.Customer;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CustomerDAO {

    @SqlQuery("SELECT * FROM clientes")
    @UseRowMapper(CustomerMbapper.class)
    List<Customer> getCustomers();

    @SqlQuery("SELECT * FROM clientes WHERE id_customer = ?")
    @UseRowMapper(CustomerMbapper.class)
    Customer getCustomer(int id_order);

    @SqlUpdate("INSERT INTO clientes (name, surname, address, phone) VALUE (?, ?, ?, ?)")
    void addCustomer (String name, String surname, String address, int phone);

    @SqlUpdate("DELETE FROM clientes WHERE id_customer = ?")
    void removeCustomer(int id_customer);

    @SqlUpdate("UPDATE clientes SET name = ?, surname = ?, address = ?, phone = ? WHERE id_customer = ?")
    void editCustomer(String name, String surname, String address, int phone, int id_customer);
}
