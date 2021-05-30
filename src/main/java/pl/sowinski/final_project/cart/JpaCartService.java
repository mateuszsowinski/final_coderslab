package pl.sowinski.final_project.cart;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Cart;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.repository.CartRepository;

import java.util.List;
import java.util.Optional;

@Service
public class JpaCartService implements CartService {

    private CartRepository cartRepository;

    public JpaCartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    @Override
    public Cart add(Cart addCart) {
        return cartRepository.save(addCart);
    }

    @Override
    public Optional<Cart> getCartById(Long id) {
        return cartRepository.findById(id);
    }

    @Override
    public List<Cart> getCart() {
        return cartRepository.findAll();
    }

    @Override
    public void update(Cart cartUpdate) {
        cartRepository.save(cartUpdate);
    }

    @Override
    public void delete(Long id) {
        cartRepository.deleteById(id);
    }

    public List<Cart> cartListByUser(User user) {
        return cartRepository.findByUser(user);

    }
}
