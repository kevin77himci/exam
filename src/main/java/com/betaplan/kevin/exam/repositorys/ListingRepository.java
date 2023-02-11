package com.betaplan.kevin.exam.repositorys;

import com.betaplan.kevin.exam.models.Listing;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ListingRepository extends CrudRepository<Listing,Long> {
    List<Listing> findAll();
}
