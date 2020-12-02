package com.firstapplication;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DoctorRegistration extends HttpServlet {
	Connection connection=null;
	PreparedStatement statement=null;
	public void init(ServletConfig config)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/hospital";
			String user="root";
			String password="root";
			connection=DriverManager.getConnection(url, user, password);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter writer=response.getWriter();
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String email=request.getParameter("mail");
		String phone=request.getParameter("mobile");
		long number=Long.parseLong(phone);
		String specialist=request.getParameter("specialist");
		String age=request.getParameter("age");
		int old=Integer.parseInt(age);
		String nationality=request.getParameter("nationality");
		String sql="insert into doctor(doctor_name,password,emailid,mobile,specialist,age,nationality) value(?,?,?,?,?,?,?);";
		try {
		statement=connection.prepareStatement(sql);
		statement.setString(1,name);
		statement.setString(2,password);
		statement.setString(3,email);
		statement.setLong(4, number);
		statement.setString(5, specialist);
		statement.setInt(6,old);
		statement.setString(7, nationality);
		int x=statement.executeUpdate();
		if(x!=0)
		{
			response.sendRedirect("registration_success.html");
		}
		else
		{
			writer.println("Not Successful");
		}
		} 
	catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
