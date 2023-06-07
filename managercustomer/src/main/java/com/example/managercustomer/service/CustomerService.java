package com.example.managercustomer.service;

import com.example.managercustomer.model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void update(int id, Customer customer);
    void remove(int id);

    default long getMaxCustomerId() {
        // Logic để lấy id lớn nhất từ cơ sở dữ liệu hoặc từ danh sách khách hàng
        long maxId = 0;

        // Code để lấy id lớn nhất, ví dụ:
        List<Customer> customers = findAll(); // Lấy danh sách khách hàng
        for (Customer customer : customers) {
            long customerId = customer.getId();
            if (customerId > maxId) {
                maxId = customerId;
            }
        }

        return maxId;
    }
}
