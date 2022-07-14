package com.bookdb.bookdb.user.view;


import com.bookdb.bookdb.ejb.books.author.entity.Author;
import com.bookdb.bookdb.ejb.books.author.service.AuthorServiceLocal;
import com.bookdb.bookdb.ejb.books.bookimg.entity.BookImg;
import com.bookdb.bookdb.ejb.books.bookimg.service.BookImgServiceLocal;
import com.bookdb.bookdb.ejb.books.entity.Book;
import com.bookdb.bookdb.ejb.books.genre.entity.Genre;
import com.bookdb.bookdb.ejb.books.genre.service.GenreServiceLocal;
import com.bookdb.bookdb.ejb.books.publisher.entity.Publisher;
import com.bookdb.bookdb.ejb.books.publisher.service.PublisherServiceLocal;
import com.bookdb.bookdb.ejb.books.service.BookServiceLocal;
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

@WebServlet(name = "BookServlet", value = "/BookServlet")
public class BookServlet extends HttpServlet {

    @Inject
    BookServiceLocal bookServiceLocal;
    @Inject
    GenreServiceLocal genreServiceLocal;
    @Inject
    AuthorServiceLocal authorServiceLocal;
    @Inject
    BookImgServiceLocal bookImgServiceLocal;
    @Inject
    PublisherServiceLocal publisherServiceLocal;




    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Book> books = bookServiceLocal.findAll();
            request.setAttribute("booklist", books);

            String privilegeName = Session.USER.getFromSession(request).getPrivilegeId().getPrivilegeName();

            if(privilegeName.equalsIgnoreCase("admin")){

                List<Genre> genres = genreServiceLocal.findAll();
                request.setAttribute("genrelist", genres);
                String noteToFind = request.getParameter("findgenre");
                Genre genre = genreServiceLocal.findByGenreName(noteToFind);
                request.setAttribute("findedgenre",genre);


                List<Author> authors = authorServiceLocal.findAll();
                request.setAttribute("authorlist",authors);
                String authorToFind = request.getParameter("findauthor");
                Author author = authorServiceLocal.findByName(authorToFind);
                request.setAttribute("findedauthor", author);

                List<BookImg> bookImgs = bookImgServiceLocal.findAll();
                request.setAttribute("bookimglist", bookImgs);

                List<Publisher> publishers = publisherServiceLocal.findAll();
                request.setAttribute("publisherlist",publishers);
                String publisherToFind = request.getParameter("findpublisher");
                Publisher publisher = publisherServiceLocal.findByName(publisherToFind);
                request.setAttribute("findedpublisher",publisher);



                RequestDispatcher toView = request.getRequestDispatcher(Paths.ADMINBOOKS);
                toView.forward(request,response);
            }
            else {
                RequestDispatcher toView = request.getRequestDispatcher(Paths.USERBOOK);
                toView.forward(request, response);
            }
        } catch (ServletException | IOException e) {
            Logger.getLogger("BOOKS SERVLET").log(Level.INFO, e.getMessage());

        }

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
}
