import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class ModifyRecords {
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
			
			stmt.executeUpdate("set sql_safe_updates = 0;");
			stmt.executeUpdate("update students set name = 'Scott' where ssn = 746897816;");
			stmt.executeUpdate("update major set name = 'Computer Science', level = 'MS' where snum in (select snum from students where ssn = 746897816);");
			stmt.executeUpdate("delete from register where regtime = 'Spring2021';");
			stmt.executeUpdate("set sql_safe_updates = 1;");
			
			System.out.println("Updates Done!");
			
			stmt.close();
			connect.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
