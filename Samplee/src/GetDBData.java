import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class GetDBData {

	public ArrayList<String> getTables() {		
		ArrayList<String> getTables =  new ArrayList<String>();		
		try {			
			Connection con = DBConnection.ConnectDb();
		    Statement state1 = con.createStatement();
		    String query = " SELECT table_name  FROM user_tables";
		    ResultSet result1;		      
		    result1 = state1.executeQuery(query);
		    while (result1.next()) {			        	  
		    	getTables.add( result1.getString("table_name"));		    			    	
		    }		           		          
		}catch(Exception e) {
			System.err.println(e);
		}
		return getTables;
	}
	
	public ArrayList<String> getTableColumns(String selecttable ) {		
		ArrayList<String> getColumns =  new ArrayList<String>();			
		try {			
			Connection con = DBConnection.ConnectDb();
		    Statement state1 = con.createStatement();
		    String query = " SELECT DISTINCT column_name FROM all_tab_cols WHERE table_name = '"+ selecttable +"' ";
		    System.out.println(query);
		    ResultSet result1;		      
		    result1 = state1.executeQuery(query);
		    while (result1.next()) {			        	  
		    	System.out.println( result1.getString("column_name"));		   
		    	getColumns.add( result1.getString("column_name"));		    			    	
		    }		           		          
		}catch(Exception e) {
			System.err.println(e);
		}
		return getColumns;
	}
	
}
