package pl.sowinski.final_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.user.UserService;

import javax.validation.Valid;

@Controller
public class UserController {

    @Autowired
    public final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("")
    public String startingPage(){
        return "index";
    }
    @GetMapping("/register")
    public String register(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }
    @GetMapping("/empty")
    public String emptyPage(){
        return "empty";
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
