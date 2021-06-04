package pl.sowinski.final_project.cart;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.sowinski.final_project.cart.CartService;
import pl.sowinski.final_project.cart.JpaCartService;
import pl.sowinski.final_project.model.Cart;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.user.CustomUserDetailsService;
import pl.sowinski.final_project.user.JpaUserService;

import java.util.List;

@Controller
@RequestMapping("/app")
public class CartController {

    public final JpaCartService jpaCartService;
    public final CartService cartService;
    public final CustomUserDetailsService customUserDetailsService;
    public final JpaUserService jpaUserService;

    public CartController(JpaCartService jpaCartService, CartService cartService, CustomUserDetailsService customUserDetailsService, JpaUserService jpaUserService) {
        this.jpaCartService = jpaCartService;
        this.cartService = cartService;
        this.customUserDetailsService = customUserDetailsService;
        this.jpaUserService = jpaUserService;
    }

    @GetMapping("/cart")
    public String cart(Model model, @AuthenticationPrincipal UserDetails userDetails) {
        String userName = userDetails.getUsername();
        User user = jpaUserService.findByUserName(userName);
        List<Cart> cartList = jpaCartService.cartListByUser(user);
        model.addAttribute("cartList", cartList);
        return "cartList";
    }

    @GetMapping("/cart/delete/{id:\\d+}")
    public String delete(@PathVariable Long id) {
        cartService.delete(id);
        return "redirect:/app/cart";
    }
}
