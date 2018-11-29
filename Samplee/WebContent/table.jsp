<%@page import="javax.sound.sampled.ReverbType"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.css" />
 	<link href="css/multiple-select.css" rel="stylesheet"/>
 	<link href="https://cdn.syncfusion.com/ej2/material.css" rel="stylesheet">
 	<script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js"></script>
 	<script src="js/jquery-3.3.1.min.js"></script>
 	<script src="js/jquery.min.js"></script>
 	<script src="js/multiple-select.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tables</title>
<script>
	function getSelectValue(){
		var e = document.getElementById("tblList");
		var selected_table = e.options[e.selectedIndex].value;
		document.getElementById("selecttable").value = selected_table;	
		document.getElementById("form1").submit();
	}
</script>
<script>
<%
List<String> listc = (ArrayList<String>) request.getAttribute("column_names");
%>
		function onPlusClick(){
        var strDOM =`<table id="table">
			<td>
			<select id="colunms" name="select">
			<option value = ""> -- Select -- </option>
				<%for(int i = 0; i < listc.size(); i++){ 
						String columns = listc.get(i);%>
					<option value="<%=columns %>"><%= columns%></option>	
			<%} %>
			</select> 
		</td>
		<td>
			<ul>
				<select id="option">
				<option value = ""> -- Select -- </option>
					<option value= ">"> > </option>
					<option value= "<"> < </option>
					<option value= "="> = </option>
					<option value= "<="> <= </option>
					<option value= ">="> >= </option>
					<option value= "<>"> <> </option>
					<option value= "Like"> Like </option>
					<option value= "Between"> Between </option>
					<option value= "ISNULL"> IS NULL </option>
					<option value= "ISNOTNULL"> IS NOT NULL </option>
					<option value= "IN"> IN </option>
					<option value= "NOTIN"> NOT IN </option>
				</select>
			</ul>
		</td>
		<td>
			<ul>
				Value : <input type="text" name="value">
			</ul>
		</td>
		<td>		
		</td>
		<td>
			<ul>				
				<input type="hidden" name="page2" value="submit">
				<button onclick="onPlusClick();" class="button button1"> + </button>				
			</ul>
		</td>
	</tr>	
</table>`
        var div = document.getElementById("tablesDiv");
        div.insertAdjacentHTML("beforeend", strDOM);
        /* var length = $('#colunm').children('option').length; */
    	 }
 </script>
 <!-- <script>
      $(document).ready(() => {
        $("#butCreateQuery").click(event => {
          //var selectedTable = $("#tblList").val();
          //var selectedColumns = $("#colunm").val();
      	  //var query = "SELECT "+${selectedColumns}+" FROM"+ ${selectedTable};
      	var t =  $('#tblList :selected').text();
     	var c =  $('#colunm :selected').text();
       	var query = "Select "+ c +" From "+ t;
       	var p = document.createElement("p");
        var node = document.createTextNode(query);
        p.appendChild(node);
        document.body.appendChild(p);
        document.getElementById("demo").appendChild(p);
          
        });
      });
    </script> -->
   <script>
      function onButCreateQueryClick() {
        var selectedTable = document.getElementById("tblList").value;
        var columnsSelect = document.getElementById("colunm");
        var selectOptions = columnsSelect.options;
        var selectedColumns = [];
        for(var i = 0;i<selectOptions.length;i++)
        {
          var opt = selectOptions[i];
          if(opt.selected)
            selectedColumns.push(opt.value);
        }
        var selectedCondition = document.getElementById("colunms").value;
        var selectedCondition = document.getElementById("option").value;
        var query = "SELECT " + selectedColumns + " FROM " + selectedTable;
        var p = document.createElement("p");
        var node = document.createTextNode(query);
        p.appendChild(node);
        document.body.appendChild(p);
        document.getElementById("query").appendChild(p); 
      }
    </script>
