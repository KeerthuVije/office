

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheckController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		prosses(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private void prosses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
		String selecttable = "";
		String query="";
		GetDBData table = new GetDBData();
		
		String getQuery = request.getParameter("queryData");
		table.getData(getQuery);
		request.setAttribute("getQuery",getQuery);
		
		System.out.println("PRINT QUERY HERE : "+getQuery);
		
		if(request.getParameter("page") != null && request.getParameter("page").equals("submit")) {
			selecttable = request.getParameter("selecttable");
			table.getTableColumns(selecttable);
			request.setAttribute("selecttable",selecttable);
			System.out.println(selecttable);
		} 
		
		if(request.getParameter("data") != null && request.getParameter("data").equals("Generate Query")) {
			System.out.println("passing data to this query : " + getQuery);
		}else {
			System.out.println("fail");
		}
		/*if(request.getParameter("queryData") != null && request.getParameter("queryData").equalsIgnoreCase("Generate Query")) {
			
		}*/
		
		/*if(request.getParameter("test") != null && request.getParameter("test").equals("yes")) {
		System.out.println("fine");
		}else {
			System.out.println("Notfine");
		}*/
		
		List<String> c = table.getTableColumns(selecttable);
		request.setAttribute("column_names", c);
		
		List<String> d = table.getData(getQuery);
		request.setAttribute("data_values", d);
		
		List<String> a = table.getTables();
		request.setAttribute("last_table", a);
		RequestDispatcher view = request.getRequestDispatcher("/table.jsp");
		view.forward(request, response);
		return;
	}
}
