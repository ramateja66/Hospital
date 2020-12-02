package com.firstapplication;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PatientRegistration extends HttpServlet {
	Connection connection=null;
	PreparedStatement pst=null;
	public void init(ServletConfig config)
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/hospital";
		String user="root";
		String password="root";
		try {
			connection=DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter writer=response.getWriter();
		String name=request.getParameter("name");
		String mailid=request.getParameter("mail");
		String age=request.getParameter("age");
		int old=Integer.parseInt(age);
		String phone=request.getParameter("mobile");
		long mobile=Long.parseLong(phone);
		String state=request.getParameter("state");
		String doctorname=request.getParameter("doctor_name");
		String qry="insert into patient(name,age,mobile,state,doctorname,mailid) value(?,?,?,?,?,?);";
		try {
		pst=connection.prepareStatement(qry);
		pst.setString(1, name);
		pst.setInt(2,old);
		pst.setLong(3,mobile);
		pst.setString(4,state);
		pst.setString(5,doctorname);
		pst.setString(6,mailid);
		int x=pst.executeUpdate();
		if(x!=0)
			response.sendRedirect("registration_success.html");
		} 
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
