package topseller.DAO;

import topseller.models.Message;

import java.util.ArrayList;

public interface ContactDAO {
    void sendMessage(Message message);

    ArrayList<Message> getMessages();

    void setMessageAsRead(Message message);

    void deleteMessage(Message message);
}
