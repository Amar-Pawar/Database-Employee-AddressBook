package com.database;
import java.sql.*;

public class AddressBook {
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException   {
		
		String url = "jdbc:mysql://localhost:3306/addressbook_service";
		String userName = "root";
		String password = "";
		//creating a query
		//String query ="INSERT INTO `addressbook_service`.`addressbook` (`FirstName`, `LastName`, `Address`, `City`, `State`, `Zip`, `PhoneNo.`, `Email_ID`) VALUES ('Mayur', 'Pawar', 'Pooja Complex', 'Pen', 'Maharashtra', '402107', '9999999999', 'mayur02@gmail.com')";
		
		// query to edit the person by using name
		String query = "update addressbook_service.addressbook set city = 'Mumbai' where FirstName = 'Amar'";
		//loading and registering driver
		Class.forName("com.mysql.jdbc.Driver");
		//establishing connect with url username and password
		Connection con = DriverManager.getConnection(url,userName,password);
		//creating a statement
		Statement st = con.createStatement();
		//updating the query
		int count = st.executeUpdate(query);
		
		System.out.println(count + "rows affected");
		//closing statement and connection
		st.close();
		con.close();
		
	}
}
