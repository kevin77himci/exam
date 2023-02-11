package com.betaplan.kevin.exam.repositorys;

import com.betaplan.kevin.exam.models.Note;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface NoteRepository extends CrudRepository<Note,Long> {
    List<Note> findAll();
    List<Note> findByListingIdIs(Long id);

}
