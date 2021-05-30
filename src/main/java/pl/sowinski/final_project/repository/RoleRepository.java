package pl.sowinski.final_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.sowinski.final_project.model.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
    Role findByName (String name);
}