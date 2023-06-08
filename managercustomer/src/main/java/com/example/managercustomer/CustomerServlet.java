package com.example.managercustomer;

import com.example.managercustomer.model.Customer;
import com.example.managercustomer.service.CustomerService;
import com.example.managercustomer.service.CustomerService1;
import com.example.managercustomer.service.CustomerServiceImpl;
import com.example.managercustomer.DAO.CustomerDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/")
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService;
    private CustomerService1 service1;

    @Override
    public void init() throws ServletException {
        customerService = new CustomerServiceImpl();
        service1 = new CustomerService1();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req, resp);
                break;
            case "edit":
                showFromEdit(req, resp);
                break;
            default:
                showCustomers(req, resp);
        }

    }

    private void showCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<Customer> customers = customerService.findAll();
        List<Customer> customers = service1.findAll();
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("list.jsp").forward(req, resp);

    }

    private void showFromEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer c = customerService.findById(id);

        req.setAttribute("customer", c);
        req.getRequestDispatcher("edit.jsp").forward(req, resp);
    }

    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // action để làm gì: lấy action là gì
        // getParameter("action"): lấy param trong url, param trong form
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(req, resp);
                break;
            case "edit":
                editCustomer(req, resp);
                break;
            case "delete":
                deleteCustomer(req, resp);
                break;
            default:

        }
    }

    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idCustomer = Integer.parseInt(req.getParameter("idEdit"));
        customerService.remove(idCustomer);

        List<Customer> customers = customerService.findAll();



        resp.sendRedirect("/customers");
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int idCustomer = Integer.parseInt(req.getParameter("id"));

        Customer c = customerService.findById(idCustomer);
        String newName = req.getParameter("name");
        String newEmail = req.getParameter("email");
        String newAddress = req.getParameter("address");
        c.setAddress(newAddress);
        c.setEmail(newEmail);
        c.setName(newName);

        customerService.update(c.getId(), c);

        resp.sendRedirect("/customers");

    }

    private void createCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        //id, String name, String email, String address
        long maxId = customerService.getMaxCustomerId(); // Lấy id lớn nhất hiện có
        long id = maxId + 1;
//        long id = System.currentTimeMillis() %100000;
        Customer customer = new Customer( (int) id, name, email, address);
        customerService.save(customer);

        // req.setAttribute :: nhét thuộc tính với key và value vào request
//        req.setAttribute("message", "Thêm thành công");
//        // RequestDispatcher :: điều phối qua qua trang jsp
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher( "create.jsp");
//        requestDispatcher.forward(req, resp);

//        showCustomers(req, resp); // để chạy tới trang /customers
        resp.sendRedirect("/customers"); //
    }
}