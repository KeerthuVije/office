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
		    String query = " SELECT table_name  FROM user_tables order by  table_name asc";
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
		ArrayList<ArrayList<String>> allData =  new ArrayList<ArrayList<String>>();
		ArrayList<String> getDatas =  new ArrayList<String>();
		Functions obj = new Functions();
		try {	
			Connection con = DBConnection.ConnectDb();
		    Statement state1 = con.createStatement();		     		    
		    ResultSet result1;		      
		    result1 = state1.executeQuery(getQuery);
		    String[] column = obj.getColunms(getQuery);		    
		    while (result1.next()) {
		    	for(int i = 0 ;i < column.length;i++ ) {
		    		getDatas.add( result1.getString(column[i]));
		    	}
		    	allData.add(getDatas);
		    }
		    
		    for(int i = 0 ;i < allData.size();i++ ) {
		    	for(int j = 0 ;j < getDatas.size();j++ ) {
		    		//allData.get(i).get(j);
		    	}
		    	System.out.println(allData.get(i));
	    	}
		    
		   /* for(ArrayList<String> s2:allData) {
		    	System.out.println(s2);
		    }*/
		    
		}catch(Exception e) {
			System.err.println(e);
		}
		return getDatas;
	}
	
}
