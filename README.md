# ConnectingWithDBUsingJSP


ConnectingWithDBUsingJSP
1. In index.jsp, we will display the form to fill the student data.
2, In the process.jsp we will process the login  and get the data from the form and  then we will check if that record is present in the database or not.
3. If the data is present then we will forward the page to "existed.jsp" 
4. In the "existed.jsp" we will display a message along with that we will include the "index.jsp" 
5. IF the data is not present we will insert the data into database and then forward the page to "success.jsp"
5. If the data is not inserted into the database then we will forward it to "failure.jsp".

note: Normally we won't write the persistance logic inside .jsp file. It is only for viewing part. Inside the jsp file we write the presentation logic.
