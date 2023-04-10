package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

@WebServlet("/edit-product")
@MultipartConfig
public class AddEditProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String imagePath = request.getServletContext().getInitParameter("image-path");
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")){
            id = Integer.parseInt(request.getParameter("id"));
        }

        try{
            //Subir la imagen a la carpeta itech_data dentro del tomcat
            Part imagePart = request.getPart("image");
            String fileName;
            //Esto es por si no hay imagen, para subir una por defecto
            if (imagePart.getSize() == 0){
                fileName = "no_image.jpg";
            } else {
                fileName = UUID.randomUUID() + ".jpg";
                InputStream fileStream = imagePart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + fileName));
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")){
                int productId = id;
                Database.jdbi.withExtension(ProductDAO.class, dao -> {
                    dao.editProduct(name, price, stock, fileName, productId);
                    return null;
                });
            } else {
                Database.jdbi.withExtension(ProductDAO.class, dao ->{
                    dao.addProduct(name, price, stock, fileName);
                    return null;
                });
            }

            response.sendRedirect("index.jsp");

            out.println("<div class='alert alert-success' role='alert'>Producto registrado correctamente</div>");
        }catch (ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
    }
}
