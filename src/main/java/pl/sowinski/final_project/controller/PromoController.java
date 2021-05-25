package pl.sowinski.final_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.sowinski.final_project.model.Product;
import pl.sowinski.final_project.model.Promo;
import pl.sowinski.final_project.product.JpaProductService;
import pl.sowinski.final_project.promo.PromoService;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;

@Controller
@RequestMapping("/app/promo")
public class PromoController {

    public final PromoService promoService;
    public final JpaProductService jpaProductService;

    public PromoController(PromoService promoService, JpaProductService jpaProductService) {
        this.promoService = promoService;
        this.jpaProductService = jpaProductService;
    }

    @GetMapping("/add")
    public String promo(Model model){
        Promo promo = new Promo();
        model.addAttribute("promo", promo);
        return "promoForm";
    }
    @PostMapping("/add")
    public String addPromo(@ModelAttribute("promo")@Valid Promo promo, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "promoForm";
        }
        promoService.add(promo);
        return "redirect:/app/promo/list";
    }
    @GetMapping("/delete/{id:\\d+}")
    public String deletePromo(@PathVariable Long id){
        promoService.delete(id);
        return "redirect:/app/promo/list";
    }
    @ModelAttribute("productModel")
    public Collection<Product> products(){
        return jpaProductService.getProduct();
    }

}
