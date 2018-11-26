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
	
	function myFunction() {
	    var x = document.getElementById("tblList").value;
	    document.getElementById("demo").innerHTML = x;
	}
</script>
<script>
<%
List<String> listc = (ArrayList<String>) request.getAttribute("column_names");
%>
      function onPlusClick() {
        var strDOM =`<table id="table">
			<td>
			<select id="colunm" name="select">
			<option value = ""> -- Select -- </option>
				<%for(int i = 0; i < listc.size(); i++){ 
						String columns = listc.get(i);%>
					<option value="<%=columns %>"><%= columns%></option>	
			<%} %>
			</select> 
		</td>
		<td>
			<ul>
				<select>
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
				<input type="hidden" name="page2" value="submit">
				<button onclick="onPlusClick();" class="button button1"> + </button>				
			</ul>
		</td>
	</tr>	
</table>`
        var div = document.getElementById("tablesDiv");
        div.insertAdjacentHTML("beforeend", strDOM);
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
		<!-- <div align="center" onmouseover="this.style.backgroundColor='yellow'"><b><font size="5"> Customized Report Progress</font></b></div> -->
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
			<td>
			<button id="getSelectsBtn">GetSelects</button>
			<!-- <script>
        		$("select").multipleSelect();
        		$("#getSelectsBtn").click(function() {
        			alert("Selected values: " + $("select").multipleSelect("getSelects"));
            		alert("Selected texts: " + $("select").multipleSelect("getSelects", "text"));
        		});
    		</script> -->
			</td>
			</table>
		<h1><font size="6">Select Conditions </font></h1>
		<br>
		<div id="tablesDiv">
		<table id="table">
			<td>
				<select id="colunm" name="select">
				<option value = ""> -- Select -- </option>
					<%for(int i = 0; i < listc.size(); i++){ 
							String columns = listc.get(i);%>
						<option value="<%=columns %>"><%= columns%></option>	
				<%} %>
				</select> 
			</td>
			<td>
				<ul>
					<select>
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
					<input type="hidden" name="page2" value="submit">
					<button onclick="onPlusClick();" class="button button1"> + </button>				
				
				</ul>
			</td>
		</tr>	
	</table>
	 </div>
	 <div>
	 <table>
	 	<tr><button onclick="myFunction();" class="button button2">Generate Query</button></tr>
	 </table>
	 <p id="demo"></p>
	 </div>
</body>
</html>
