
public class Functions {
	public String[] getColunms(String getQuery) {
	       String string = getQuery;
	       String[] parts = string.split("FROM");
	       String part1 = parts[0];
	       String[] selected = part1.split("SELECT");
	       String selected2 = selected[1].trim();
	       String[] column = selected2.split(",");	       
	       return column;
	   }
}
