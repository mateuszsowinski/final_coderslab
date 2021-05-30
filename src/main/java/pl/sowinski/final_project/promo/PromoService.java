package pl.sowinski.final_project.promo;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Promo;

import java.util.List;
import java.util.Optional;

@Service
public interface PromoService {
    Promo add(Promo addPromo);

    Optional<Promo> getPromoById(Long id);

    List<Promo> getPromo();

    void update(Promo promoUpdate);

    void delete(Long id);
}
