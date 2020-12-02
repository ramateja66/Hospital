<%@ page import="java.sql.*" %>
<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
String name=request.getParameter("name");
String mail=request.getParameter("mail");
int age=Integer.parseInt(request.getParameter("age"));
long mobile=Long.parseLong(request.getParameter("mobile"));
String country=request.getParameter("nationality");
String specialist=request.getParameter("specialist");
int id=Integer.parseInt(request.getParameter("id"));
String sql="update doctor set doctor_name=?,emailid=?,mobile=?,specialist=?,age=?,nationality=? where doctor_id=?";
pst=con.prepareStatement(sql);
pst.setString(1, name);
pst.setString(2,mail);
pst.setLong(3,mobile);
pst.setString(4,specialist);
pst.setInt(5,age);
pst.setString(6,country);
pst.setInt(7,id);
int x=pst.executeUpdate();
if(x!=0)
	response.sendRedirect("doctor_profile.jsp?msg=updated");
%>