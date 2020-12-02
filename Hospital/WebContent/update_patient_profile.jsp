<%@ page import="java.sql.*" %>
<html>
<body>
<% Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
int id=Integer.parseInt(request.getParameter("id"));
String sql="select * from patient where id=?";
pst=con.prepareStatement(sql);
pst.setInt(1,id);
ResultSet set=pst.executeQuery();
if(set.next()){
%>

<form action="./patient_updated.jsp"  align="center">
<table align="Center">
<tr>
<td><input type="hidden" name="id" value="<%=set.getInt("id")%>" ></td>
<tr>
<td>Name :</td>
<td> <input type="text" name="name" value="<%=set.getString("name")%>"  ></td>
</tr>
<tr>
<tr>
<td>Mail id:</td>
<td><input type="email" name="mail" value="<%=set.getString("mailid")%>" /></td>
</tr>
<tr>
<td>Age : </td>
<td><input type="number" name="age" value="<%=set.getInt("age")%>"/></td>
</tr>
<tr>
<td>Mobile Number: </td>
<td><input type="number" name="mobile" value="<%=set.getLong("mobile")%>"/></td>
</tr>
<tr>
<td>State:</td>
<td><select name="state"> 
<option value="<%=set.getString("state") %>"><%=set.getString("state") %></option>
<option value="Telangana">Telangana</option>
<option value="Bangalore">Bangalore</option>  
<option value="TamilNadu">TamilNadu</option>
<option value="Gujarat">Gujarat</option>  
</select> </td>
</tr>
<tr>
<td>Doctor Name :</td>
<td><input type="text" name="doctor_name" value="<%=set.getString("doctorname") %>" /></td>
</tr>
</table>
<input type="submit" value="Submit"/>
</form>
<%} %>
</body>
</html>