
<%@ page import="com.svalero.dao.Database"%>
<%@ page import="com.svalero.dao.ProductDAO"%>
<%@ page import="com.svalero.domain.Product"%>
<%@ page import="java.util.List"%>

<%@include file="includes/header.jsp"%>

<main>
    <div class="grid">
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Product> productList = Database.jdbi.withExtension(ProductDAO.class, ProductDAO::getProducts);
            for (Product product : productList) {
        %>
            <div class="card" style="width: 18rem;">
                <img src="https://res.cloudinary.com/grover/image/upload/f_webp,q_auto/b_white,c_pad,dpr_2.0,h_500,w_520/f_auto,q_auto/v1632241420/tcv0cs8qg7mkzuerdljr.png" class="card-img-top" alt="...">
                <div class="card-body">
                <h5 class="card-title">Producto: <%= product.getName()%> </h5>
                <p class="card-text">Stock de producto: <%= product.getStock()%></p>
                </div>
                <div class="card-body">
                <a href="view-details.jsp?id_product=<%= product.getId_product() %>" class="card-link">View more details</a>
                <a href="edit-vehicle.jsp?id_product=<%= product.getId_product() %>" class="card-link">Edit product</a>
                </div>
            </div>
        <%
            }
        %>
    </div>
</main>

<%@include file="includes/footer.jsp"%>