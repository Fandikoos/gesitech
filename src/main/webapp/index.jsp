<%@ page import="com.svalero.dao.Database"%>
<%@ page import="com.svalero.dao.ProductDAO"%>
<%@ page import="com.svalero.domain.Product"%>
<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>

    <style>
        .grid{
              display: grid;
              grid-template-columns: auto auto auto;
              justify-content: space-around;
              align-content: space-around;
              }
    </style>

<main>
    <div class="d-flex gap-2 justify-content-center py-5">
      <button class="btn btn-primary d-inline-flex align-items-center" type="button">
         <a href="product-form.jsp?action=register" class="btn btn-info my-2">Registrar nuevo producto</a>
      </button>
      <button class="btn btn-primary d-inline-flex align-items-center" type="button">
         <a href="register-order.jsp" class="btn btn-info my-2">Registrar nuevo pedido</a>
      </button>
    </div>


    <div class="grid" style="display: grid; grid-template-columns: auto auto auto; justify-content: space-around; align-content: space-around;">
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<Product> productList = Database.jdbi.withExtension(ProductDAO.class, ProductDAO::getProducts);
                for (Product product : productList) {
            %>
                <div class="card" style="width: 18rem; margin: 20px;">
                    <img src="../itech_data/<%= product.getImage() %>" class="card-img-top" >
                    <div class="card-body">
                        <h5 class="card-title">Producto: <%= product.getName()%> </h5>
                        <p class="card-text">Stock de producto: <%= product.getStock()%> uds.</p>
                        <p class="card-text">Precio unitario: <%= product.getPrice()%> $</p>

                    </div>
                    <div class="card-body" style="display: flex; justify-content: space-evenly;">
                    <a href="view-details.jsp?id=<%= product.getId() %>" class="card-link"><button type="button" class="btn btn-info">Ver detalles</button></a>
                    <a href="product-form.jsp?id=<%= product.getId() %>&action=edit&name=<%= product.getName() %>&price=<%= product.getPrice() %>&stock=<%= product.getStock() %>" class="card-link"><button type="button" class="btn btn-primary">Editar producto</button></a>
                    </div>
                </div>
            <%
                }
            %>
    </div>
</main>

<%@include file="includes/footer.jsp"%>