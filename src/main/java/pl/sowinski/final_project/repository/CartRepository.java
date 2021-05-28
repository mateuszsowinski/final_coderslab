package pl.sowinski.final_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.sowinski.final_project.model.Cart;
import pl.sowinski.final_project.model.User;

import java.util.List;

public interface CartRepository extends JpaRepository<Cart, Long> {

     List<Cart> findByUser(User user);
}
