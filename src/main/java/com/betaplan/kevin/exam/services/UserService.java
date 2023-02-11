package com.betaplan.kevin.exam.services;

import com.betaplan.kevin.exam.models.LoginUser;
import com.betaplan.kevin.exam.models.User;
import com.betaplan.kevin.exam.repositorys.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepo;

    public User register(User newUser, BindingResult result) {
        if (userRepo.findByEmail(newUser.getEmail()).isPresent()) {
            result.rejectValue("email", "EmailTaken", "This Email is already in use!");
        } else if (!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        if (result.hasErrors()) {
            return null;
        } else {
            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepo.save(newUser);
        }
    }
    public User login(LoginUser newLoginObject, BindingResult result) {
        Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());

        if (!potentialUser.isPresent()) {
            result.rejectValue("email", "EmailNotFound", "No user found with that Email address!");
        } else if (!BCrypt.checkpw(newLoginObject.getPassword(), potentialUser.get().getPassword())) {
            result.rejectValue("password", "Matches", "Invalid Password!");
        }

        if (result.hasErrors()) {
            return null;
        } else {
            return potentialUser.get();
        }
    }

    public List<User> allUsers() {
        return userRepo.findAll();
    }
    public User findUser(Long id) {
        Optional<User> optionalUser = userRepo.findById(id);
        if (optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }
    public User findOneUser(Long id) {
        return userRepo.findById(id).orElse(null);
    }
    public User addUser(User user) {
        return userRepo.save(user);
    }
    public User updateUser(User user) {
        return userRepo.save(user);
    }

    public void deleteUser(Long id) {
        Optional<User> optionalUser = userRepo.findById(id);
        if (optionalUser.isPresent()) {
            userRepo.deleteById(id);
        } else return;
    }

}
