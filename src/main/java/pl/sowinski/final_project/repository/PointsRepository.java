package pl.sowinski.final_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.sowinski.final_project.model.Points;
import pl.sowinski.final_project.model.User;

public interface PointsRepository extends JpaRepository<Points, Long> {
    @Query(value = "SELECT SUM(points) FROM Points WHERE user_id = ?1",nativeQuery = true)
    Integer findByUserIdSumPoints(Long id);
}
