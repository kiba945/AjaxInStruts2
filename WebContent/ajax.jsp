<%@taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<title>Ajax implementation in Struts 2 </title>

<script type="text/javascript">

	//Get XMLHTTP Object
	function getXMLHTTPObject() 
	{
		var xmlhttpObject = null;
		try 
		{
			xmlhttpObject = new ActiveXObject("Msxml2.XMLHTTP"); // For Old Microsoft Browsers
		}
		catch (e) 
		{
			try 
			{
				xmlhttpObject = new ActiveXObject("Microsoft.XMLHTTP"); // For Microsoft IE 6.0+
			}
			catch (e1) 
			{
				xmlhttpObject = false; // No Browser accepts the XMLHTTP Object then false
			}
		}
		if (!xmlhttpObject && typeof XMLHttpRequest != 'undefined') 
		{
			xmlhttpObject = new XMLHttpRequest(); //For Mozilla, Opera Browsers
		}
		return xmlhttpObject; // Mandatory Statement returning the ajax object created
	}

	
	// Change the value of the outputText field
	function setAjaxOutput() 
	{
			document.getElementById('userNameDiv').innerHTML = xmlhttpObject.responseText;
	}

	function handleServerResponse() 
	{
		if (xmlhttpObject.readyState == 4) 
		{
			if (xmlhttpObject.status == 200) 
			{
				setAjaxOutput();
			}
			else 
			{
			    alert("Error during AJAX call. Please try again");
			}
		}
	}

	
	// Implement business logic
	function doAjaxCall() 
	{
		xmlhttpObject = getXMLHTTPObject();
		if (xmlhttpObject != null) 
			{
			var URL = "myAjaxAction.action?userName=" + document.getElementById('userName').value;
			xmlhttpObject.open("POST", URL, true);
			xmlhttpObject.onreadystatechange = handleServerResponse;
			xmlhttpObject.send(null);
			}
	}
	
</script>

</head>

<body>
		<h3>Ajax implementation in Struts2</h3>
<br/>
	<div id="userNameDiv" style="color: red; font-weight: bold"></div>
<br/>
<br/>
	Please Enter your Name :
	<s:textfield id="userName" theme="simple" name="userName" onblur="doAjaxCall();"></s:textfield>
	<br />
	
</body>
</html>
