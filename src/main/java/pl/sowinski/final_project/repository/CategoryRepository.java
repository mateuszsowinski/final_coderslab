package pl.sowinski.final_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import pl.sowinski.final_project.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
