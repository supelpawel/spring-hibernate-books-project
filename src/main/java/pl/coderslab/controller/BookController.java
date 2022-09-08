package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Book;
import pl.coderslab.service.BookService;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/books")
public class BookController {

    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping(path = "/all")
    public String showBooks(Model model) {

        List<Book> books = bookService.findAll();
        model.addAttribute("books", books);

        return "book/all";
    }

    @GetMapping(path = "/add")
    public String showAddForm(Model model) {

        Book book = new Book();
        model.addAttribute("book", book);

        return "book/add";
    }

    @PostMapping(path = "/add")
    public String saveBook(@Valid Book book, BindingResult result) {

        if (result.hasErrors()) {
            return "book/add";
        }

        bookService.add(book);
        return "redirect:/books/all";
    }

    @GetMapping(path = "/edit/{id}")
    public String showEditForm(@PathVariable long id, Model model) {

        Optional<Book> bookToEdit = bookService.get(id);

        if (bookToEdit.isPresent()) {

            Book book = bookToEdit.get();
            model.addAttribute("book", book);
        }

        return "book/edit";
    }

    @PostMapping(path = "/edit")
    public String editBook(@Valid Book book, BindingResult result) {

        if (result.hasErrors()) {
            return "book/edit";
        }

        bookService.update(book);

        return "redirect:/books/all";
    }

    @GetMapping(path = "/delete/{id}")
    public String deleteBook(@PathVariable long id) {

        bookService.delete(id);

        return "redirect:/books/all";
    }

    @GetMapping(path = "/show/{id}")
    public String showBook(@PathVariable long id, Model model) {

        Optional<Book> bookToShow = Optional.ofNullable(bookService.get(id).orElseThrow(EntityNotFoundException::new));

        if (bookToShow.isPresent()) {

            Book book = bookToShow.get();
            model.addAttribute("book", book);
        }

        return "book/show";
    }
}
