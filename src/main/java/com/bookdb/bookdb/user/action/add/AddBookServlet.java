package com.bookdb.bookdb.user.action.add;

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
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AddBookServlet", value = "/AddBookServlet")
public class AddBookServlet extends HttpServlet {

    @Inject
    private BookServiceLocal bookServiceLocal;
    @Inject
    private BookImgServiceLocal bookImgServiceLocal;
    @Inject
    private AuthorServiceLocal authorServiceLocal;
    @Inject
    private PublisherServiceLocal publisherServiceLocal;
    @Inject
    private GenreServiceLocal genreServiceLocal;


    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        Integer bookPagesToAdd = Integer.parseInt(request.getParameter("bookpages"));

        BigDecimal bookRatingToAdd = BigDecimal.valueOf(Double.parseDouble(request.getParameter("bookrating")));

        LocalDate dateToAdd = LocalDate.parse(request.getParameter("bookdate"));

        Integer publisherId = Integer.parseInt(request.getParameter("bookpublisherid"));
        Publisher publisherToAdd = publisherServiceLocal.find(publisherId);

        Integer genreId = Integer.parseInt(request.getParameter("bookgenreid"));
        Genre genreListToAdd = genreServiceLocal.find(genreId);

        Integer bookImgId = Integer.parseInt(request.getParameter("bookimgid"));
        BookImg bookImgToAdd = bookImgServiceLocal.find(bookImgId);

        Integer authorId = Integer.parseInt(request.getParameter("bookauthorid"));
        Author authorToAdd = authorServiceLocal.find(authorId);

        try {


            Book bookToAdd = new Book();
            bookToAdd.setBookTitle(request.getParameter("booktitle"));
            bookToAdd.setBookPages(bookPagesToAdd);
            bookToAdd.setBookRating(bookRatingToAdd);
            bookToAdd.setBookPublicationDate(dateToAdd);
            bookToAdd.setBookInfo(request.getParameter("bookinfo"));
            bookToAdd.setBookImgId(bookImgToAdd);
            bookToAdd.setAuthorList(Collections.singletonList(authorToAdd));
            bookToAdd.setPublisherId(publisherToAdd);
            bookToAdd.setGenreList(Collections.singletonList(genreListToAdd));
            bookServiceLocal.create(bookToAdd);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request, response);


        } catch (ServletException | IOException e) {
            Logger.getLogger("ADD BOOK SERVLET").log(Level.INFO, e.getMessage());
        }


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
