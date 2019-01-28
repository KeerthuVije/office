import java.util.*;

import ar.com.fdvs.dj.core.DynamicJasperHelper;
import ar.com.fdvs.dj.domain.DynamicReport;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

import junit.framework.TestCase;

public abstract class BaseDJreport extends TestCase {
	public Map getParams() {
		 		return params;
 	}

	protected JasperPrint jp;
  	protected JasperReport jr;
  	protected Map params = new HashMap();
  	protected DynamicReport dr;
  	
  	public abstract DynamicReport buildReport() throws Exception;
  	
  	public void testReport() throws Exception {
  		  			dr = buildReport();
  		  
  		  			/**
  		  			 * Get a JRDataSource implementation
  		  			 */
  		  			JRDataSource ds = getDataSource();
  		  
  		  
  		  			/**
  		  			 * Creates the JasperReport object, we pass as a Parameter
  		  			 * the DynamicReport, a new ClassicLayoutManager instance (this
  		  			 * one does the magic) and the JRDataSource
  		  			 */
  		  			jr = DynamicJasperHelper.generateJasperReport(dr, getLayoutManager(), params);
  		  
  		  			/**
  		  			 * Creates the JasperPrint object, we pass as a Parameter
  		  			 * the JasperReport object, and the JRDataSource
  		  			 */
  		  			log.debug("Filling the report");
  		  			if (ds != null)
  		  				jp = JasperFillManager.fillReport(jr, params, ds);
  		  			else
  		  				jp = JasperFillManager.fillReport(jr, params);
  		  
  		  			log.debug("Filling done!");
  		  			log.debug("Exporting the report (pdf, xls, etc)");
  		              exportReport();
  		  
  		              log.debug("test finished");
  		  
  		  	}
  	
  	protected LayoutManager getLayoutManager() {
  		 		return new ClassicLayoutManager();
  		 	}
  		 
  		 	protected void exportReport() throws Exception {
  		 		ReportExporter.exportReport(jp, System.getProperty("user.dir")+ "/target/reports/" + this.getClass().getName() + ".pdf");
  		 		exportToJRXML();
  		 	}
  		 	
  		 	protected void exportToJRXML() throws Exception {
  		 		 		if (this.jr != null){
  		 		 			DynamicJasperHelper.generateJRXML(this.jr, "UTF-8",System.getProperty("user.dir")+ "/target/reports/" + this.getClass().getName() + ".jrxml");
  		 		 			
  		 		 		} else {
  		 		 			DynamicJasperHelper.generateJRXML(this.dr, this.getLayoutManager(), this.params, "UTF-8",System.getProperty("user.dir")+ "/target/reports/" + this.getClass().getName() + ".jrxml");
  		 		 		}
  		 		 	}
  		 	
  		 	protected JRDataSource getDataSource() {
  		 		 		Collection dummyCollection = TestRepositoryProducts.getDummyCollection();
  		 		 		dummyCollection = SortUtils.sortCollection(dummyCollection,dr.getColumns());
  		 		 
  		 		 		JRDataSource ds = new JRBeanCollectionDataSource(dummyCollection);		//Create a JRDataSource, the Collection used
  		 		 																				//here contains dummy hardcoded objects...
  		 		 		return ds;
  		 		 	}
  		 	
  		 	public Collection getDummyCollectionSorted(List columnlist) {
  		 		 		Collection dummyCollection = TestRepositoryProducts.getDummyCollection();
  		 		 		return SortUtils.sortCollection(dummyCollection,columnlist);
  		 		 
  		 		 	}
  		 		 
  		 		 	public DynamicReport getDynamicReport() {
  		 		 		return dr;
  		 		 	}
}