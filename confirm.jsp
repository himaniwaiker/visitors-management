<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String user_id = request.getParameter("user_id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "emp";
String userid = "root";
String password = "kavi1234";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<style>
	div
	{
        height:400px;
        width:993px;
        border-color:black;
        background-color:aliceblue;
        margin:auto;
        border-style:solid;
	}
	table
	{
		border-color:black;
        text-align:left;
        background-color:lightgrey;
        border:3;
        height:40%;
        width:60%;
        
        
	}
	th
	{
     background-color: wheat;
	}
</style>

</head>

<body bgcolor="#0a2f5b">
<br>
<font color="white" size="6"><b><center>Your booking is made successfully</center></b></font><br/>
<br/>



<table border="1"><br><center><b>

<tr>

<td>Your User ID is</td>
<td>Your Bill is generated by name</td>

<td>No of passengers are</td>
<td>Your Date for Journey is</td>
<td>Your Departure Terminal is</td>
<td>Your Arrival Terminal is</td>
<td>Total Bill generated</td>
<br>


</tr>





<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select user_id,name,no_of_pas,pdate,dter,ater from booking natural join user";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("user_id") %></td>
<td><%=resultSet.getString("name") %></td>

<td><%=resultSet.getString("no_of_pas") %></td>
<td><%=resultSet.getString("pdate") %></td>

<td><%=resultSet.getString("dter") %></td>


<td><%=resultSet.getString("ater") %></td>


</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</b></center></table>

</body>

</html>

