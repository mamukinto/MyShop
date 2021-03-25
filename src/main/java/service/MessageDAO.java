package service;

import model.Message;
import model.exceptions.ShopException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {
public void addMessage(String subject,String message,String formattedDate,String userEmail) throws ShopException {
    try {
        Connection c=ConnectionProvider.getConnection();
        PreparedStatement preparedStatement = c.prepareStatement("insert into messages values(?,?,?,?)");
        preparedStatement.setString(1,subject);
        preparedStatement.setString(2,message);
        preparedStatement.setString(3,formattedDate);
        preparedStatement.setString(4,userEmail);
        preparedStatement.executeUpdate();
    } catch (SQLException e) {
        throw new ShopException(e.getMessage());
    }
  }
  public List<Message> getMessages() throws ShopException{
    List<Message>Messages=new ArrayList<>();

      try {
          Connection connection=ConnectionProvider.getConnection();
          Statement statement=connection.createStatement();
          ResultSet resultSet=statement.executeQuery("select * from messages");
          String subject=resultSet.getString("subject");
          String message=resultSet.getString("message");
          String formattedDate=resultSet.getString("formattedDate");
          String userEmail=resultSet.getString("userEmail");
          Message message1=new Message(subject,message,formattedDate,userEmail);
          Messages.add(message1);
      } catch (SQLException e) {
          throw new ShopException(e.getMessage());
      }
       return Messages;
  }
}
