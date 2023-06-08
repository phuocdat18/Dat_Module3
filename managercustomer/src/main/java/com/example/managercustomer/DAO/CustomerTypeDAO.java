package com.example.managercustomer.DAO;

import com.example.managercustomer.model.CustomerType;
import com.example.managercustomer.service.CustomerTypeService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeDAO implements CustomerTypeService {
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
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypes = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM customertype;");
            System.out.println("Function findAll" + preparedStatement);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String type = resultSet.getString("type");
                CustomerType customerType = new CustomerType(id, name, type);
                customerTypes.add(customerType);
            }
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return customerTypes;
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
    public void saveType(CustomerType customerType) {
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `customertype` (`name`, `type`) VALUES (?, ?);");

            preparedStatement.setString(1,customerType.getName());
            preparedStatement.setString(2,customerType.getType());

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
    public CustomerType findByIdType(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM customertype where id = ?;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idCustomerType = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String type = resultSet.getString("type");
                CustomerType customerType = new CustomerType(idCustomerType, name, type);
                return customerType;
        }

        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    @Override
    public void updateType(int id, CustomerType customerType) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `customer`.`customertype` SET `name` = ?, `type` = ? WHERE (`id` = ?);");

            preparedStatement.setString(1, customerType.getName());
            preparedStatement.setString(2, customerType.getType());
            preparedStatement.setInt(3,customerType.getId());
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
    public void removeType(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM `customer`.`customertype` WHERE (`id` = ?);");

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
