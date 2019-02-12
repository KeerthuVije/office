package reportExports;

import ar.com.fdvs.dj.domain.Style;
import ar.com.fdvs.dj.domain.builders.FastReportBuilder;
import java.util.Date;
import ar.com.fdvs.dj.core.layout.LayoutManager;
import ar.com.fdvs.dj.core.layout.ListLayoutManager;
import ar.com.fdvs.dj.domain.DynamicReport;
import ar.com.fdvs.dj.domain.constants.GroupLayout;
import ar.com.fdvs.dj.domain.constants.Page;
import ar.com.fdvs.dj.domain.entities.DJGroup;
import ar.com.fdvs.dj.test.ReportExporter;
import net.sf.jasperreports.view.JasperDesignViewer;
import net.sf.jasperreports.view.JasperViewer;
  

public class XlsReportTest extends BaseDjReportTest{
	
	public static void main(String[] args) throws Exception {
  		XlsReportTest test = new XlsReportTest();
  		test.testReport();
  		test.exportToPlainXls();
  		test.exportToJRXML();
 		JasperViewer.viewReport(test.jp);	//finally display the report report
 		JasperDesignViewer.viewReportDesign(test.jr);
  	}

	
	public DynamicReport buildReport() throws Exception {
		  
		  		/**
		  		 * Creates the DynamicReportBuilder and sets the basic options for
		  		 * the report
		  		 */
		  		FastReportBuilder drb = new FastReportBuilder();
		  		Style columDetail = new Style();
		  		 drb.addColumn("State"			, "state"		, String.class.getName(), 30)
		  			.addColumn("Branch"			, "branch"		, String.class.getName(), 30)
		  			.addColumn("Product Line"	, "productLine"	, String.class.getName(), 50)
		  			.addColumn("Amount"			, "amount"		, Float.class.getName()	, 70, true)
		  			.addColumn("Date"			, "date"		, Date.class.getName()	, 70, true, "dd/MM/yyyy",null)
		  			.addGroups(2) //Not used by the ListLayoutManager
		  			.setPrintColumnNames(true)
		  			.setIgnorePagination(true) //for Excel, we may dont want pagination, just a plain list
		  			.setMargins(0, 0, 0, 0)
		  			.setPageSizeAndOrientation(Page.Page_Letter_Landscape())
		  			.setTitle("November " + getYear() +" sales report")
		  			.setSubtitle("This report was generated at " + new Date())
		  			.setReportName("My Excel Report")
		  			.setDefaultStyles(null, null, null, columDetail)
		  			.setUseFullPageWidth(true)
		  			.setReportName("My Report");
		  
		  		DynamicReport dr = drb.build();
		  
		  		DJGroup group = (DJGroup) dr.getColumnsGroups().iterator().next();
		  		group.setLayout(GroupLayout.EMPTY); //not used by ListLayoutManager
		  
		  		return dr;
		  	}
}
