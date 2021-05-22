package pl.sowinski.final_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.sowinski.final_project.category.JpaCategoryService;
import pl.sowinski.final_project.model.Category;
import pl.sowinski.final_project.model.Product;
import pl.sowinski.final_project.product.ProductService;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;

@Controller
@RequestMapping("/app/product")
public class ProductController {

    public final ProductService productService;
    public final JpaCategoryService jpaCategoryService;

    public ProductController(ProductService productService, JpaCategoryService jpaCategoryService) {
        this.productService = productService;
        this.jpaCategoryService = jpaCategoryService;
    }

    @GetMapping("")
    public String product(Model model){
        Product product = new Product();
        model.addAttribute("product", product);
        return "productForm";
    }
    @PostMapping("")
    public  String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "publicForm";
        }
        productService.add(product);
        return "redirect:/app/category/list";
    }
    @GetMapping("/list")
    public String listProduct(Model model){
        List<Product> productList = productService.getProduct();
        model.addAttribute("products", productList);
        return "productList";
    }
    @GetMapping("/delete/{id:\\d+}")
    public String deleteProduct(@PathVariable Long id){
        productService.delete(id);
        return "redirect:/app/product/list";
    }


    @ModelAttribute("categoryModel")
    public Collection<Category> categories(){
        return jpaCategoryService.getCategory();
    }

}

//    //Delete
//    @GetMapping(value = "/delete/{id:\\d+}")
//    public String deleteBook(@PathVariable Long id) {
//        bookService.deleteBook(id);
//        return "redirect:/admin/books/all";
//    }

//    //Update
//    //show form
//    @GetMapping(value = "/update/{id:\\d+}")
//    public String updateBookForm(@PathVariable Long id, Model model) {
//        model.addAttribute("books", bookService.getBookById(id));
//        return "bookForm";
//    }
//
//    //service
//    @PostMapping(value = "/update/{id:\\d+}")
//    public String updateBookPost(@ModelAttribute("books") @Valid Book book, BindingResult bindingResult) {
//        if (bindingResult.hasErrors()) {
//            return "bookForm";
//        }
//        bookService.updateBook(book);
//        return "redirect:/admin/books/all";
//    }