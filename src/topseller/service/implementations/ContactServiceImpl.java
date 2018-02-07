package topseller.service.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import topseller.DAO.ContactDAO;
import topseller.models.Message;
import topseller.service.ContactService;

import java.util.ArrayList;

@Service
public class ContactServiceImpl implements ContactService {
    @Autowired
    ContactDAO contactDAO;
    @Override
    public void sendMessage(Message message) {
        this.contactDAO.sendMessage(message);
    }

    @Override
    public ArrayList<Message> getMessages() {
        return this.contactDAO.getMessages();
    }

    @Override
    public void setMessageAsRead(Message message) {
        this.contactDAO.setMessageAsRead(message);
    }

    @Override
    public void deleteMessage(Message message) {
        this.contactDAO.deleteMessage(message);
    }
}
