package topseller.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import topseller.models.LoginUser;
import topseller.models.User;
import topseller.models.UserType;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
@Repository
public class UserDAOImpl implements UserDAO {
    @Autowired
    DataSource dataSource;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void signup(User newUser) {

    }

    @Override
    public User signin(LoginUser loginUser) {
        String sql = "select * from user where email='" + loginUser.getEmail() + "' and password='" + loginUser.getPassword()
                + "'";
        List<User> users = jdbcTemplate.query(sql, new UserMapper());
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
            user.setPhone(rs.getString("phone"));
            user.setType(UserType.toUserType(rs.getString("type")));
            user.setNbStrikes(rs.getInt("nb_strikes"));
            return user;
        }
}
}
