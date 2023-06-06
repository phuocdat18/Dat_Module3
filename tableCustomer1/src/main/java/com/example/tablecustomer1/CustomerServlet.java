package com.example.tablecustomer1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    List<Customer> customers;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        customers = new ArrayList<>();
        customers.add(new Customer(1, "Dat", "Hue", "123"));
        customers.add(new Customer(2, "Dat 123", "Hue", "123"));
        customers.add(new Customer(3, "Dat 09", "Da Nang", "123"));

//        Xet cac bien de nhan o trang duoc dieu huong den
        request.setAttribute("customers", customers);

//        DIeu huong trang
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "create" :
                createCustomer(request, response);
                break;
        }

    }

    public void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        customers.add(new Customer(4, name, "Hue", "123"));
        request.setAttribute("customers", customers);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
