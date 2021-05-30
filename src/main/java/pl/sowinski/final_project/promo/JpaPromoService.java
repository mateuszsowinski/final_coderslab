package pl.sowinski.final_project.promo;

import org.springframework.stereotype.Service;
import pl.sowinski.final_project.model.Promo;
import pl.sowinski.final_project.repository.PromoRepository;

import java.util.List;
import java.util.Optional;

@Service
public class JpaPromoService implements PromoService {

    public final PromoRepository promoRepository;

    public JpaPromoService(PromoRepository promoRepository) {
        this.promoRepository = promoRepository;
    }

    @Override
    public Promo add(Promo addPromo) {
        return promoRepository.save(addPromo);
    }

    @Override
    public Optional<Promo> getPromoById(Long id) {
        return promoRepository.findById(id);
    }

    @Override
    public List<Promo> getPromo() {
        return promoRepository.findAll();
    }

    @Override
    public void update(Promo promoUpdate) {
        promoRepository.save(promoUpdate);
    }

    @Override
    public void delete(Long id) {
        promoRepository.deleteById(id);
    }
}
