package com.example.managercustomer.service;

import com.example.managercustomer.DAO.CustomerDAO;
import com.example.managercustomer.model.Customer;

import java.util.List;

public class CustomerService1 implements CustomerService{
    private CustomerDAO customerDAO;
    public CustomerService1() {
        customerDAO = new CustomerDAO();
    }
    @Override
    public List<Customer> findAll() {
        return customerDAO.findAll();
    }

    @Override
    public void save(Customer customer) {
        customerDAO.save(customer);
    }

    @Override
    public Customer findById(int id) {
        return customerDAO.findById(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customerDAO.update(id,customer);
    }

    @Override
    public void remove(int id) {
        customerDAO.remove(id);
    }
    public List<Customer> sortByNameASC(){
        return customerDAO.sortByNameASC();
    }
}
