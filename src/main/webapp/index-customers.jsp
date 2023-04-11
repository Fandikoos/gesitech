<%@ page import="com.svalero.dao.Database"%>
<%@ page import="com.svalero.dao.CustomerDAO"%>
<%@ page import="com.svalero.domain.Customer"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<main>
    <div class="d-flex gap-2 justify-content-center py-5">
      <button class="btn btn-primary d-inline-flex align-items-center" type="button">
         <a href="product-form.jsp?action=register" class="btn btn-info my-2">Registrar nuevo producto</a>
      </button>
      <button class="btn btn-primary d-inline-flex align-items-center" type="button">
         <a href="customer-form.jsp?action=register" class="btn btn-info my-2">Registrar nuevo cliente</a>
      </button>
      <button class="btn btn-primary d-inline-flex align-items-center" type="button">
         <a href="index.jsp" class="btn btn-info my-2">Ver todos los productos</a>
      </button>
    </div>

<div class="grid" style="display: grid; grid-template-columns: auto auto auto; justify-content: space-around; align-content: space-around;">
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Customer> customerList = Database.jdbi.withExtension(CustomerDAO.class, CustomerDAO::getCustomers);
            for (Customer customer : customerList) {
        %>
            <div class="card" style="width: 20rem; margin: 20px;">
                <div class="card-body">
                    <h5 class="card-title"><%= customer.getSurname()%> </h5>
                    <h5 class="card-title"><%= customer.getName()%> </h5>
                    <p class="card-text">Dirección: <%= customer.getAddress()%></p>
                    <p class="card-text">Teléfono: <%= customer.getPhone()%></p>

                </div>
                <div class="card-body" style="display: flex; justify-content: space-evenly;">
                <a href="view-details-customers.jsp?id_customer=<%= customer.getId_customer() %>" class="card-link"><button type="button" class="btn btn-info">Ver detalles</button></a>
                <a href="customer-form.jsp?id_customer=<%= customer.getId_customer() %>&action=edit&name=<%= customer.getName() %>&surname=<%= customer.getSurname() %>&address=<%= customer.getAddress() %>&phone=<%= customer.getPhone() %>" class="card-link"><button type="button" class="btn btn-primary">Editar cliente</button></a>
                <a href="remove-customer?id_customer=<%= customer.getId_customer() %>" class="card-link"><button type="button" class="btn btn-danger">Eliminar cliente</button></a>
                </div>
            </div>
        <%
            }
        %>
</div>
</main>

<%@include file="includes/footer.jsp"%>