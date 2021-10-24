package model.repository;

import model.bean.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();

    void save(User user);

    User findById(int id);

    User remove(int id);
}