<style >
.button1 {background-color: #4CAF50;} 
.button2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
header {
    background-color: #666;
    padding: 10px;
    text-align: center;
    font-size: 30px;
    color: white;
}
</style>
</head>
<body>
	<%	
	  List<String> list = (ArrayList<String>) request.getAttribute("last_table");
	%>
	<header><h1> Customized Report Progress </h1></header>
	<table>
		<tr>
			<td>
				<h1><b><font size="4"> Tables</b></font></h1>
				<select id="tblList" name="tblList" onChange="getSelectValue();">		
					<option value = ""> -- Select -- </option>
						<%for(int i = 0; i < list.size(); i++){ 
							String tab_name = list.get(i);			
						%>
					<option value = "<%=tab_name%>" <%if(request.getAttribute("selecttable") != null && request.getAttribute("selecttable").equals(tab_name)){%>selected <%}%>><%=tab_name%></option>
						<%}%>			
				</select>
				&nbsp;
			</td>
			<td>
				<h1><b><font size="4"> Selected Table</b></font></h1>
				<form id="form1" action="LoginCheckController" method="get">
						<input type="hidden" name="page" value="submit">
						<input type="hidden" id="selecttable" name="selecttable" value="">						
					</form>
			<%=request.getAttribute("selecttable")!=null ? request.getAttribute("selecttable"):""  %>
			&nbsp;
			</td>
			<td>
				<ul>
				<h1><b><font size="4"> Columns </b></font></h1>
				 <select id="colunm" name="select" multiple="multiple">
					<%for(int i = 0; i < listc.size(); i++){ 
							String columns = listc.get(i);%>
						<option value="<%=columns %>"><%= columns%></option>	
				<%} %>
				</select> 
				
			    <script>
			        $("#colunm").multipleSelect({
			            filter: true
			        });
			    </script>
			    &nbsp;
			    </ul>		
			</td>
			</table>
		<h1><b><font size="5">Select Conditions </font></b></h1>
		<div id="tablesDiv">
		<table id="table">
		<tr>
			<td>
				<select id="colunms" name="select">
				<option value = ""> -- Select -- </option>
					<%for(int i = 0; i < listc.size(); i++){ 
							String columns = listc.get(i);%>
						<option value="<%=columns %>"><%= columns%></option>	
				<%} %>
				</select> 
			</td>
			<td>
				<ul>
					<select id="option">
						<option value = ""> -- Select -- </option>
						<option value= ">"> > </option>
						<option value= "<"> < </option>
						<option value= "="> = </option>
						<option value= "<="> <= </option>
						<option value= ">="> >= </option>
						<option value= "<>"> <> </option>
						<option value= "Like"> Like </option>
						<option value= "Between"> Between </option>
						<option value= "ISNULL"> IS NULL </option>
						<option value= "ISNOTNULL"> IS NOT NULL </option>
						<option value= "IN"> IN </option>
						<option value= "NOTIN"> NOT IN </option>
					</select>
				</ul>
			</td>
			<td>
				<ul>
					Value : <input type="text" name="value">
				</ul>
			</td>
			<td>
				<ul>				
					<!-- <input type="hidden" name="page2" value="submit"> -->
					<button onclick="onPlusClick();" class="button button1"> + </button>				
				
				</ul>
			</td>
			</tr>
	</table>
	 </div>
	 <div>
	 <table>
	 <tr>
	 	<td> 
	 			<h1><b><font size="5"> Group By </b></font></h1>
	 			<select id="groupby" name="select" multiple="multiple">
					<%for(int i = 0; i < listc.size(); i++){ 
							String columns = listc.get(i);%>
						<option value="<%=columns %>"><%= columns%></option>	
				<%} %>
				</select> 
				
			    <script>
			        $("#groupby").multipleSelect({
			            filter: true
			        });
			    </script>
			</td>
		</tr>
		<td> 
	 			<h1><b><font size="5"> Order By </b></font></h1>
	 			<select id="orderby" name="select" multiple="multiple">
					<%for(int i = 0; i < listc.size(); i++){ 
							String columns = listc.get(i);%>
						<option value="<%=columns %>"><%= columns%></option>	
				<%} %>
				</select> 
				
			    <script>
			        $("#orderby").multipleSelect({
			            filter: true
			        });
			    </script>
			    &nbsp;
			</td>	
	 	<tr><td><button id="butCreateQuery" onclick="onButCreateQueryClick()" class="button button2">Generate Query</button></td></tr>
	 	<td><div id="query"></div></td>
	 	<tr><td><button class="button button2">Submit</button></td></tr>
	 	<td><button class="button button2">Get Report</button></td>
	 	<!-- <td><input id="datepicker" type="text">
    		<script>
        		var datepicker = new ej.calendars.DatePicker({ width: "200px" });
        		datepicker.appendTo('#datepicker');
    		</script>
    	</td> -->
	 	</tr>
	 </table>
	 </div>
	 <%-- <table id="border">
	<c:forEach var="row" query="${result.rows}">
	<tr>
	<td><c:out value="${row.selectedColumns}"/></td>
	</tr>
	</c:forEach>
	</table> --%>
</body>
</html>
