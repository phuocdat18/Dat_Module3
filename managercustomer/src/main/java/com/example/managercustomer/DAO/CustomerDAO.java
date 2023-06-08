package com.example.managercustomer.DAO;

import com.example.managercustomer.model.Customer;
import com.example.managercustomer.service.CustomerService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements CustomerService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/customer?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "hoilamgi";

    protected Connection getConnection() throws ClassNotFoundException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }


    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM customer;");
            System.out.println("Function findAll" + preparedStatement);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                Customer customer = new Customer(id, name, email, address);
                customers.add(customer);
            }
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return customers;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }


    @Override
    public void save(Customer customer) {
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `customer` (`id`, `name`, `email`, `address`) VALUES (?, ?, ?, ?);");

            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getEmail());
            preparedStatement.setString(3,customer.getAddress());

            System.out.println("Function save" + preparedStatement);
            preparedStatement.executeQuery();

            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Customer findById(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM customer where id = ?;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idCustomer = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                Customer customer = new Customer(idCustomer, name, email, address);
                return customer;
            }

        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    @Override
    public void update(int id, Customer customer) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `customer` SET `name` = ?, `email` = ?, `address` = ? WHERE (`id` = ?);");

            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getAddress());
            preparedStatement.setInt(4, customer.getId());
            System.out.println("Function save" + preparedStatement);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void remove(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM `customer` WHERE (`id` = ?);");

            preparedStatement.setInt(1,id);
            System.out.println("Function delete" + preparedStatement);
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
