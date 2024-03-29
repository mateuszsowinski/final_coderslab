package pl.sowinski.final_project.promo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.sowinski.final_project.cart.JpaCartService;
import pl.sowinski.final_project.model.*;
import pl.sowinski.final_project.points.JpaPointsService;
import pl.sowinski.final_project.product.JpaProductService;
import pl.sowinski.final_project.product.ProductService;
import pl.sowinski.final_project.user.JpaUserService;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;
import java.awt.*;
import java.util.List;

@Controller
@RequestMapping("/app/promo")
public class PromoController {

    private final Logger logger = LoggerFactory.getLogger(PromoController.class);


    public final ProductService productService;
    public final PromoService promoService;
    public final JpaProductService jpaProductService;
    public final JpaCartService jpaCartService;
    public final JpaUserService jpaUserService;
    public final JpaPointsService jpaPointsService;


    public PromoController(ProductService productService, PromoService promoService, JpaProductService jpaProductService, JpaCartService jpaCartService, JpaUserService jpaUserService, JpaPointsService jpaPointsService) {
        this.productService = productService;
        this.promoService = promoService;
        this.jpaProductService = jpaProductService;
        this.jpaCartService = jpaCartService;
        this.jpaUserService = jpaUserService;
        this.jpaPointsService = jpaPointsService;
    }

    @GetMapping("/add")
    public String promo(Model model) {
        List<Product> productList = productService.getProduct();
        model.addAttribute("productList", productList);
        Promo promo = new Promo();
        model.addAttribute("promo", promo);
        return "promoForm";
    }

    @PostMapping("/add")
    public String addPromo(@ModelAttribute("promo") @Valid Promo promo, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            logger.error("Promo not added");
            return "promoForm";
        }
        promoService.add(promo);
        logger.info("Add promo");
        return "redirect:/app/promo/list";
    }

    @GetMapping("/delete/{id:\\d+}")
    public String deletePromo(@PathVariable Long id) {
        promoService.delete(id);
        logger.info("Delete promo id:" + id);
        return "redirect:/app/promo/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Promo> list = promoService.getPromo();
        model.addAttribute("promo", list);
        logger.info("Show list promo");
        return "promoList";
    }

    @GetMapping("/show/{id:\\d+}")
    public String showPromo(@PathVariable Long id, Model model) {
        List<Product> productList = jpaProductService.getProduct();
        Cart cart = new Cart();
        Points points = new Points();
        model.addAttribute("points",points);
        model.addAttribute("cartAdd", cart);
        model.addAttribute("productList", productList);
        model.addAttribute("promo", promoService.getPromoById(id).orElseThrow(EntityNotFoundException::new));
        return "promo";
    }
    @PostMapping("/show/{id:\\d+}")
    public String showPromoForm(@ModelAttribute("cartAdd") Cart cart, @ModelAttribute("points") Points points, @AuthenticationPrincipal UserDetails userDetails) {
        String userName = userDetails.getUsername();
        User user = jpaUserService.findByUserName(userName);
        cart.setUser(user);
        points.setUser(user);
        jpaCartService.add(cart);
        jpaPointsService.add(points);
        return "redirect:/app/promo/user/list";
    }

    @GetMapping("/user/list")
    public String userList(Model model) {
        List<Promo> promoList = promoService.getPromo();
        Cart cart = new Cart();
        model.addAttribute("cartAdd", cart);
        model.addAttribute("promoList", promoList);
        return "promoListUser";
    }

    @PostMapping("/user/list")
    public String userListForm(@ModelAttribute("cartAdd") Cart cart, @AuthenticationPrincipal UserDetails userDetails) {
        String userName = userDetails.getUsername();
        User user = jpaUserService.findByUserName(userName);
        cart.setUser(user);
        jpaCartService.add(cart);
        return "redirect:/app/promo/user/list";
    }
    @GetMapping("/update/{id:\\d+}")
    public String updatePromoForm(@PathVariable Long id, Model model) {
        model.addAttribute("promo", promoService.getPromoById(id));
        return "promoForm";
    }

    @PostMapping("/update/{id:\\d+}")
    public String updatePromoPost(@ModelAttribute("promo") @Valid Promo promo, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "promoForm";
        }
        promoService.update(promo);
        return "redirect:/app/promo/list";
    }

}
