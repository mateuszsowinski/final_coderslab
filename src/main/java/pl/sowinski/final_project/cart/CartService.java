package pl.sowinski.final_project.cart;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Cart;
import pl.sowinski.final_project.model.Category;

import java.util.List;
import java.util.Optional;
@Service
public interface CartService {

    Cart add(Cart addCart);

    Optional<Cart> getCategoryById(Long id);

    List<Cart> getCategory();

    void update (Cart cartUpdate);
    void delete (Long id);
}
