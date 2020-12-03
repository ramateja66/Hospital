<%@ include file="connect.jsp" %>
<html>
<body align="center" bgcolor="grey">
<table align="Center" border="2" >
<tr>
<th>Name</th>
<th>Mobile</th>
<th>Age</th>
<th>Gender</th>
<th>Specialist</th>
<th>Date of Appointment</th>
<th>Time</th>
<th>Address</th>
<th>Status</th>
<th>Accepted</th>
<th>Action</th>
</tr>

<%
String sql="select * from appointment where specialist=?";
String specialist=(String)session.getAttribute("specialisation");
pst=con.prepareStatement(sql);
pst.setString(1,specialist);
ResultSet set=pst.executeQuery();
while(set.next())
{
%>
<tr>
<td><%=set.getString("name")%></td>
<td><%=set.getInt("mobile")%></td>
<td><%=set.getInt("age")%></td>
<td><%=set.getString("gender")%></td>
<td><%=set.getString("specialist")%></td>
<td><%=set.getString("date_of_appointment")%></td>
<td><%=set.getString("time")%></td>
<td><%=set.getString("address")%></td>
<td><%=set.getString("status")%></td>
<td><%=set.getString("doctorname")%></td>
<% if(set.getString("status").equalsIgnoreCase("Accepted")) { %>
<td>Accepted</td>
<%}else{ %>
<td><a href="accept.jsp?id=<%=set.getInt("id")%>">Accept</a></td>
<%} %>
</tr>

<%} %>

</table>
<h2><a href="success.html">Home</a></h2>
</body>
</html>