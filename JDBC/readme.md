Sample Code about how to use JDBC


workflow:

	1. import the package
	
	2. load and register the driver
	
	3. Establish the connection
	
	4. create the statement/prepare statement
	
	5. execute the query
	
	6. process result
	
	7. close resultset, statement, connection

driver manager:
	it is used to manage all the drivers.
	verify whether the driver is matching with the database or not.
	
***Types of statements:***

1. simple statement:
		one query will be executed only once
> Statement st = con.createStatement(); 

2. prepared statement:
		one query will be executed multiple times by giving different dynamic values
> PreparedStatement st = con.prepareStatement(?, ?);

3. callable statement:
		we can execute group of queries at a time
> CallableStatement st =con.prepareCall("create a procedure");
	
***Types of methods:***

1.execute(): it will execute DDL & DML and returns integer value as result

2.executeUpdate(): it will execute DDL & DML and returns boolean values as result

3.executeQuery(): it will execute DQL

***Result Set:***

it is an interface which executes the result which will be in the form of table (rows & columns).
> ResultSet rs = statement.executeQuery("select * from emp");
