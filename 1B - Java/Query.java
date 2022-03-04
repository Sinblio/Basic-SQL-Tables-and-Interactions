import java.sql.*;

public class Query {
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
		ResultSet result = null;
		
		try {
			stmt = connect.createStatement();
			
			result = stmt.executeQuery("select snum, ssn from students where name = 'Becky';");
			
			System.out.println("Query 1:");
			
			while(result.next()) {
				System.out.println("snum: " + result.getInt("snum") + ", ssn: " + result.getInt("ssn"));
			}
			
			result = stmt.executeQuery("select name, level from major where snum in (select snum from students where ssn = 123097834);");
			
			System.out.println("Query 2:");
			
			while(result.next()) {
				System.out.println("name: " + result.getString("name") + ", level: " + result.getString("level"));
			}
			
			result = stmt.executeQuery("select distinct c.name from courses c, departments d where c.department_code = d.code and d.name = 'Computer Science';");
			
			System.out.println("Query 3:");
			
			while(result.next()) {
				System.out.println("Course Name: " + result.getString("name"));
			}
			
			result = stmt.executeQuery("select distinct g.name, g.level from degrees g, departments d where g.department_code = d.code and d.name = 'Computer Science';");
			
			System.out.println("Query 4:");
			
			while(result.next()) {
				System.out.println(result.getString("name") + ", " + result.getString("level"));
			}
			
			result = stmt.executeQuery("select distinct s.name from students s, minor m where s.snum = m.snum;");
			
			System.out.println("Query 5:");
			
			while(result.next()) {
				System.out.println(result.getString("name"));
			}
			
			stmt.close();
			connect.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
