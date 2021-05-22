package pl.sowinski.final_project.product;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Product;
import pl.sowinski.final_project.repository.ProductRepository;

import java.util.List;
import java.util.Optional;
@Service
public class JpaProductService implements ProductService {

    private final ProductRepository productRepository;

    public JpaProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public Product add(Product addProduct) {
        return productRepository.save(addProduct);
    }

    @Override
    public Optional<Product> getProductById(Long id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> getProduct() {
        return productRepository.findAll();
    }

    @Override
    public void update(Product productUpdate) {
        productRepository.save(productUpdate);

    }

    @Override
    public void delete(Long id) {
        productRepository.deleteById(id);
    }
}
