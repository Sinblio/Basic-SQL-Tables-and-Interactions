import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DropTables {
	private static Connection connect = null;
	
	public static void main(String[] args) {
		try {
			//Set up connection parameters
			String userName = "root";
			String password = "aaaa";
			String dbServer = "jdbc:mysql://localhost:3306/project1";
			//String dbServer = "jdbc:mysql://mysql.cs.iastate.edu/[schema]";
			//Set up connection
			connect = DriverManager.getConnection(dbServer,userName,password);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		Statement stmt = null;
		
		try {
			stmt = connect.createStatement();
			
			stmt.executeUpdate("Drop Table if exists major;");
			stmt.executeUpdate("Drop table if exists minor;");
			stmt.executeUpdate("Drop Table if exists degrees;");
			stmt.executeUpdate("Drop Table if exists register;");
			stmt.executeUpdate("Drop Table if exists courses;");
			stmt.executeUpdate("Drop Table if exists students;");
			stmt.executeUpdate("Drop Table if exists departments;");
			
			System.out.println("Drops Complete!");
			
			stmt.close();
			connect.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
