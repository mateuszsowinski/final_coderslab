package pl.sowinski.final_project.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.sowinski.final_project.category.JpaCategoryService;
import pl.sowinski.final_project.model.Category;
import pl.sowinski.final_project.model.Product;
import pl.sowinski.final_project.product.JpaProductService;
import pl.sowinski.final_project.product.ProductService;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;
import java.util.Collection;
import java.util.List;

@Controller
@RequestMapping("/app/product")
public class ProductController {

    public final ProductService productService;
    public final JpaCategoryService jpaCategoryService;
    public final JpaProductService jpaProductService;

    public ProductController(ProductService productService, JpaCategoryService jpaCategoryService, JpaProductService jpaProductService) {
        this.productService = productService;
        this.jpaCategoryService = jpaCategoryService;
        this.jpaProductService = jpaProductService;
    }

    @GetMapping("/add")
    public String product(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        return "productForm";
    }

    @PostMapping("/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "productForm";
        }
        productService.add(product);
        return "redirect:/app/product/list";
    }

    @GetMapping("/list")
    public String listProduct(Model model) {
        List<Product> productList = productService.getProduct();
        model.addAttribute("products", productList);
        return "productList";
    }

    @GetMapping("/delete/{id:\\d+}")
    public String deleteProduct(@PathVariable Long id) {
        productService.delete(id);
        return "redirect:/app/product/list";
    }

    @GetMapping("/update/{id:\\d+}")
    public String updateProductForm(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "productForm";
    }

    @PostMapping("/update/{id:\\d+}")
    public String updateProductPost(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "productForm";
        }
        productService.update(product);
        return "redirect:/app/product/list";
    }

    @GetMapping("/show/{id:\\d+}")
    public String showProduct(@PathVariable Long id, Model model) {
        List<Product> productList = jpaProductService.getProduct();
        model.addAttribute("productList", productList);
        model.addAttribute("product", productService.getProductById(id).orElseThrow(EntityNotFoundException::new));
        return "product";
    }

    @ModelAttribute("categoryModel")
    public Collection<Category> categories() {
        return jpaCategoryService.getCategory();
    }

}
