import java.sql.*;

public class MySQLAccess {

    public static void main(String[] args) {
        Connection connection= null;
        Statement statement = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybatis",
                    "root","123456");
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select * from activities");
            while (resultSet.next()) {
                System.out.println(resultSet.getString("name"));
            }
            preparedStatement = connection.prepareStatement("insert into activities values(?,?)");
            preparedStatement.setInt(1,4);
            preparedStatement.setString(2,"pingpong");
            preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement("Select * from activities");
            resultSet= preparedStatement.executeQuery();
            while (resultSet.next()) {
                System.out.println(resultSet.getString("name"));
            }

            //
            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
