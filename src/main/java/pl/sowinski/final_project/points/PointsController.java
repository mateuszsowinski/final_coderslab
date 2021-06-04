package pl.sowinski.final_project.points;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.sowinski.final_project.model.User;
import pl.sowinski.final_project.user.JpaUserService;

@Controller
public class PointsController {
    public final JpaUserService jpaUserService;
    public final JpaPointsService jpaPointsService;

    public PointsController(JpaUserService jpaUserService, JpaPointsService jpaPointsService) {
        this.jpaUserService = jpaUserService;
        this.jpaPointsService = jpaPointsService;
    }

    @GetMapping("/app/points")
    public String showPoints(Model model, @AuthenticationPrincipal UserDetails userDetails) {
        String userName = userDetails.getUsername();
        User user = jpaUserService.findByUserName(userName);
        int points = jpaPointsService.showByUser(user.getId());
        model.addAttribute("points", points);
        model.addAttribute("user", user);
        return "points";
    }
}
