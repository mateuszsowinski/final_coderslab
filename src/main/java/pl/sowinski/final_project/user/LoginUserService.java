package pl.sowinski.final_project.user;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.repository.UserRepository;

import javax.transaction.Transactional;

@Service
@Transactional
public class LoginUserService {


    public final UserRepository userRepository;

    public LoginUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User getUserByName(String userName) {
        return userRepository.findByUserName(userName);
    }

    public User getLoggedUser(Authentication authentication) {
        if (authentication == null) {
            return null;
        }
        User user = null;
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUserDetails) {
            String userName = ((CustomUserDetails) principal).getUsername();
            user = getUserByName(userName);
        }
        return user;
    }

}
