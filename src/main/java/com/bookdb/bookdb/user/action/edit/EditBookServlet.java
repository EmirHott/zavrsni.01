package com.bookdb.bookdb.user.action.edit;

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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "EditBookServlet", value = "/EditBookServlet")
public class EditBookServlet extends HttpServlet {
    @Inject
    BookServiceLocal bookServiceLocal;
    @Inject
    BookImgServiceLocal bookImgServiceLocal;
    @Inject
    AuthorServiceLocal authorServiceLocal;
    @Inject
    PublisherServiceLocal publisherServiceLocal;
    @Inject
    GenreServiceLocal genreServiceLocal;


    private void processRequest (HttpServletRequest request, HttpServletResponse response){
        Integer bookPagesToEdit = Integer.parseInt(request.getParameter("bookpages"));

        BigDecimal bookRatingToEdit = BigDecimal.valueOf(Double.parseDouble(request.getParameter("bookrating")));

        LocalDate dateToEdit = LocalDate.parse(request.getParameter("bookdate"));

        Integer publisherId = Integer.parseInt(request.getParameter("bookpublisherid"));
        Publisher publisherToEdit = publisherServiceLocal.find(publisherId);

        Integer genreId = Integer.parseInt(request.getParameter("bookgenreid"));
        Genre genreListToEdit = genreServiceLocal.find(genreId);

        Integer bookImgId = Integer.parseInt(request.getParameter("bookimgid"));
        BookImg bookImgToEdit = bookImgServiceLocal.find(bookImgId);

        Integer authorId = Integer.parseInt(request.getParameter("bookauthorid"));
        Author authorToEdit = authorServiceLocal.find(authorId);

        Integer bookIdToEdit = Integer.parseInt(request.getParameter("bookid"));

        try{
            Book bookToEdit = bookServiceLocal.find(bookIdToEdit);
            bookToEdit.setBookTitle(request.getParameter("booktitle"));
            bookToEdit.setBookPages(bookPagesToEdit);
            bookToEdit.setBookRating(bookRatingToEdit);
            bookToEdit.setBookPublicationDate(dateToEdit);
            bookToEdit.setBookInfo(request.getParameter("bookinfo"));
            bookToEdit.setBookImgId(bookImgToEdit);
            bookToEdit.setAuthorList(Collections.singletonList(authorToEdit));
            bookToEdit.setPublisherId(publisherToEdit);
            bookToEdit.setGenreList(Collections.singletonList(genreListToEdit));
            bookServiceLocal.edit(bookToEdit);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request, response);
        }catch (ServletException | IOException e ){
            Logger.getLogger("EDIT BOOK SERVLET").log(Level.INFO,e.getMessage());
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
