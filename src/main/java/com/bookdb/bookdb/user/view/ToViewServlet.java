package com.bookdb.bookdb.user.view;

import com.bookdb.bookdb.ejb.books.author.entity.Author;
import com.bookdb.bookdb.ejb.books.author.service.AuthorServiceLocal;
import com.bookdb.bookdb.ejb.books.entity.Book;
import com.bookdb.bookdb.ejb.books.genre.entity.Genre;
import com.bookdb.bookdb.ejb.books.genre.service.GenreServiceLocal;
import com.bookdb.bookdb.ejb.books.publisher.entity.Publisher;
import com.bookdb.bookdb.ejb.books.publisher.service.PublisherServiceLocal;
import com.bookdb.bookdb.ejb.books.service.BookServiceLocal;
import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import com.bookdb.bookdb.ejb.user.notes.service.NoteServiceLocal;
import com.bookdb.bookdb.ejb.user.service.UserServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import com.bookdb.bookdb.user.session.Session;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ToViewServlet", value = "/ToViewServlet")
public class ToViewServlet extends HttpServlet {
    @Inject
    private BookServiceLocal bookServiceLocal;
    @Inject
    private  UserServiceLocal userServiceLocal;
    @Inject
    private NoteServiceLocal noteServiceLocal;
    @Inject
    private AuthorServiceLocal authorServiceLocal;
    @Inject
    private GenreServiceLocal genreServiceLocal;
    @Inject
    private PublisherServiceLocal publisherServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {

        try {
            String privilegeName = Session.USER.getFromSession(request).getPrivilegeId().getPrivilegeName();
            Book book = bookServiceLocal.findLastId();
            request.setAttribute("lastbook", book);
            User user = userServiceLocal.findLastId();
            request.setAttribute("lastuser", user);
            Note note = noteServiceLocal.findLastId();
            request.setAttribute("lastnote", note);
            Author author = authorServiceLocal.findLastId();
            request.setAttribute("lastauthor",author);
            Genre genre = genreServiceLocal.findLastId();
            request.setAttribute("lastgenre",genre);
            Publisher publisher = publisherServiceLocal.findByLastId();
            request.setAttribute("lastpublisher", publisher);


            if (privilegeName.equalsIgnoreCase("admin")) {
                RequestDispatcher toView = request.getRequestDispatcher(Paths.ADMINVIEW);
                toView.forward(request, response);
            } else {
                List<Book> bookList = bookServiceLocal.findOnlyFour();
                request.setAttribute("booklist",bookList);
                RequestDispatcher toView = request.getRequestDispatcher(Paths.USERVIEW);
                toView.forward(request, response);

            }

        } catch (ServletException | IOException e) {
            Logger.getLogger("TOVIEW SERVLET").log(Level.INFO, e.getMessage());
        }
    }

    {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
