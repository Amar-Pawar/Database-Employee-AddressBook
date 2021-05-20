package com.database;
import java.sql.*;

public class EmployeePayroll {
	public static void main(String[] args) throws ClassNotFoundException, SQLException   {
		//initializing url,username and password
		String url = "jdbc:mysql://localhost:3306/payroll_service";
		String userName = "root";
		String password = "";
		
		//to read data we excecute query
		//String query = "select * from employee_payroll";
		
		//to update data
		//String query = "update payroll_service.employee_payroll set Salary = '80000' where employee_Name = 'Amar'";
		
		//for creating prepared statement to update data
		int Salary = 90000;
		String employee_Name = "Amar";
		String query = "update payroll_service.employee_payroll set Salary =? where employee_Name = ?";
		
		//loading and registering the driver
		Class.forName("com.mysql.jdbc.Driver");
		//setting up connection with username password and url
		Connection con = DriverManager.getConnection(url,userName,password);
		//creating a statment
		//Statement st = con.createStatement();
		
		//creating prepared statement
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1,Salary);
		st.setString(2, employee_Name);
		
		//executing query 
		//ResultSet rs = st.executeQuery(query);
		//executing the update
		int count = st.executeUpdate();
		
		//while updating or inserting data we count how many rows are affceted
		System.out.println(count + "rows affected");
		/*
		String employeeData = "";
		while(rs.next()) {
			employeeData = rs.getInt(1)+"-"+rs.getString(2)+"-"+rs.getString(3)+"-"+rs.getString(4)+"-"+rs.getString(5)+"-"+
					rs.getString(6)+"-"+ rs.getInt(7);
			System.out.println(employeeData);
		}
		//int salary = rs.getInt("Salary");
		//System.out.println(salary);
		*/
		st.close();
		con.close();
		
	}

}
