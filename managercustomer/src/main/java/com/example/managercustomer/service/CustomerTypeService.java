package com.example.managercustomer.service;

import com.example.managercustomer.model.CustomerType;

import java.util.List;

public interface CustomerTypeService {
    List<CustomerType> findAll();
    void saveType(CustomerType customerType);
    void updateType(int id, CustomerType customerType);
    void removeType(int id);

    CustomerType findByIdType(int id);

}
