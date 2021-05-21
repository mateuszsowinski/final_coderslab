package pl.sowinski.final_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.sowinski.final_project.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Long> {
}
