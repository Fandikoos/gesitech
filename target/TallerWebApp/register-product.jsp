<%@include file = "includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("add-product", formValue, function(data) {
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
        <li class="breadcrumb-item"><a href="http://localhost:8080/itech/">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Registrar vehículo</li>
      </ol>
    </nav>
    <form>
      <div class="row mb-3">
        <label for="nombre" class="col-sm-2 col-form-label">Nombre del producto</label>
        <input type="text" class="form-control" id="nombre" name="name">
      </div>
      <div class="row mb-3">
        <label for="precio" class="col-sm-2 col-form-label">Precio</label>
        <input type="text" class="form-control" id="precio" name="price">
      </div>
      <div class="row mb-3">
        <label for="cantidad" class="col-sm-2 col-form-label">Stock</label>
        <input type="text" class="form-control" id="cantidad" name="stock">
      </div>
      <div>
        <button type="submit" class="btn btn-primary">Registrar producto</button>
      </div>
    </form>
    <br/>
    <div id="result"></div>
</div>
</main>
<%@include file = "includes/footer.jsp"%>