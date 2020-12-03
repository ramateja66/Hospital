<%@ include file="connect.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
String name=(String)session.getAttribute("name");
String sql="update appointment set status=?,doctorname=? where id=?";
pst=con.prepareStatement(sql);
pst.setString(1, "accepted");
pst.setString(2,name);
pst.setInt(3,id);
int i=pst.executeUpdate();
if(i!=0)
	response.sendRedirect("view_appointment.jsp?msg=updated");

%>