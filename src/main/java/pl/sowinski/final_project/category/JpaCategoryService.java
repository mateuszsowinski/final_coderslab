package pl.sowinski.final_project.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Category;
import pl.sowinski.final_project.repository.CategoryRepository;

import java.util.List;
import java.util.Optional;

@Service
public class JpaCategoryService implements CategoryService {
    @Autowired
    public final CategoryRepository categoryRepository;

    public JpaCategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public Category add(Category addCategory) {
        return categoryRepository.save(addCategory);
    }

    @Override
    public Optional<Category> getCategoryById(Long id) {
        return categoryRepository.findById(id);
    }

    @Override
    public List<Category> getCategory() {
        return categoryRepository.findAll();
    }

    @Override
    public void update(Category categoryUpdate) {
        categoryRepository.save(categoryUpdate);

    }

    @Override
    public void delete(Long id) {
        categoryRepository.deleteById(id);
    }
}
