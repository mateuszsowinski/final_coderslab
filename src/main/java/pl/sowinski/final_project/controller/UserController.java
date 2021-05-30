package pl.sowinski.final_project.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.sowinski.final_project.category.JpaCategoryService;
import pl.sowinski.final_project.model.Category;
import pl.sowinski.final_project.model.Product;
import pl.sowinski.final_project.model.Promo;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.product.JpaProductService;
import pl.sowinski.final_project.promo.JpaPromoService;
import pl.sowinski.final_project.user.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {


    public final UserService userService;
    public final JpaPromoService jpaPromoService;
    public final JpaCategoryService jpaCategoryService;
    public final JpaProductService jpaProductService;


    public UserController(UserService userService, JpaPromoService jpaPromoService, JpaCategoryService jpaCategoryService, JpaProductService jpaProductService) {
        this.userService = userService;
        this.jpaPromoService = jpaPromoService;
        this.jpaCategoryService = jpaCategoryService;
        this.jpaProductService = jpaProductService;
    }

    @GetMapping("")
    public String startingPage(Model model){
        List<Promo> promoList = jpaPromoService.getPromo();
        List<Category> categoryList = jpaCategoryService.getCategory();
        List<Product> productList = jpaProductService.getProduct();
        model.addAttribute("productList", productList);
        model.addAttribute("promoList", promoList);
        model.addAttribute("categoryList", categoryList);
        return "index";
    }
    @GetMapping("/register")
    public String register(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }


    @PostMapping("/register")
    public String addUser(@ModelAttribute("user")@Valid User user, BindingResult bindingResult){
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String encodePassword = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        if(bindingResult.hasErrors()){
            return "register";
        }
        userService.addUser(user);
        return "redirect:/login";
    }
    @GetMapping("/login")
    public String loginForm(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "login";
    }
}
