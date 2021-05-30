package pl.sowinski.final_project.product;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Category;
import pl.sowinski.final_project.model.Product;

import java.util.List;
import java.util.Optional;

@Service
public interface ProductService {

    Product add(Product addProduct);

    Optional<Product> getProductById(Long id);

    List<Product> getProduct();

    void update(Product productUpdate);

    void delete(Long id);
}


