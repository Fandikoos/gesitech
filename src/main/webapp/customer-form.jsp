<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<%
    String action = request.getParameter("action");
    String name = request.getParameter("name");
    if (name == null) name = "";
    String surname = request.getParameter("surname");
    if (surname == null) surname = "";
    String address = request.getParameter("address");
    if (address == null) address = "";
    String phone = request.getParameter("phone");
    if (phone == null) phone = "";
%>

<main>
<div class= "container">
    <br/>

    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Registrar cliente</li>
      </ol>
    </nav>

    <form class="row g-3" method="post" action="edit-customer" enctype="multipart/form-data">
      <div class="row mb-3">
            <label for="nombre" class="form-label">Nombre del cliente</label>
            <input type="text" class="form-control" id="nombre" name="name" value='<%= name %>'>
      </div>
      <div class="row mb-3">
            <label for="apellidos" class="form-label">Apellidos del cliente</label>
            <input type="text" class="form-control" id="apellidos" name="surname" value '<%= surname %>'>
      </div>
      <div class="row mb-3">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" class="form-control" id="direccion" name="address" value= '<%= address %>'>
      </div>
      <div class="row mb-3">
           <label for="telefono" class="form-label">Teléfono</label>
           <input type="text" class="form-control" id="telefono" name="phone">
      </div>
      <input type="hidden" name="action" value="<%= action %>"/>
       <%
       if (action.equals("edit")) {
          int id = Integer.parseInt(request.getParameter("id_customer"));
       %>
          <input type="hidden" name="id" value="<%= id %>"/>
       <%
       }
       %>
       <div class="col-12">
        <input type="submit" value="<%= action %>"/>
       </div>
    </form>
    <br/>
    <div id="result"></div>
</div>
</main>
<%@include file = "includes/footer.jsp"%>