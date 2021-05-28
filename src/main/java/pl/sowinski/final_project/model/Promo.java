package pl.sowinski.final_project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
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
    private String name;
    @ManyToMany
    @JoinColumn(name = "product_id")
    private Set<Product> product_item = new HashSet<>();
    private int quantity;
    @Lob
    private String description;
    private BigDecimal price;

    @Override
    public String toString() {
        return "Promo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", product_item=" + product_item +
                ", quantity=" + quantity +
                ", description='" + description + '\'' +
                ", price=" + price +
                '}';
    }
}
