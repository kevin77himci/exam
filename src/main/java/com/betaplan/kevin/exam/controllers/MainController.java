package com.betaplan.kevin.exam.controllers;

import com.betaplan.kevin.exam.models.Listing;
import com.betaplan.kevin.exam.models.LoginUser;
import com.betaplan.kevin.exam.models.Note;
import com.betaplan.kevin.exam.models.User;
import com.betaplan.kevin.exam.services.ListingService;
import com.betaplan.kevin.exam.services.NoteService;
import com.betaplan.kevin.exam.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private ListingService listingService;

    @Autowired
    private NoteService noteService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index";
    }
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
                           HttpSession session) {
        userService.register(newUser, result);

        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index";
        } else {
            session.setAttribute("loggedInUserId", newUser.getId());
            return "redirect:/home";
        }
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
                        HttpSession session) {
        User user = userService.login(newLogin, result);

        if (result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index";
        } else {
            session.setAttribute("loggedInUserId", user.getId());
            return "redirect:/home";
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/home")
    public String dashboard(Model model, HttpSession session) {
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
            return "redirect:/";
        }
        model.addAttribute("user", userService.findOneUser(loggedInUserId));
        model.addAttribute("listings", listingService.allListings());
        //average rating*
        return "dashboard";
    }
    @PostMapping("/home")
    public String dashboard(BindingResult result) {
        if (result.hasErrors()) {
            return "/home";
        }
        return "/home/add";
    }
    @GetMapping("/listing/new")
    public String addListing(@ModelAttribute("listing") Listing listing) {
        return "new_Listing";
    }
    @PostMapping("/listing/new")
    public String addListing(@Valid @ModelAttribute("listing") Listing listing, BindingResult result,
                          HttpSession session) {
        if (result.hasErrors()) {
            return "new_Listing";
        } else {
            User user = userService.findOneUser((Long) session.getAttribute("loggedInUserId"));
            listing.setCreator(user);
            listingService.addListing(listing);
            return "redirect:/home";
        }
    }
    @GetMapping("/listing/{id}")
    public String ListingDetails(@PathVariable("id") Long id, @ModelAttribute("note") Note note, Model model){
        model.addAttribute("listing", listingService.findListing(id));
        List<Note> notes = noteService.showNotes(id);
        model.addAttribute("notes", notes);
        return "listing_Details";
    }
    @PostMapping("/listing/{id}")
    public String addNote(@PathVariable("id") Long id, @Valid @ModelAttribute("note") Note note,
                          BindingResult result, Model model, HttpSession session){
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        Listing listing = listingService.findListing(id);
        List<Note> notes = noteService.showNotes(id);

        if(result.hasErrors()){
            model.addAttribute("listing", listingService.findListing(id));
            model.addAttribute("users", userService.allUsers());
            model.addAttribute("notes", noteService.showNotes(id));
            return "redirect:/home";
        }
        else {
            model.addAttribute("notes", notes);

            Note newNote = new Note(note.getNotes());
            newNote.setUser(userService.findOneUser(loggedInUserId));
            newNote.setListing(listing);
            newNote.setNotes(note.getNotes());
            noteService.addNote(newNote);

            return "redirect:/listing/{id}";
        }
    }
    @GetMapping("/listing/{id}/edit")
    public String editListing(@PathVariable("id") Long id, Model model){
        Listing listing = listingService.findListing(id);
        model.addAttribute("listing", listing);

        return "edit";
    }
    @PutMapping("/listing/{id}/edit")
    public String editListingg(@Valid @ModelAttribute("listing") Listing listing, BindingResult result,
                           HttpSession session){
        if(result.hasErrors()){
            return "edit";
        }
        else {
            User user = userService.findOneUser((Long)session.getAttribute("loggedInUserId"));
            listing.setCreator(user);
            listingService.updateListing(listing);
            return "redirect:/listing/" + listing.getId();
        }
    }

    @GetMapping( "/listing/{id}/delete" )
    public String delete( @PathVariable( "id" ) Long id ) {

        listingService.deleteListing( id );

        return "redirect:/home";
    }


}
