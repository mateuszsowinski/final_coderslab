package pl.sowinski.final_project.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Role;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.repository.RoleRepository;
import pl.sowinski.final_project.repository.UserRepository;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

@Service
public class JpaUserService implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public JpaUserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public Optional<User> getUserById(Long userId) {
        return userRepository.findById(userId);
    }

    @Override
    public User addUser(User addUser) {
        Role userRole = roleRepository.findByName("ROLE_USER");
        addUser.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
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

    @Override
    public User findByUserName(String name) {
        return userRepository.findByUserName(name);
    }

}
