package topseller.DAO.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import topseller.DAO.UserDAO;
import topseller.models.LoginUser;
import topseller.models.User;
import topseller.models.UserType;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class UserDAOImpl implements UserDAO {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    String imagesServerURL;

    @Override
    public void signup(User newUser) {
        String sql = "INSERT INTO user (`fname`, `lname`, `email`, `password`, `region`, `avatar_url`, `type`, `phone`) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, new Object[] { newUser.getFname(),newUser.getLname(),newUser.getEmail(),newUser.getPassword(),
                newUser.getRegion(),newUser.getRawAvatarUrl(),newUser.getType().toString(),newUser.getPhone() });
    }
    @Override
    public User signin(LoginUser loginUser) {
        String sql = "select * from user where email='" + loginUser.getEmail() + "' and password='" + loginUser.getPassword()
                + "'";
        List<User> users = new ArrayList<User>();
        try{
            users = jdbcTemplate.query(sql, new UserMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : UserDao.signup() : Error getting database");
            e.printStackTrace();
        }

        return users.size() > 0 ? users.get(0) : null;
    }

    @Override
    public User getUserByEmail(String email){
        String sql = "select * from user where email='" + email + "'";
        List<User> users = new ArrayList<User>();
        try{
            users = jdbcTemplate.query(sql, new UserMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : UserDao.getUserByEmail() : Error getting database");
            e.printStackTrace();
        }

        return users.size() > 0 ? users.get(0) : null;
    }

    @Override
    public User getUserByID(int userID) {
        String sql = "select * from user where id='" + userID + "'";
        List<User> users = new ArrayList<User>();
        try{
            users = jdbcTemplate.query(sql, new UserMapper());
        }catch(Exception e){
            System.out.println("-- ERROR : UserDao.getUserByID() : Error getting database");
            e.printStackTrace();
        }

        return users.size() > 0 ? users.get(0) : null;
    }

    class UserMapper implements RowMapper<User> {
        public User mapRow(ResultSet rs, int arg1) throws SQLException {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setFname(rs.getString("fname"));
            user.setLname(rs.getString("lname"));
            user.setEmail(rs.getString("email"));
            user.setRegion(rs.getString("region"));
            user.setAvatarUrl(rs.getString("avatar_url"));
            user.setImagesServerURL(imagesServerURL);
            user.setPhone(rs.getString("phone"));
            user.setType(UserType.toUserType(rs.getString("type")));
            user.setNbStrikes(rs.getInt("nb_strikes"));
            return user;
        }
    }
}
