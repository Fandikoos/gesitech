package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        response.setContentType("text/html");
    }

}
