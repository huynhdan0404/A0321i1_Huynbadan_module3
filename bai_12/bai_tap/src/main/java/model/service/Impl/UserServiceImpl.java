package model.service.Impl;

import model.bean.User;
import model.repository.Impl.UserRepositoryImpl;
import model.repository.UserRepository;
import model.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepository userRepository = new UserRepositoryImpl();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
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
