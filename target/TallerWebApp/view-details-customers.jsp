<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp" %>

<main>
<%
    int customerId = Integer.parseInt(request.getParameter("id_customer"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Customer customer = Database.jdbi.withExtension(CustomerDAO.class, dao -> dao.getCustomer(customerId));
%>

<div style="display: flex; justify-content: center; align-items: center; padding-top: 15px;>
    <div class="container_details">
        <div class="card" style="width: 18rem; border: 3px solid black;">
          <div class="card-body">
            <h5 class="card-title"><%= customer.getName() %></h5>
            <p class="card-text">Aquí tienes mas información sobre el cliente: <b> <%= customer.getName() %> <%= customer.getSurname() %></b></p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"><b> Dirección:  </b><%= customer.getAddress() %></li>
            <li class="list-group-item"><b> Teléfono </b><%= customer.getPhone() %></li>
            <li class="list-group-item"><b> Id del cliente: </b><%= customer.getId_customer() %></li>
          </ul>
          <div class="card-body" style="text-align: center;">
            <a href="index.jsp" class="card-link" style="text-decoration: none; color: darkmagenta;"><b>Index de productos</b></a>
          </div>
          <div class="card-body" style="text-align: center;">
           <a href="index-customers.jsp" class="card-link" style="text-decoration: none; color: darkmagenta;"><b>Index de clientes</b></a>
          </div>
      </div>
    </div>
</div>
</main>
<%@ include file="includes/footer.jsp"%>