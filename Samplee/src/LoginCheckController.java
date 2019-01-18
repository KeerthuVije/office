

import java.io.IOException;
import java.util.ArrayList;
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
		GetDBData table = new GetDBData();		
		if(request.getParameter("page") != null && request.getParameter("page").equals("submit")) {
			selecttable = request.getParameter("selecttable");
			table.getTableColumns(selecttable);
			request.setAttribute("selecttable",selecttable);			
		} 
		
		if(request.getParameter("data") != null && request.getParameter("data").equals("Generate Query")) {
			this.GenerateQuery(request,response);
		}
		
		List<String> c = table.getTableColumns(selecttable);
		request.setAttribute("column_names", c);
								
		List<String> a = table.getTables();
		request.setAttribute("last_table", a);
		RequestDispatcher view = request.getRequestDispatcher("/table.jsp");
		view.forward(request, response);
		return;
	}
	
	public void GenerateQuery(HttpServletRequest request, HttpServletResponse response) {
		GetDBData query = new GetDBData();
		Functions splitcolumn = new Functions();
		String getQuery = request.getParameter("queryData");
		query.getData(getQuery);
		request.setAttribute("getQuery",getQuery);
		
		ArrayList<ArrayList<String>> d = query.getData(getQuery);
		request.setAttribute("data_values", d);
		
		String[] c = splitcolumn.getColunms(getQuery);
		request.setAttribute("split_columns",c);
	}
}
