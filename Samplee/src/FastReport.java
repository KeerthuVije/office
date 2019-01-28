import ar.com.fdvs.dj.domain.DynamicReport;

public class FastReport extends BaseDJreport {
	
	public static void main(String[] args) throws Exception {
		 		FastReport test = new FastReport();
				test.testReport();
		 		test.exportToJRXML();
		 		JasperViewer.viewReport(test.jp);	//finally display the report report
		 		JasperDesignViewer.viewReportDesign(test.jr);
		 	}

	@Override
	public DynamicReport buildReport() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
