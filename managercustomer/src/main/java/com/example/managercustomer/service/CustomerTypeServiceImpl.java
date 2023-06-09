package com.example.managercustomer.service;

import com.example.managercustomer.DAO.CustomerTypeDAO;
import com.example.managercustomer.model.CustomerType;

import java.util.List;

public class CustomerTypeServiceImpl implements CustomerTypeService{
    private CustomerTypeDAO customerTypeDAO;

    public CustomerTypeServiceImpl() {
        customerTypeDAO = new CustomerTypeDAO();
    }
    @Override
    public List<CustomerType> findAll() {
        return customerTypeDAO.findAll();
    }

    @Override
    public void saveType(CustomerType customerType) {
        customerTypeDAO.saveType(customerType);
    }

    @Override
    public void updateType(int id, CustomerType customerType) {
        customerTypeDAO.updateType(id,customerType);
    }

    @Override
    public void removeType(int id) {
        customerTypeDAO.removeType(id);
    }

    @Override
    public CustomerType findByIdType(int id) {
        return customerTypeDAO.findByIdType(id);
    }
}
