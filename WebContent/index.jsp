<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="f1">
Name:<input type="text" name="name1" onkeyup="show1(this.value)"/>
<div id="livesearch" style="width:146px;position:fixed;left:48px;"></div>
<input type="button" name="val" value="value" onclick="lov()"/><br/>
<input type="submit"/>
</form>
<script type="text/javascript">
alert("Edited... by Raj");
function pick2(symbol) {
	  document.f1.name1.value= symbol;
	  document.getElementById("livesearch").innerHTML="";
	  document.getElementById("livesearch").style.border="0px";
	  
	}
function lov(){
	var x=document.f1.name1.value;	
	alert(x);
	sList=window.open("values.jsp?s="+x,"list","width=100,height=100,scrollable=yes");
}
function show1(name2){
	//alert("hi");
	var str=name2;
	if (str.length==0) {
	    document.getElementById("livesearch").innerHTML="";
	    document.getElementById("livesearch").style.border="0px";
	    return;
	  }
	  if (window.XMLHttpRequest) {
	    // code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	  } else {  // code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  xmlhttp.onreadystatechange=function() {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200){
	      document.getElementById("livesearch").innerHTML=xmlhttp.responseText;
	      document.getElementById("livesearch").style.border="1px solid blue";
	      document.getElementById("livesearch").style.background="#DCDCDC";
	    }
	  };
	  xmlhttp.open("GET","livesearch.jsp?q="+str,true);
	  xmlhttp.send();
}
</script>
</body>
</html>
