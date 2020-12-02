<%@ page import="java.sql.*" %>
<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
String sql="update patient set name=?,age=?,mobile=?,state=?,doctorname=?,mailid=? where id=? ";
String name=request.getParameter("name");
String mail=request.getParameter("mail");
int age=Integer.parseInt(request.getParameter("age"));
long mobile=Long.parseLong(request.getParameter("mobile"));
String state=request.getParameter("state");
String doctor_name=request.getParameter("doctor_name");
int id=Integer.parseInt(request.getParameter("id"));
pst=con.prepareStatement(sql);
pst.setString(1,name);
pst.setInt(2,age);
pst.setLong(3,mobile);
pst.setString(4,state);
pst.setString(5,doctor_name);
pst.setString(6,mail);
pst.setInt(7,id);
int i=pst.executeUpdate();
if(i!=0)
	response.sendRedirect("patient_profile.jsp?msg=updated");
%>