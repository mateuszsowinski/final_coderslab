package pl.sowinski.final_project.points;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Points;
import pl.sowinski.final_project.model.Product;

import java.awt.*;
import java.util.List;
import java.util.Optional;

@Service
public interface PointsService {
    Points add(Points addPoints);

    List<Points> getPoints();
}
