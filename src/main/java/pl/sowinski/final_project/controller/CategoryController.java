package pl.sowinski.final_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.sowinski.final_project.category.CategoryService;
import pl.sowinski.final_project.model.Category;

import javax.validation.Valid;
@Controller
public class CategoryController {

    @GetMapping("/app/category")
    public String category(Model model){
        Category category = new Category();
        model.addAttribute("category", category);
        return "categoryForm";
    }
//    @PostMapping("/app/category")
//    public String addCategory(@ModelAttribute("category")@Valid Category category, BindingResult bindingResult){
//        if(bindingResult.hasErrors()){
//            return "categoryForm";
//        }
//        categoryService.add(category);
//        return "redirect:/app/category/list";
//    }

}
