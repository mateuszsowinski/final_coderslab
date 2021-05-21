package pl.sowinski.final_project.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Repository
public class JpaUserService implements UserService {
    @Autowired
    private final UserRepository userRepository;

    public JpaUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public Optional<User> getUserById(Long userId) {
        return userRepository.findById(userId);
    }

    @Override
    public User addUser(User addUser) {
        return userRepository.save(addUser);
    }

    @Override
    public void update(User updatedUser) {
        userRepository.save(updatedUser);

    }

    @Override
    public void delete(Long userId) {
        userRepository.deleteById(userId);
    }

    @Override
    public List<User> getUser() {
        return userRepository.findAll();
    }
}
