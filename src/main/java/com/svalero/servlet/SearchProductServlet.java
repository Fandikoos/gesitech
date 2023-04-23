package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.ProductDAO;
import com.svalero.domain.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/search-product")
@MultipartConfig
public class SearchProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Product> searchProduct = Database.jdbi.withExtension(ProductDAO.class, dao -> {
                return dao.getFilterProducts(name, price);
            });

            out.println("<div class='grid' style='display: grid; grid-template-columns: auto auto auto; justify-content: space-around; align-content: space-around;'>");
            for (Product product : searchProduct){
                    out.println("<div class='card' style='width: 20rem; margin: 20px; padding: 10px;>");

                            out.println("<div class='card-body'>");
                            out.println("<h5 class='card-title'>" + product.getName() + "</h5>");
                            out.println("<p class='card-text'>Stock de producto: " + product.getStock() + " uds.</p>");
                            out.println("<p class='card-text'>Precio unitario: " + product.getPrice() + " $</p>");

                            out.println("<div class='card-body' style='display: flex; justify-content: space-evenly;'>");
                            out.println("<a href=view-details.jsp?id=" + product.getId() + " class='card-link'><button type='button' class='btn btn-info'>Ver detalles</button></a>");
                            out.println("<a href=product-form.jsp?id=" + product.getId() + "&action=edit&name=" + product.getName() + "&price=" + product.getPrice() + "&stock=" + product.getStock() + " class='card-link'><button type='button' class='btn btn-primary'>Editar producto</button></a>");
                            out.println("<a href=remove-product?id=" + product.getId() + " class='card-link'><button type='button' class='btn btn-danger'>Eliminar producto</button></a>");
                            out.println("</div>");

                    out.println("</div>");
            }
            out.println("</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
