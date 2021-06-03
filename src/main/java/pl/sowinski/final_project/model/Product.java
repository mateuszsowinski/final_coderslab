package pl.sowinski.final_project.model;

import lombok.*;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.math.BigDecimal;

@Entity
@Table(name = "product")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Pole nie może być puste")
    private String name;
    @Column(precision = 10, scale = 2)
    private BigDecimal price;
    @NotBlank(message = "Pole nie może być puste")
    @Column(length = 1000)
    @Size(max = 1000, message = "Maksymalnie 1000 znaków")
    private String description;
    @NotBlank(message = "Pole nie może być puste")
    @URL
    private String url;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;


    @Override
    public String toString() {
        return name + '\'';
    }
}
