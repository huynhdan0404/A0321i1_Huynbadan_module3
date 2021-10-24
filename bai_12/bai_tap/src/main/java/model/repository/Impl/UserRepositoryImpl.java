package model.repository.Impl;

import model.bean.User;
import model.repository.UserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement statement = this.baseRepository.getConnection()
                    .prepareStatement("select  * from users");
            ResultSet resultSet = statement.executeQuery();
            User user;
            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name_users"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userList;
    }

    @Override
    public void save(User user) {

    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public User remove(int id) {
        return null;
    }
}
