package pl.sowinski.final_project.points;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Points;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.repository.PointsRepository;

import java.awt.*;
import java.util.List;
@Service
public class JpaPointsService implements PointsService {
    public final PointsRepository pointsRepository;

    public JpaPointsService(PointsRepository pointsRepository) {
        this.pointsRepository = pointsRepository;
    }

    @Override
    public Points add(Points addPoints) {
        return pointsRepository.save(addPoints);
    }

    @Override
    public List<Points> getPoints() {
        return null;
    }
    public Integer showByUser(Long id){
        return pointsRepository.findByUserIdSumPoints(id);
    }
}
