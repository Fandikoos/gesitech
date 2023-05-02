<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>Iniciar sesión</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    form {
      width: 300px;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      text-align: center;
    }
    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }
    button {
      background-color: #4CAF50;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #45a049;
    }
    .cancelbtn {
      width: auto;
      padding: 10px 18px;
      background-color: #f44336;
    }
    .imgcontainer {
      text-align: center;
      margin: 24px 0 12px 0;
    }
    img.avatar {
      width: 40%;
      border-radius: 50%;
    }
    .container {
      padding: 16px;
    }
    span.psw {
      float: right;
      padding-top: 16px;
    }
  </style>
</head>
<body>
    <% if(request.getParameter("submit") != null) {
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        if(user.equals("gesitech") && password.equals("gesitech1234")) {
          // Si los datos son correctos, redirigimos al usuario a la página de inicio
          response.sendRedirect("index.jsp");
        } else {
          // Si los datos son incorrectos, mostramos una alerta
          %><script>alert("Datos incorrectos");</script><%
        }
    } %>
  <form method="post">
    <div class="imgcontainer">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3CMD29nX955F_6kWJWmMixA3y2NFrTSiZUg&usqp=CAU" alt="logo empresa" class="avatar">
    </div>
    <div class="container">
      <label for="user"><b>Usuario</b></label>
      <input id="user" type="text" placeholder="Ingrese su usuario" name="user" required>
      <label for="psw"><b>Contraseña</b></label>
      <input id="password" type="password" placeholder="Ingrese su contraseña"  name="password" required>
      <button type="submit" name="submit">Iniciar sesión</button>
    </div>
  </form>

</body>
</html>
