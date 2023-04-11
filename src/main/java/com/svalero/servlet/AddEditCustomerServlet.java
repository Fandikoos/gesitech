package com.svalero.servlet;


import com.svalero.dao.CustomerDAO;
import com.svalero.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/edit-customer")
@MultipartConfig
public class AddEditCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        int phone = Integer.parseInt(request.getParameter("phone"));

        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")){
            id = Integer.parseInt(request.getParameter("id"));
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")) {
                int customerId = id;
                Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                    dao.editCustomer(name, surname, address, phone, customerId);
                    return null;
                });

            } else {
                Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                    dao.addCustomer(name, surname, address, phone);
                    return null;
                });
            }

            response.sendRedirect("index-customers.jsp");

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
