package pl.sowinski.final_project.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.sowinski.final_project.cart.CartService;
import pl.sowinski.final_project.cart.JpaCartService;
import pl.sowinski.final_project.model.Cart;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.user.LoginUserService;

import java.security.Certificate;
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

//    @GetMapping("/cart/addPromo")
//    public String cartAddPromo(Model model) {
//        Cart cart = new Cart();
//        model.addAttribute("cartAdd", cart);
//        return "promoListUser";
//    }
//
//    @PostMapping("/cart/addPromo")
//    public String cartAddPromoForm(@ModelAttribute("cartAdd") Cart cart, BindingResult bindingResult) {
//        cartService.add(cart);
//        return "redirect:/app/promo/user/list";
//    }


    @GetMapping("/cart")
    public String cart(Model model, @AuthenticationPrincipal Authentication authentication) {
        User user = loginUserService.getLoggedUser(authentication);
        List<Cart> cartList = jpaCartService.cartListByUser(user);
        model.addAttribute("cartList", cartList);
        model.addAttribute("pageTitle", "shopping Cart");
        return "cartList";
    }

    @GetMapping("/cart/delete/{id:\\d+}")
    public String delete(@PathVariable Long id) {
        cartService.delete(id);
        return "redirect:/app/cart";

    }
    @GetMapping("/admin")
    @ResponseBody
    public String userInfo(@AuthenticationPrincipal UserDetails customUser) {

        String userId = customUser.getUsername();
        return "You are logged as " + customUser + userId; }
}
