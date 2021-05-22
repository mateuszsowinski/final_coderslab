package pl.sowinski.final_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.sowinski.final_project.category.CategoryService;
import pl.sowinski.final_project.model.Category;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/app/category")
public class CategoryController {

    public final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("")
    public String category(Model model){
        Category category = new Category();
        model.addAttribute("category", category);
        return "categoryForm";
    }
    @PostMapping("")
    public String addCategory(@ModelAttribute("categoryModel")@Valid Category category, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "categoryForm";
        }
        categoryService.add(category);
        return "redirect:/app/category/list";
    }
    @GetMapping("/list")
    public String listCategory(Model model){
        List<Category> categoryList = categoryService.getCategory();
        model.addAttribute("categories", categoryList);
        return "categoryList";
    }

}
