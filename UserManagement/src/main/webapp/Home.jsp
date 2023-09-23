<%--
  Created by IntelliJ IDEA.
  User: elfek
  Date: 9/23/2023
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="x-iso-8859-11">
    <title>User Management</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
        #frm{
            width: 500px;
            margin: auto ;
            margin-top:100px;
        }






    </style>
</head>
<body class="container-fluid">

<form action="/Register" method="post" class="from card" id="frm">
    <H2 class="bg-success text-center text-white">Register Form</H2>
    <table class="table table-hover">
        <tr>
            <td>Name</td>
            <td><input type="text" name="username" required></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" required></td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><input type="text" name="phone" required></td>
        </tr>
        <tr>
            <td>Date</td>
            <td><input type="date" name="date" required></td>
        </tr>
        <tr>
            <td>City</td>
            <td><select name="city">
                <option>Cairo</option>
                <option>Giza</option>
                <option>Luxor</option>
                <option>Alexandria</option>
                <option>Al Fayoum</option>
                <option>Al Minya</option>
                <option>Aswan</option>
            </select></td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <input type="radio" name="gender" value="male">Male &nbsp;
                <input type="radio" name="gender" value="female">Female
            </td>
        </tr>
        <tr>
            <td><button type="submit" class="btn btn-outline-success">Register</button></td>
            <td><button type="reset" class="btn btn-outline-danger">Cancel</button></td>
        </tr>


    </table>
    <button class="btn btn-outline-success d-block"><a href="/Showusers.jsp">Show Users</a></button>
    </form>

</body>
</html>
