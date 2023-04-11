<%@include file = "includes/header.jsp"%>


<!--<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("add-product", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>-->

<%
    String action = request.getParameter("action");
    String name = request.getParameter("name");
    if (name == null) name = "";
    String price = request.getParameter("price");
    if (price == null) price = "";
    String stock = request.getParameter("stock");
    if (stock == null) stock = "";
%>

<main>
<div class= "container">
    <br/>

    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Registrar producto</li>
      </ol>
    </nav>

    <form class="row g-3" method="post" action="edit-product" enctype="multipart/form-data">
      <div class="row mb-3">
            <label for="nombre" class="form-label">Nombre del producto</label>
            <input type="text" class="form-control" id="nombre" name="name" value='<%= name %>'>
      </div>
      <div class="row mb-3">
            <label for="precio" class="form-label">Precio</label>
            <input type="text" class="form-control" id="precio" name="price" value '<%= price %>'>
      </div>
      <div class="row mb-3">
            <label for="cantidad" class="form-label">Stock</label>
            <input type="text" class="form-control" id="cantidad" name="stock" value= '<%= stock %>'>
      </div>
      <div class="row mb-3">
           <label for="image" class="form-label">Imagen</label>
           <input type="file" class="form-control" id="image" name="image">
      </div>
      <input type="hidden" name="action" value="<%= action %>"/>
       <%
       if (action.equals("edit")) {
          int id = Integer.parseInt(request.getParameter("id"));
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