package com.example.usermanagement;

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

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
    private final static String query = "update users set Name=?,Email=?,Phone=?,Date=?,City=?,Gender=? where ID=?";
    public void services(HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();
        //set content type
        response.setContentType("text/html");
        //link the bootstrap
        out.println("<link rel='stylesheet' href='css/bootstrap.css'></link>");
        //get the values
        int id = Integer.parseInt(request.getParameter("id"));
            String name=request.getParameter("username");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String date=request.getParameter("date");
            String city=request.getParameter("city");
            String gender=request.getParameter("gender");


        //load the JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(Exception e) {
            e.printStackTrace();
        }
        //generate the connection
        try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost/usermanagement","dbabdo","dbabdo");
            PreparedStatement ps = con.prepareStatement(query);){
            //set the values
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, date);
            ps.setString(5, city);
            ps.setString(6, gender);
            ps.setInt(7, id);
            //execute the query
            int count = ps.executeUpdate();
            out.println("<div class='card' style='margin:auto;width:300px;margin-top:100px'>");
            if(count==1) {
                out.println("<h2 class='bg-success text-light text-center'>Record Edited Successfully</h2>");
            }else {
                out.println("<h2 class='bg-success text-light text-center'>Record Not Edited</h2>");
            }
        }catch(SQLException se) {
            out.println("<h2 class='bg-success text-light text-center'>"+se.getMessage()+"</h2>");
            se.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }
        out.println("<a href='Home.jsp'><button class='btn btn-outline-success'>Home</button></a>");
        out.println("&nbsp; &nbsp;");
        out.println("<a href='Showusers.jsp'><button class='btn btn-outline-success'>Show User</button></a>");
        out.println("</div>");
        //close the stram
        out.close();

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
