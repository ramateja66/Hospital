<%@ page import="java.sql.*" %>
<html>
<body>
<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
int id=Integer.parseInt(request.getParameter("id"));
pst=con.prepareStatement("Select * from doctor where doctor_id=?");
pst.setInt(1,id);
ResultSet set=pst.executeQuery();
if(set.next()){
%>
<form action="./doctor_updated.jsp"  align="center">
<table align="center">
<tr>
<td>Id</td>
<td><input type="hidden" name="id" value="<%=set.getInt("doctor_id") %>" ></td>
</tr>
<tr>
<td>Name :</td>
<td> <input type="text" name="name" value="<%=set.getString("doctor_name") %>"></td>
</tr>

<tr>
<td>Mail id:</td>
<td><input type="email" name="mail" value="<%=set.getString("emailid") %>"/></td>
</tr>
<tr>
<td>Age : </td>
<td><input type="number" name="age" value="<%=set.getInt("age")%>"/></td>
</tr>
<tr>
<td>Mobile Number: </td>
<td><input type="number" name="mobile" value="<%=set.getInt("mobile") %>" /></td>
</tr>
<tr>
<td>Country:</td>
<td><select name="nationality" >
<option value="<%=set.getString("nationality")%>"><%=set.getString("nationality")%></option>
<option value="India">India</option>
<option value="U.S.A">U.S.A</option>  
<option value="Canada">Canada</option>
<option value="Australia">Australia</option>  
</select> </td>
</tr>
<tr>
<td>Specialist :</td>
<td><input type="radio" name="specialist" value="ENT" checked="<%=set.getString("specialist") %>" >ENT
<input type="radio" name="specialist" value="Cardiologist" >Cardiologist
<input type="radio" name="specialist" value="Dentist" >Dentist
</td>
</tr>
</table>
<input type="submit" name="Update"/>
</form>
<%} %>
</body>
</html>