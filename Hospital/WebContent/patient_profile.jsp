<%@ page import="java.sql.*" %>
<html>
<body bgcolor="grey">
<table border="2" height="200" width="400" align="center">
<tr>
<th>Id</th>
<th>Name</th>
<th>Age</th>
<th>Mobile</th>
<th>State</th>
<th>DoctorName </th>
<th>Action</th>
</tr>
<% 
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
int id=(Integer)session.getAttribute("id");
String sql="select * from patient where id=?";
pst=con.prepareStatement(sql);
pst.setInt(1,id);
ResultSet set=pst.executeQuery();
while(set.next())
{
%>
<tr>
<td><%= set.getInt("id") %></td>
<td><%= set.getString("name") %></td>
<td><%= set.getInt("age") %></td>
<td><%= set.getInt("mobile") %></td>
<td><%= set.getString("doctorname") %></td>
<td><%= set.getString("mailid") %></td>
<td><a href="update_patient_profile.jsp?id=<%=set.getInt("id")%>">Update</a></td>
</tr>
<%} %>
</table>
<center><h1><a href="patient_log.html">Logout</a></h1></center>
</body>
</html>