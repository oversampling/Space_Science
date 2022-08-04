<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/8/2022
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration Form</title>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("form").submit(function () {
                var fname = $('#fname').val();
                if(fname === "")
                {
                    alert("Invalid first name");
                    return false;
                }
            });
        });
    </script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        * {
            box-sizing: border-box;
        }
        /* Button used to open the contact form - fixed at the bottom of the page */
        .open-button {
            background-color: #555;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 23px;
            right: 28px;
            width: 280px;
        }
        .form-popup {
            overflow-x: hidden;
            overflow-y: auto;
            height: 400px;
            display: none;
            position: fixed;
            top: 60%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
        /* Add styles to the form container */
        .form-container {
            max-width: 500px;
            padding: 10px;
            background-color: white;
        }
        /* Full-width input fields */
        .form-container input[type=text], .form-container input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }
        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus, .form-container input[type=password]:focus
        {
            background-color: #ddd;
            outline: none;
        }
        /* Set a style for the submit button */
        .form-container .btn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
            opacity: 0.8;
        }
        .form-container .cancel {
            background-color: red;
        }
        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }
    </style>
</head>
<body>
<h2>Register - Popup Form</h2>
<p>Click on the button at the bottom of this page to open the
    Registration form.</p>
<%
    String errorname = (String) request.getAttribute("namerror");
    String erroraddress = (String) request.getAttribute("addresserror");
%>
<button class="open-button" onclick="openForm()">Open Form</button>
<div class="form-popup" id="myForm">
    <form action="register_javabean.jsp" class="form-container">
        <h1>Registration Form</h1>
        <table>
            <tbody>
            <tr style="font-size: large; font-weight: bold">
                <td>First Name</td>
                <td><input type="text" id="fname" name="fname" value=""
                           size="20" />
                    <%
                        if (errorname != null) {
                            out.println(errorname);
                        }
                    %></td>
            </tr>
            <tr style="font-size: large; font-weight: bold">
                <td>Last Name</td>
                <td><input type="text" id="lname" name="lname" value=""
                           size="20" /></td>
            </tr>
            <tr style="font-size: large; font-weight: bold">
                <td>Address</td>
                <td><input type="text" id="address" name="address" value=""
                           size="30" />
                    <%
                        if (erroraddress != null) {
                            out.println(erroraddress);
                        }
                    %></td>
            </tr>
            <tr style="font-size: large; font-weight: bold">
                <td>Gender</td>
                <td>Male<input type="radio" name="gender" value="M" />
                    Female<input type="radio" name="gender" value="F" />
                </td>
            </tr>
            <tr style="font-size: large; font-weight: bold">
                <td>Qualification</td>
                <td>SPM<input type="checkbox" name="qualification"
                              value="SPM" /> STPM<input type="checkbox" name="qualification"
                                                        value="STPM" /> Others<input type="checkbox"
                                                                                     name="qualification" value="Others" />
                </td>
            </tr>
            <tr style="font-size: large; font-weight: bold">
                <td>Race</td>
                <td><select name="race">
                    <option>Select</option>
                    <option>Malay</option>
                    <option>Chinese</option>
                    <option>Indian</option>
                    <option>Other</option>
                </select></td>
            <tr>
            <tr style="font-size: large; font-weight: bold">
                <td>Brief Write Up About Yourself</td>
                <td><textarea name="intro" rows="10" cols="35">
</textarea>
                </td>
            </tr>
            </tbody>
        </table>
        <button type="submit" class="btn">Submit Info</button>
        <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
        <button type="reset" class="btn">Reset</button>

    </form>
</div>
<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }
    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>
</body>
</html>
