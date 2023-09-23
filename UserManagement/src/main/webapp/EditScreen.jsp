<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: elfek
  Date: 9/23/2023
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <meta charset="x-iso-8859-11">
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

            <%! String query = " select Name,Email,Phone,Date,City,Gender from users where ID=?";%>

            <%
                int id=Integer.parseInt(request.getParameter("id"));

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                } catch (Exception e)
                {
                    e.printStackTrace();
                }

                try {
                    Connection connection= DriverManager.getConnection("jdbc:mysql://localhost/usermanagement","dbabdo","dbabdo");
                    PreparedStatement ps=connection.prepareStatement(query);
                    ps.setInt(1,id);
                    ResultSet rs=ps.executeQuery();
                    rs.next();
            %>
            <div style='margin:auto;width:500px;margin-top:100px;'>
                <a href="Home.jsp"><button class="btn btn-outline-success ">Home</button></a><br><br>

                <form action="/EditServlet?id=<%= id %>" method="post" >
                    <table  class='table table-hover table-striped'>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="username" value="<%=rs.getString(1)%>"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td><input type="text" name="phone" value="<%=rs.getString(3)%>"></td>
                        </tr>
                        <tr>
                            <td>Date</td>
                            <td><input type="date" name="date" value="<%=rs.getString(4)%>"></td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td><input type="text" name="city" value="<%=rs.getString(5)%>"></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td><input type="text" name="gender" value="<%=rs.getString(6)%>"></td>

                        </tr>
                        <tr>
                            <td><button type="submit" class="btn btn-outline-success">Save</button></td>
                            <td><button type="reset" class="btn btn-outline-danger">Cancel</button></td>
                        </tr>


                    </table>
                </form>
            </div>
            <%
                } catch (SQLException e) {
                    out.println("<h1>"+e.getMessage()+"</h1>");
                    e.printStackTrace();
                }catch (Exception ee) {
                    throw new RuntimeException(ee);
                }
            %>




</body>
</html>
