package com.betaplan.kevin.exam.services;

import com.betaplan.kevin.exam.models.Note;
import com.betaplan.kevin.exam.repositorys.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NoteService {
    @Autowired
    private NoteRepository noteRepo;

    public List<Note> allNotes(){
        return noteRepo.findAll();
    }
    public List<Note> showNotes(Long listingId){
        return noteRepo.findByListingIdIs(listingId);
    }
    public Note addNote(Note note) {
        return noteRepo.save(note);
    }
    public void deleteNote(Long id) {
        Optional<Note> optionalNote = noteRepo.findById(id);
        if (optionalNote.isPresent()) {
            noteRepo.deleteById(id);
        } else return;
    }

}
