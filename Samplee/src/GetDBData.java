import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

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
		    String query = " SELECT DISTINCT column_name,data_type FROM all_tab_cols WHERE table_name = '"+ selecttable +"' ";
		    ResultSet result1;		      
		    result1 = state1.executeQuery(query);
		    while (result1.next()) {			        	  
		    	/*System.out.println( result1.getString("column_name")+ " " + result1.getString("data_type"));	*/	   
		    	getColumns.add( result1.getString("column_name"));
		    	/*String s1 = result1.getString(1);
		    	String s2 = result1.getString(2);
		    	System.out.println(s1);
		    	System.out.println(s2);*/
		    }		           		          
		}catch(Exception e) {
			System.err.println(e);
		}
		return getColumns;
	}
	
	public ArrayList<String> getData(String getQuery ) {		
		ArrayList<String> getData =  new ArrayList<String>();			
		try {			
			Connection con = DBConnection.ConnectDb();
		    Statement state1 = con.createStatement();
		    //String query1 = "'"+getQuery+"'";
		    String query1 = "SELECT DISTINCT SUB_ACC_NAME,REMARKS,STATUS FROM GL_SUB_ACCOUNT";
		    ResultSet result1;		      
		    result1 = state1.executeQuery(query1);
		   // System.out.println(query1);
		    while (result1.next()) {
		    	getData.add(result1.getString("SUB_ACC_NAME"));
		    	String d1 = result1.getString(1);
		    	String d2 = result1.getString(2);
		    	String d3 = result1.getString(3);
		    	System.out.println(d1);
		    	System.out.println(d2);
		    	System.out.println(d3);
		    }		           		          
		}catch(Exception e) {
			System.err.println(e);
		}
		return getData;
	}
}
