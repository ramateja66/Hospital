<%@ page import="java.sql.*" %>
<html>
<body bgcolor="grey">
<Center><h1>Profile Details Are shown</h1></Center>
<table border="2" align="center" height="400" width="600">
<tr>
<th>Id</th>
<th>Name</th>
<th>Password</th>
<th>Email</th>
<th>Mobile</th>
<th>Specialisation</th>
<th>Age</th>
<th>Action</th>
</tr>
<%
Connection connection=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String user="root";
String pwd="root";
connection=DriverManager.getConnection(url,user,pwd);
String mail=(String)session.getAttribute("setmail");
String password=(String)session.getAttribute("setpwd");
int id=(Integer)session.getAttribute("id");
String sql="select * from doctor where doctor_id=?";
pst=connection.prepareStatement(sql);
pst.setInt(1, id);
ResultSet set=pst.executeQuery();
while(set.next())
{
	%>
<tr>
<td><%=set.getInt(1) %> </td>
<td><%= set.getString(2) %></td>
<td> <%= set.getString(3) %></td>
<td> <%= set.getString(4) %></td>
<td> <%= set.getInt(5) %></td>
<td> <%= set.getString(6) %></td>
<td> <%= set.getString(7) %></td>
<td><a href="update_doctor_profile.jsp?id=<%=set.getInt(1)%>">Update</a></td>
</tr>


<%} %>

</table>
<center><h1><a href="doctor_login.html">Logout</a></h1></center>
</body>
</html>