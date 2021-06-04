package pl.sowinski.final_project.user;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.sowinski.final_project.category.JpaCategoryService;
import pl.sowinski.final_project.model.*;
import pl.sowinski.final_project.product.JpaProductService;
import pl.sowinski.final_project.promo.JpaPromoService;
import pl.sowinski.final_project.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public String startingPage(Model model) {
        List<Promo> promoList = jpaPromoService.getPromo();
        List<Category> categoryList = jpaCategoryService.getCategory();
        List<Product> productList = jpaProductService.getProduct();
        model.addAttribute("productList", productList);
        model.addAttribute("promoList", promoList);
        model.addAttribute("categoryList", categoryList);
        return "index";
    }

    @GetMapping("/register")
    public String register(Model model) {
        User user = new User();

        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    public String addUser(@ModelAttribute("user") @Valid User user, BindingResult bindingResult) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String encodePassword = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        if (bindingResult.hasErrors()) {
            return "register";
        }
        userService.addUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginForm(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "login";
    }

    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }
}
