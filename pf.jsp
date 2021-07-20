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

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	div
	{
        height:680px;
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
	}
	th
	{
     background-color: wheat;
	}
</style>
</head>
<body bgcolor="#0a2f5b">
<h1>User Profile:</h1>
<table border="1">
<tr bgcolor="pink">
<td>USER_ID</td>
<td>Name</td>
<td>Email</td>
<td>Phone</td>
<td>City</td>
<td>Password</td>

<td></td>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from user where user_id=1";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("user_id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("pwd") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>