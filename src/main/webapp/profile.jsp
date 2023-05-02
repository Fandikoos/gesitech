<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<body>
    <form id="myForm">
      <label for="name">Nombre:</label>
      <input type="text" id="name" name="name"><br><br>

      <label for="surname">Apellidos:</label>
      <input type="text" id="surname" name="surname"><br><br>

      <label for="email">Email:</label>
      <input type="email" id="email" name="email"><br><br>

      <label for="puesto">Puesto:</label>
      <input type="text" id="puesto" name="puesto"><br><br>

      <label for="phone">Teléfono:</label>
      <input type="text" id="phone" name="phone"><br><br>

      <button type="submit">Guardar</button>
    </form>
</body>

<script type="text/javascript">
    const form = document.getElementById("myForm");
    const nameInput = document.getElementById("name");
    const surnameInput = document.getElementById("surname");
    const emailInput = document.getElementById("email");
    const puestoInput = document.getElementById("puesto");
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
    if(localStorage.getItem("phone")) {
      phoneInput.value = localStorage.getItem("phone");
    }

    form.addEventListener("submit", function(event) {
      event.preventDefault(); // Prevenir la acción por defecto del formulario

      const name = nameInput.value;
      const surname = surnameInput.value;
      const email = emailInput.value;
      const puesto = puestoInput.value;
      const phone = phoneInput.value;

      localStorage.setItem("name", name);
      localStorage.setItem("surname", surname);
      localStorage.setItem("email", email);
      localStorage.setItem("puesto", puesto);
      localStorage.setItem("phone", phone);

      alert("Datos guardados correctamente");
    });
</script>


<%@include file="includes/footer.jsp"%>
