package com.firstapplication;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PatientLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		HttpSession session=request.getSession();
		String mail=request.getParameter("mailid");
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		
		
		String sql="select * from patient where mailid=? and name=?";
		try {
			statement=connection.prepareStatement(sql);
			statement.setString(1, mail);
			statement.setString(2,name);
			ResultSet set=statement.executeQuery();
			if(set.next())
			{	
				session.setAttribute("id", set.getInt("id"));
				response.sendRedirect("patient_sucess.html");
			}
			else
			{
				writer.println("No");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
