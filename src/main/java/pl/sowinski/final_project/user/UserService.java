package pl.sowinski.final_project.user;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.User;

import java.util.List;
import java.util.Optional;
@Service
public interface UserService {
    Optional<User> getUserById(Long userId);

    User addUser(User addUser);

    void update(User updatedUser);

    void delete(Long userId);

    List<User> getUser();
}
