<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<body>
<div style="display: flex; justify-content: center; align-items: center;">
    <form id="myForm" style="text-align: center; background: rgb(212,198,151); background: linear-gradient(90deg, rgba(212,198,151,1) 4%, rgba(233,233,226,1) 50%, rgba(220,219,237,1) 100%); width: 500px;">
      <label for="name"><b>Nombre:</b></label>
      <input type="text" id="name" name="name" style="margin: 10px;"><br><br>

      <label for="surname"><b>Apellidos:</b></label>
      <input type="text" id="surname" name="surname" style="margin: 10px;"><br><br>

      <label for="email"><b>Email:</b></label>
      <input type="email" id="email" name="email" style="margin: 10px;"><br><br>

      <label for="puesto"><b>Puesto:</b></label>
      <input type="text" id="puesto" name="puesto" style="margin: 10px;"><br><br>

      <label for="direction"><b>Dirección:</b></label>
      <input type="text" id="direction" name="direction" style="margin: 10px;"><br><br>

      <label for="city"><b>Ciudad:</b></label>
      <input type="text" id="city" name="city" style="margin: 10px;"><br><br>

      <label for="phone"><b>Teléfono:</b></label>
      <input type="text" id="phone" name="phone" style="margin: 10px;"><br><br>

      <button type="submit" style="margin: 10px;">Guardar</button>
    </form>
</div>
</body>

<script type="text/javascript">
    const form = document.getElementById("myForm");
    const nameInput = document.getElementById("name");
    const surnameInput = document.getElementById("surname");
    const emailInput = document.getElementById("email");
    const puestoInput = document.getElementById("puesto");
    const directionInput = document.getElementById("direction");
    const cityInput = document.getElementById("city");
    const phoneInput = document.getElementById("phone");

    if(localStorage.getItem("name")) {
      nameInput.value = localStorage.getItem("name");
    }
    if(localStorage.getItem("surname")) {
      surnameInput.value = localStorage.getItem("surname");
    }
    if(localStorage.getItem("email")) {
      emailInput.value = localStorage.getItem("email");
    }
    if(localStorage.getItem("puesto")) {
      puestoInput.value = localStorage.getItem("puesto");
    }
    if(localStorage.getItem("direction")) {
      directionInput.value = localStorage.getItem("direction");
    }
    if(localStorage.getItem("city")) {
      cityInput.value = localStorage.getItem("city");
    }
    if(localStorage.getItem("phone")) {
      phoneInput.value = localStorage.getItem("phone");
    }

    form.addEventListener("submit", function(event) {
      event.preventDefault(); // Prevenir la acción por defecto del formulario

      const name = nameInput.value;
      const surname = surnameInput.value;
      const email = emailInput.value;
      const puesto = puestoInput.value;
      const direction = directionInput.value;
      const city = cityInput.value;
      const phone = phoneInput.value;

      localStorage.setItem("name", name);
      localStorage.setItem("surname", surname);
      localStorage.setItem("email", email);
      localStorage.setItem("puesto", puesto);
      localStorage.setItem("direction", direction);
      localStorage.setItem("city", city);
      localStorage.setItem("phone", phone);

      alert("Datos guardados correctamente");
    });
</script>


<%@include file="includes/footer.jsp"%>
