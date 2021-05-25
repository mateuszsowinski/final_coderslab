package pl.sowinski.final_project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

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
    private List<Product> product_item;
    private int quantity;
    @Lob
    private String description;
    @ManyToOne
    private Product product;
}
