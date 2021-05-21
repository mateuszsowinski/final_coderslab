package pl.sowinski.final_project.category;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Category;

import java.util.List;
import java.util.Optional;

@Service
public interface CategoryService {

    Category add(Category addCategory);

    Optional<Category> getCategoryById(Long id);

    List<Category> getCategory();

    void update (Category categoryUpdate);
    void delete (Long id);
}
