<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.util.Collections"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Map"%>
<%@page import="crawl.GFG"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Links</title>
<style>

#overlay{
  position:fixed;
  z-index:99999;
  top:0;
  left:0;
  bottom:0;
  right:0;
  background:rgba(0,0,0,0.9);
  transition: 1s 0.4s;
}
#progress{
  height:1px;
  background:#fff;
  position:absolute;
  width:0;
  top:50%;
}
#progstat{
  font-size:0.7em;
  letter-spacing: 3px;
  position:absolute;
  top:50%;
  margin-top:-40px;
  width:100%;
  text-align:center;
  color:#fff;
}
*{margin:0; padding:0px;}
body{ width:100%; font-family:helvetica;
background-image:"images.jpg";
background-color: aqua;
background: "images.jpg"
}
#wrapper{ text-align:center;width:100%;}
#animated_div{width: 100%;height: 100%;background-size:cover;animation: animatebackground 10s linear infinite;}
@keyframes animatebackground 
{
 from {background-position: 0 0;}
 to {background-position: -1000px 0;}
}



/* Add styles to the form container */
<centre>
.container {
    position: centre;
    top:30px;
    right: :16px;
    
    margin: 10px;
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
    margin: 20px;
    max-width: 500px;
    padding: 16px;
    background-color: white;
}
</centre>
/* Full-width input fields */
input[type=text], input[type=text] {
    width: 100%;
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
    opacity: 1;
}
img{width:32.2%;}
</style>

</head>
<body style=" font-family: helvetica; background: url(image2.jpg); background-repeat:no-repeat;  background-size: stretch; ;min-height: 100%; ">
<div id="overlay">
        <div id="progstat"></div>
        <div id="progress"></div>
      </div>
      <div id="container">
        <img >
        <img >
             </div>
  
<script type="text/javascript">

;(function(){
	  function id(v){return document.getElementById(v); }
	  function loadbar() {
	    var ovrl = id("overlay"),
	        prog = id("progress"),
	        stat = id("progstat"),
	        img = document.images,
	        c = 0;
	        tot = img.length;

	    function imgLoaded(){
	      c += 1;
	      var perc = ((100/tot*c) << 0) +"%";
	      prog.style.width = perc;
	      stat.innerHTML = "Loading "+ perc;
	      if(c===tot) return doneLoading();
	    }
	    function doneLoading(){
	      ovrl.style.opacity = 0;
	      setTimeout(function(){ 
	        ovrl.style.display = "none";
	      }, 1200);
	    }
	    for(var i=0; i<tot; i++) {
	      var tImg     = new Image();
	      tImg.onload  = imgLoaded;
	      tImg.onerror = imgLoaded;
	      tImg.src     = img[i].src;
	    }    
	  }
	  document.addEventListener('DOMContentLoaded', loadbar, false);
	}());
</script>

<div >
<form action="#" method="get">

  <% 
  HashSet<String> list = (HashSet<String>) request.getAttribute("list");
  request.setAttribute("lists",list);
 try {
	HashMap<String, Integer> map = new HashMap<>();	
		for(String S: list) {
			Document doc = Jsoup.connect(S).get();		
			
		String Content = doc.title() + " "+ doc.text() + " " + doc.getElementsByTag("body").text() + " " + doc.getElementsByTag("p").text();		
		session=request.getSession(false);  
        String n=(String)session.getAttribute("Keyword");  
        
		int count = 0;
        String inputCharSeq = Content;
        Pattern pattern = Pattern.compile("("+n+")");
        Matcher matcher = pattern.matcher(inputCharSeq);

        List<String> KeywordList = new ArrayList<String>();
        while (matcher.find())
        {
        	++count;
        	//System.out.println("Found a " + matcher.group() + " - " +count);
        	//out.println("Found a " + matcher.group() + " - " +count);
            KeywordList.add(matcher.group());
        }
        map.put(S,Collections.frequency(KeywordList,n));
        if(KeywordList.isEmpty())
			{}
        else{
   		//out.println(map);
        	//out.println(S+":->");
  		//out.println(Collections.frequency(KeywordList,n));
        //out.println("KeywordList = " + KeywordList);
}
        
			//System.out.println(S);
		}
		GFG gfg=new GFG();
		Map<String, Integer> hm1 =gfg.sortByValue(map);
	//	System.out.println(hm1);
		%>
		 <table border="2" style="margin-left: 210px;">
		 <th>URL</th><th>Count</th>
		 <% for (Map.Entry<String, Integer> en : hm1.entrySet()) {%>
	       
	        <tr><td><%=en.getKey() %></td>
	        	<td><%=en.getValue()%></td></tr>
	        
	        <%    
			 //out.println(en.getKey() + "->" + en.getValue());
	         }%>
		 </table>
	<%
}catch(Exception e) {
		System.out.print(e);
	}

%>
   
  
  
  
  
</form> 
</div>

</body>
</html>