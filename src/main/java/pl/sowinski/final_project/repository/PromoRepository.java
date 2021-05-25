package pl.sowinski.final_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.sowinski.final_project.model.Promo;

public interface PromoRepository extends JpaRepository<Promo, Long> {
}
