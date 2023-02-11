package com.betaplan.kevin.exam.services;

import com.betaplan.kevin.exam.models.Listing;
import com.betaplan.kevin.exam.repositorys.ListingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ListingService {
    @Autowired
    private ListingRepository listingRepo;

    public List<Listing> allListings() {
        return listingRepo.findAll();
    }
    public Listing findListing(Long id) {
        Optional<Listing> optionalShow = listingRepo.findById(id);
        if (optionalShow.isPresent()) {
            return optionalShow.get();
        } else {
            return null;
        }
    }
    public Listing addListing(Listing listing) {
        return listingRepo.save(listing);
    }
    public Listing updateListing(Listing listing) {
        return listingRepo.save(listing);
    }
    public void deleteListing(Long id) {
        Optional<Listing> optionalListing = listingRepo.findById(id);
        if (optionalListing.isPresent()) {
            listingRepo.deleteById(id);
        } else return;
    }

}
