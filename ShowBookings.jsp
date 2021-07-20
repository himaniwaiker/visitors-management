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
<body bgcolor="#0a2f5b">

<h1><font color="white">All Bookings</font></h1>
<table border="1" bgcolor="white">
<tr>
<td>Booking_id</td>
<td>User_id</td>
<td>Name</td>
<td>Email</td>
<td>Mobile</td>
<td>City</td>
<td>Pdate</td>
<td>Ptime</td>
<td>Address</td>
<td>Departure Terminal</td>
<td>Rdate</td>
<td>Arrival Terminal</td>
<td>Journey Type</td>
<td>No of Passengers</td>
<td>Children seat rquired</td>
<td>Additional Message</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from booking";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("booking_id") %></td>
<td><%=resultSet.getString("user_id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("mobile") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("pdate") %></td>
<td><%=resultSet.getString("ptime") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("dter") %></td>

<td><%=resultSet.getString("rdate") %></td>
<td><%=resultSet.getString("ater") %></td>
<td><%=resultSet.getString("jtype") %></td>
<td><%=resultSet.getString("no_of_pas") %></td>
<td><%=resultSet.getString("cseat") %></td>
<td><%=resultSet.getString("mesg") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
