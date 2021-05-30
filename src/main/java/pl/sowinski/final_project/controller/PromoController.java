package pl.sowinski.final_project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.sowinski.final_project.cart.JpaCartService;
import pl.sowinski.final_project.model.Cart;
import pl.sowinski.final_project.model.Product;
import pl.sowinski.final_project.model.Promo;
import pl.sowinski.final_project.product.JpaProductService;
import pl.sowinski.final_project.product.ProductService;
import pl.sowinski.final_project.promo.PromoService;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/app/promo")
public class PromoController {

    private final Logger logger = LoggerFactory.getLogger(PromoController.class);


    public final ProductService productService;
    public final PromoService promoService;
    public final JpaProductService jpaProductService;
    public final JpaCartService jpaCartService;

    public PromoController(ProductService productService, PromoService promoService, JpaProductService jpaProductService, JpaCartService jpaCartService) {
        this.productService = productService;
        this.promoService = promoService;
        this.jpaProductService = jpaProductService;
        this.jpaCartService = jpaCartService;
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
    public String showPromo (@PathVariable Long id, Model model){
        List<Product> productList = jpaProductService.getProduct();
        model.addAttribute("productList", productList);
        model.addAttribute("promo", promoService.getPromoById(id).orElseThrow(EntityNotFoundException::new));
        return "promoShow";
    }
    @GetMapping("/user/list")
    public String userList(Model model){
        List<Promo> promoList = promoService.getPromo();
        Cart cart = new Cart();
        model.addAttribute("cartAdd", cart);
        model.addAttribute("promoList", promoList);
        return "promoListUser";
    }
    @PostMapping("/user/list")
    public String userListForm(@ModelAttribute("cartAdd") Cart cart){
//        cart.setUser();
        jpaCartService.add(cart);
        return "redirect:/app/promo/user/list";
    }
}
