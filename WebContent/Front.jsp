<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collections"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="crawl.GFG"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Focused Web Crawler</title>
<style>

#wrapper
{ 
text-align:center;
margin-top: 200px;

}
<centre>
.container {
    position: centre;
    top:10px;
    right: 16px;
    
    margin: 12px;
    max-width: 500px;
    padding: 10px;
    background-color: white;

}
</centre
<centre>

.container1 {
    position: absolute;
    top:8px;
    right:16px;
    right: 0;
    margin: 12px;
    margin-right:100px;
    max-width: 500px;
    padding: 16px;
    background-color: white;
}
</centre>
/* Full-width input fields */
input[type=text], input[type=text] {
    width: 100px;
    padding: 15px;
    margin: 5px 0 22px 0;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=text]:focus {
    background-color: #ddd;
    outline: none;
}

/* Set a style for the submit button */
.btn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    border: none;
    cursor: pointer;
    width: 10%;
    opacity: 0.9;
}

.btn:hover {
    opacity: 2;
}
</style>

</head>
<body  style="font-family: helvetica; background: url(image2.jpg); background-repeat:no-repeat;  background-size: stretch; ;min-height: 100%; ">
<center><h1>Focused Web Crawler</h1></center>
<div id="wrapper">



<form action="extract" method="post" >
  <label for="keyword" style="font-size: 30px; color: blue; background-color:white; "><b>Keyword</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" placeholder="Enter the Keyword" name="keyword" required style="height:20px; width:400px;">

<br><br>    <label for="url" style="font-size: 30px; color: blue; background-color:white;"><b>URLs</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" placeholder="Enter the URL........" name="URL" required style="height:20px; width:400px;">
    <br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button type="submit" class="btn">Search</button>
    <br><br>
        
  </form>
  </div>
 

</body>
</html>