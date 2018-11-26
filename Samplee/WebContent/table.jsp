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
	function create(){
		 /* var btn = document.createElement("TABLE");
		 x.setAttribute("id", "table");
		 document.getElementById("table").appendChild(btn);  */
		var x = document.getElementById("table").innerHTML;
	    document.getElementById("demo").innerHTML = x; 
	}
</script>
<script>
      function onPlusClick() {
        var strDOM =
          "<table><tr>" +
          "<td><select ><option >select</option></select></td>" +
          "<td><input type='button' value='+' onclick='onPlusClick()' /></td>" +
          "</tr></table>";
        var div = document.getElementById("tablesDiv");
        div.insertAdjacentHTML("beforeend", strDOM);
      }
 </script>
<style >
.button1 {background-color: #4CAF50;} 
</style>
</head>
<body>
	<%	
	  List<String> list = (ArrayList<String>) request.getAttribute("last_table");
	%>
	
	<%
	  List<String> listc = (ArrayList<String>) request.getAttribute("column_names");
	%>
		<div align="center" onmouseover="this.style.backgroundColor='yellow'"><b><font size="5"> Customized Report Progress</font></b></div>
		<br>
	<table>
		<tr>
			<td>
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
				<form id="form1" action="LoginCheckController" method="get">
						<input type="hidden" name="page" value="submit">
						<input type="hidden" id="selecttable" name="selecttable" value="">						
					</form>
			<%=request.getAttribute("selecttable")!=null ? request.getAttribute("selecttable"):""  %>
			&nbsp;
			</td>
			<td>
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
			</td>

			</table>
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
					<button onclick="onclick();" class="button button1"> + </button>				
				</ul>
			</td>
		</tr>	
	</table>
	<table id="demo">
	 </table>									
</body>
</html>
