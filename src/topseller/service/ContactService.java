package topseller.service;

import topseller.models.Message;

import java.util.ArrayList;

public interface ContactService {
    void sendMessage(Message message);

    ArrayList<Message> getMessages();

    void setMessageAsRead(Message message);

    void deleteMessage(Message message);
}
