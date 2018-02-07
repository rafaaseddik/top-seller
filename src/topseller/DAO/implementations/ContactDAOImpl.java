package topseller.DAO.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import topseller.DAO.ContactDAO;
import topseller.models.Message;
import topseller.models.Utilities;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Repository
public class ContactDAOImpl implements ContactDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void sendMessage(Message message) {
        String sql = "INSERT INTO `contact` (`fullname`, `subject`, `email`, `message`, `date`) VALUES (?, ?, ?, ?, ?)";
        try {

            this.jdbcTemplate.update(sql, new Object[]{message.getFullname(), message.getSubject(), message.getEmail(), message.getMessage(), Utilities.getToday()});
        } catch (Exception e) {
            System.out.println("-- ERROR : ContactDao.sendMessage() : Error getting database");
            e.printStackTrace();
        }
    }
    @Override
    public ArrayList<Message> getMessages() {
        String sql = "SELECT * from contact ORDER BY date DESC";
        ArrayList<Message> messages = new ArrayList<>();
        try {

            messages = (ArrayList<Message>) this.jdbcTemplate.query(sql , new MessageMapper());
        } catch (Exception e) {
            System.out.println("-- ERROR : ContactDao.getMessages() : Error getting database");
            e.printStackTrace();
        }
        return messages;
    }
    @Override
    public void setMessageAsRead(Message message){
        String sql="UPDATE contact set isRead=1 where id=?";
        try {
            this.jdbcTemplate.update(sql, new Object[]{message.getId()});
        } catch (Exception e) {
            System.out.println("-- ERROR : ContactDao.setMessageAsRead() : Error getting database");
            e.printStackTrace();
        }
    }
    @Override
    public void deleteMessage(Message message){
        String sql="DELETE FROM contact where id=?";
        try {
            this.jdbcTemplate.update(sql, new Object[]{message.getId()});
        } catch (Exception e) {
            System.out.println("-- ERROR : ContactDao.deleteMessage() : Error getting database");
            e.printStackTrace();
        }
    }

    private class MessageMapper implements RowMapper<Message> {
        @Override
        public Message mapRow(ResultSet rs, int i) throws SQLException {
            Message message = new Message();
            message.setId(rs.getInt("id"));
            message.setFullname(rs.getString("fullname"));
            message.setSubject(rs.getString("subject"));
            message.setEmail(rs.getString("email"));
            message.setMessage(rs.getString("message"));
            message.setDate(rs.getDate("date"));
            message.setRead(rs.getBoolean("isRead"));
            return message;
        }
    }
}
