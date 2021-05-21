package pl.sowinski.final_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.sowinski.final_project.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail (String email);
}
