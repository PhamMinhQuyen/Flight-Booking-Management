/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.pr38_jv44_flight_booking.service;

import com.iviettech.pr38_jv44_flight_booking.entities.PromotionEntity;
import com.iviettech.pr38_jv44_flight_booking.repository.PromotionRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class PromotionService {
    
    @Autowired
    private PromotionRepository promotionRepository;
    
    public List<PromotionEntity> getPromotions(){
        return (List<PromotionEntity>) promotionRepository.findAll();
    }
    
  
    public void save(PromotionEntity promotionEntity) {
        promotionRepository.save(promotionEntity);
    }
    
    public PromotionEntity getPromotionById(int id) {
        Optional<PromotionEntity> optional = promotionRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new PromotionEntity();
    }
    
    public Page<PromotionEntity> getPromotionsPage(Pageable pageable) {
        return promotionRepository.findAll(pageable);
    }
}
