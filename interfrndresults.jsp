<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>search  friend results</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="style1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-900.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style2 {color: #0099FF}
.style3 {
	font-size: 36px;
	font-weight: bold;
}
.style7 {font-size: 30px}
.style8 {color: #0066FF}
.style9 {color: #FF3300}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
  
    <div class="header_resize">
	 <div class="logo">
    
      </div>
      <div class="menu_nav">
	  <%String user=(String)application.getAttribute("user");
	  String grp=(String)application.getAttribute("grp");
	  %>
        <ul>
          <li><a href="usermain.jsp"><span>Home</span></a></li>
          <li><a href="#"><span><%=user%></span></a></li>
          <li><a href="userlogin.jsp"><span>Logout</span></a></li>
         
        </ul>
      </div>
         <h1 class="style2">Multiview Alignment Hashing For Efficient Image Search</h1>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="934" height="307" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="934" height="307" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="934" height="307" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <p class="infopost style3 style7">Search Results </p>
          <div class="clr"></div>
          <p>
	     <table >
        <%@ include file="connect.jsp" %>
	<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
		<%
	
    
						String s1,s2,s3,s4;
						int i=0;
						String fname=request.getParameter("key");
						
						try 
						{	
							ArrayList al=new ArrayList();
							String status1=null;
						   	String status=null;
						   	String sql="select * from user where username LIKE '%"+fname+"%' and username!='"+user+"' and grp!='"+grp+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(sql);
					   		while(rs.next())
					   		{
								i=rs.getInt(1);
								s2=rs.getString(2);
								s1=rs.getString(3);
								al.add(s1);
								status ="Request";
							
								String sql1="select * from friends where (rfrom='"+user+"' and rto='"+s1+"') || (rfrom='"+s1+"' and rto='"+user+"')";
								Statement st1=connection.createStatement();
								ResultSet rs1=st1.executeQuery(sql1);
								if(rs1.next())
									{
										String rfrom =rs1.getString(3);
										String rto =rs1.getString(5);
										status1 = rs1.getString(6);
										
										
										
										if(status1.equalsIgnoreCase("waiting"))
										{
											status="Request sent";
										}
										else if(status1.equalsIgnoreCase("Accepted"))
										{
											status="Already Friend";
										}
										
										
									}	
								
					%>
					
					 <figure>
				<img height="100" width="100" src="profile_pic.jsp?id=<%=i%>&type=<%="user"%>" />	
				
				 <div id="container">
				
				 <figcaption>
				 
				  <h3 class="style8">Group: <span class="style9"><%=s2%></span> </h3>
				 <h3 class="style8">Name:<span class="style9"> <%=s1%></span></h3>
				  <%
						if(status.equals("Already Friend")){
						%><h3> <%=status%></h3><br />
						 <%
						}else if(status.equals("Request sent")){
						%><%=status%><br />
						  <%
						}
						else{
						%>
						 <form id="form1" name="form1" method="post" action="updaterequest.jsp?toname=<%=s1%>&togrp=<%=s2%>&key=<%=fname%>&type1=<%="inter"%>"">
						  <input type="submit" name="Submit" value="<%=status%>" /><br />
				 </form>
				 <%}%>
				 </figcaption>
				 </div>	
		    </figure>  
		
					
          
		
            <%
						
			}
			if(al.isEmpty())
			{
				%>
				<h2 class="style9">No Results Found</h2>
				<%
			}
					
					connection.close();
					
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
	 </table>
		  </p>
          <div class="img"></div>
		
        </div>
        <div class="article">
          <p align="right"><a href="searchinterfrnds.jsp">Back</a></p>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">

          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="usermain.jsp">Home</a></li>
            <li><a href="userlogin.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2>&nbsp;</h2>
        <p>&nbsp;</p>
        <ul class="fbg_ul"><li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
      <div class="col c3">
        <h2>&nbsp;</h2>
        <p>&nbsp;</p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="rf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
