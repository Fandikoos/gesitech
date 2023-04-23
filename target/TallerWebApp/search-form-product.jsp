<%@ page import="com.svalero.dao.Database"%>
<%@ page import="com.svalero.dao.ProductDAO"%>
<%@ page import="com.svalero.domain.Product"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.get("search-product", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<main>
<div class= "container">
    <br/>

    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Buscar producto</li>
      </ol>
    </nav>

    <form class="row g-3" method="get" action="search-product" enctype="multipart/form-data">
      <div class="row mb-3">
            <label for="nombre" class="form-label">Nombre del producto</label>
            <input type="text" class="form-control" id="nombre" name="name">
      </div>
      <div class="row mb-3">
            <label for="precio" class="form-label">Precio del producto</label>
            <input type="text" class="form-control" id="precio" name="price">
      </div>
       <div class="col-12">
        <button type="submit">Buscar</button>
       </div>
    </form>
    <br/>

    <div id="result"></div>
</div>
</main>
<%@include file = "includes/footer.jsp"%>