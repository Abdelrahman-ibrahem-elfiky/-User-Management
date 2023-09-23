<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: elfek
  Date: 9/23/2023
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="x-iso-8859-11">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>Show Users</title>
</head>
<body>
            <%!String query="select ID,Name,Email,Phone,Date,City,Gender from users";%>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                } catch (Exception e)
                {
                    e.printStackTrace();
                }

                try {
                    Connection connection= DriverManager.getConnection("jdbc:mysql://localhost/usermanagement","dbabdo","dbabdo");
                    PreparedStatement ps=connection.prepareStatement(query);
                    ResultSet rs=ps.executeQuery();
                    %>
                <div style="width: 800px ;margin: auto;margin-top:50px">
                    <a href="Home.jsp"><button class="btn btn-outline-success ">Home</button></a><br><br>

                    <table class="table table-hover table-striped">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Date</th>
                    <th>City</th>
                    <th>Gender</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <%while (rs.next()){%>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><a href="EditScreen.jsp?id=<%=rs.getInt(1)%>">Edit</a></td>
                    <td><a href="/Deleteuser?ID=<%=rs.getInt(1)%> ">Delete</a></td>
                </tr>
                    <%}%>
            </table>
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
