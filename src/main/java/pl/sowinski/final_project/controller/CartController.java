package pl.sowinski.final_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.sowinski.final_project.category.JpaCategoryService;
import pl.sowinski.final_project.model.Cart;
import pl.sowinski.final_project.model.Category;

import java.util.Collection;

@Controller
@RequestMapping("/app/*")
public class CartController {

    public final JpaCategoryService jpaCategoryService;

    public CartController(JpaCategoryService jpaCategoryService) {
        this.jpaCategoryService = jpaCategoryService;
    }

    @GetMapping("/cart")
    public String cart(Model model){
        Cart cart = new Cart();
        model.addAttribute("cart", cart);
        return "headerLoginUser";
    }

    @ModelAttribute("categoryModel")
    public Collection<Category> categories(){
        return jpaCategoryService.getCategory();
    }

}
