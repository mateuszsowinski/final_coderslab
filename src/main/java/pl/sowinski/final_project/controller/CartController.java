package pl.sowinski.final_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.sowinski.final_project.model.Cart;

@Controller
public class CartController {

    @GetMapping("/cart")
    public String cart(Model model){
        Cart cart = new Cart();
        model.addAttribute("cart", cart);
        return "headerLoginUser";
    }
}
