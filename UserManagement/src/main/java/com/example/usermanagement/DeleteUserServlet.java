package com.example.usermanagement;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
@WebServlet("/Deleteuser")
public class DeleteUserServlet extends HttpServlet {
    private final static String query="delete from users where ID = ? ";
    public void services(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<link rel='stylesheet' href='css/bootstrap.css'></link>");

        int id=Integer.parseInt(request.getParameter("ID"));


        //load driver DB
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (Exception e)
        {
            e.printStackTrace();
        }

        // Connection
        try {
            Connection connection= DriverManager.getConnection("jdbc:mysql://localhost/usermanagement","dbabdo","dbabdo");
            PreparedStatement ps=connection.prepareStatement(query);
           ps.setInt(1,id);
            int count =ps.executeUpdate();
            out.println("<div  class='card' style='margin:auto;width:300px;margin-top:100px'>");
            if (count==1)
            {
                //out.println("<h1 class='bg-success text-center text-light'>Record Deleted Successfully</h1>");
                RequestDispatcher dispatcher=request.getRequestDispatcher("Showusers.jsp");
                dispatcher.forward(request,response);
            }else
            {
                out.println("<h1class='bg-danger text-center text-light'>Record No Deleted Successfully</h1>");
            }

        } catch (SQLException e) {
            out.println("<h1>"+e.getMessage()+"</h1>");
            e.printStackTrace();
        }catch (Exception ee) {
            throw new RuntimeException(ee);
        }

        out.println("  <a href='Home.jsp'><button class='btn btn-outline-success'>Home</button></a>");
        out.println("</div>");

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        services(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        services(request,response);
    }
    public void destroy() {
    }
}
