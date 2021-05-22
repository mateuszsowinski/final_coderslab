package pl.sowinski.final_project.controller;

import org.springframework.web.bind.annotation.GetMapping;
import pl.sowinski.final_project.product.ProductService;

public class ProductController {

    public final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }


}
