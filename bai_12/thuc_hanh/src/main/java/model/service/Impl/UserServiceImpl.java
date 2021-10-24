package model.service.Impl;

import model.bean.User;
import model.repository.Impl.UserImpl;
import model.repository.UserRepository;
import model.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepository userRepository = new UserImpl();
    @Override
    public List<User> findAll() {
       return userRepository.findAll();
    }

    @Override
    public void save(User user) {

    }

    @Override
    public User findById(int id)
    {
        return userRepository.findById(id);

    }

    @Override
    public User remove(int id) {
        return null;
    }
}
