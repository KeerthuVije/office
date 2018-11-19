import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public static Connection ConnectDb() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.50:1521:orcl","BACKOFFICE" ,"backoffice");			
		}catch(Exception e) {
			System.err.println(e);
		}
		return conn;
	}

}
