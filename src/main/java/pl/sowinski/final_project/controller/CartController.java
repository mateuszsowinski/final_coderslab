package pl.sowinski.final_project.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.sowinski.final_project.cart.CartService;
import pl.sowinski.final_project.cart.JpaCartService;
import pl.sowinski.final_project.model.Cart;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.user.LoginUserService;

import java.util.List;

@Controller
@RequestMapping("/app")
public class CartController {

    public final LoginUserService loginUserService;
    public final JpaCartService jpaCartService;
    public final CartService cartService;

    public CartController(LoginUserService loginUserService, JpaCartService jpaCartService, CartService cartService) {
        this.loginUserService = loginUserService;
        this.jpaCartService = jpaCartService;
        this.cartService = cartService;
    }

    @GetMapping("/cart")
    public String cart(Model model, @AuthenticationPrincipal Authentication authentication) {
        User user = loginUserService.getLoggedUser(authentication);
            List<Cart> cartList = jpaCartService.cartListByUser(user);
            model.addAttribute("cartList", cartList);
            model.addAttribute("pageTitle", "shopping Cart");
            return "cartList";
        }
@GetMapping("/cart/delete/{id:\\d+}")
    public String delete(@PathVariable Long id){
        cartService.delete(id);
        return "redirect:/app/cart";

}
    }
