<%@ include file="connect.jsp" %>
<%
String name=request.getParameter("name");
long mobile=Long.parseLong(request.getParameter("number"));
int age=Integer.parseInt(request.getParameter("age"));
String gender=request.getParameter("gender");
String specialist=request.getParameter("specialist");
String date=request.getParameter("date");
String time=request.getParameter("time");
String address=request.getParameter("address");
String sql="insert into appointment(name,mobile,age,gender,specialist,date_of_appointment,time,address) values(?,?,?,?,?,?,?,?)";
pst=con.prepareStatement(sql);
pst.setString(1,name);
pst.setLong(2,mobile);
pst.setInt(3,age);
pst.setString(4,gender);
pst.setString(5,specialist);
pst.setString(6,date);
pst.setString(7,time);
pst.setString(8,address);
int i=pst.executeUpdate();
if(i!=0)
	response.sendRedirect("patient_appointment.html?msg=confirmed");
%>
