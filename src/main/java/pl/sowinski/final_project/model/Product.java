package pl.sowinski.final_project.model;

import lombok.*;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
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
    private String name;
    @Column(precision=10, scale=2)
    private BigDecimal price;
    private String description;
    @URL
    private String url;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
}
