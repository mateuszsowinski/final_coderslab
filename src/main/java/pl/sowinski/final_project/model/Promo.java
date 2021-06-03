package pl.sowinski.final_project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "promo")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Promo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Pole nie może być puste")
    private String name;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Set<Product> product_item = new HashSet<>();
    private int quantity;
    @Column(length = 1000)
    @Size(max = 1000, message = "Maksymalnie 1000 znaków")
    @NotBlank(message = "Pole nie może być puste")
    private String description;
    @NotBlank(message = "Pole nie może być puste")
    @Size(max = 255, message = "Maksymalnie 255 znaków")
    private String shortDescription;
    @Column(precision = 10, scale = 2)
    private BigDecimal price;
    private int points;

    @Override
    public String toString() {
        return "Promo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", product_item=" + product_item +
                ", quantity=" + quantity +
                ", description='" + description + '\'' +
                ", shortDescription='" + shortDescription + '\'' +
                ", price=" + price +
                ", points=" + points +
                '}';
    }
}
