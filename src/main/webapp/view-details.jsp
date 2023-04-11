<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.ProductDAO" %>
<%@ page import="com.svalero.domain.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp" %>

<main>
<%
    int productId = Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Product product = Database.jdbi.withExtension(ProductDAO.class, dao -> dao.getProduct(productId));
%>

<div style="display: flex; justify-content: center; align-items: center; padding-top: 15px;>
    <div class="container_details">
        <div class="card" style="width: 18rem; border: 3px solid black;">
          <img src="../itech_data/<%= product.getImage() %>" class="card-img-top" alt="imagen del producto">
          <div class="card-body">
            <h5 class="card-title"><%= product.getName() %></h5>
            <p class="card-text">Aquí tienes mas detalles sobre el producto: <b> <%= product.getName() %></b></p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"><b> Precio: </b><%= product.getPrice() %> $</li>
            <li class="list-group-item"><b> Stock: </b><%= product.getStock() %> unidades</li>
            <li class="list-group-item"><b> Id del producto: </b><%= product.getId() %></li>
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