<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <%!
 
   String name;
   String address;
   Integer age;
   
   
    static Connection connection = null;
    static Statement stmt = null;
    static ResultSet resultSet = null;
    
    static{
    	
    	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		String url="jdbc:mysql://localhost:3306/ineuron";
    		String user="root";
    		String password="Password";
    		connection = DriverManager.getConnection(url, user, password);
    		stmt = connection.createStatement();
    	}catch(ClassNotFoundException e){
    		e.printStackTrace();
    	}catch(SQLException se){
    		se.printStackTrace();
    	}
    	
    	
    }
   
   %>
   
   <%
      
      name =request.getParameter("name");
      address= request.getParameter("address");
      age=Integer.parseInt(request.getParameter("age"));
       
      resultSet = stmt.executeQuery("select * from studentuser where name ='"+name+"'");
      boolean available = resultSet.next();
      if(available==true){
   %> 	  <jsp:forward page="./existed.jsp" />
    
    <%  }else{
    	  String sqlInsertQuery = String.format("insert into studentuser(`name`,`address`,`age`) values('%s','%s','%d')", name,address,age);
    	  int count = stmt.executeUpdate(sqlInsertQuery);
    	    if(count==1){
    %>  <jsp:forward page="./success.jsp"/>	    	
    	    <%}
    	    else{
    	    %>
    	    <jsp:forward page="./failure.jsp" />
    	    		
    <%} }%>  
    
       
</body>
</html>