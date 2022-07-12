package com.bookdb.bookdb.ejb.books.entity;

import com.bookdb.bookdb.ejb.books.author.entity.Author;
import com.bookdb.bookdb.ejb.books.bookimg.entity.BookImg;
import com.bookdb.bookdb.ejb.books.genre.entity.Genre;
import com.bookdb.bookdb.ejb.books.publisher.entity.Publisher;
import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "books")
@NamedQueries({
        @NamedQuery(name = "Book.findAll", query = "SELECT b FROM  Book b"),
        @NamedQuery(name = "Book.findById", query = "SELECT b FROM Book b WHERE b.bookId = :bookId"),
        @NamedQuery(name = "Book.findByTitle", query = "SELECT b FROM Book b WHERE b.bookTitle = :bookTitle"),
        @NamedQuery(name = "Book.findByPageNumber", query = "SELECT b FROM Book b WHERE b.bookPages = :bookPages"),
        @NamedQuery(name = "Book.findByPublicationDate", query = "SELECT b FROM Book b WHERE b.bookPublicationDate= :bookPublicationDate"),
        @NamedQuery(name = "Book.findByRating", query = "SELECT b FROM Book b WHERE b.bookRating = :bookRating"),
        @NamedQuery(name = "Book.findLast", query = "SELECT b FROM Book b ORDER BY b.bookId DESC "),
        @NamedQuery(name = "Book.findContainInTitle", query = "SELECT b FROM Book b WHERE b.bookTitle LIKE CONCAT('%',:text,'%')")
})
public class Book implements Serializable{


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "book_id")
    private Integer bookId;
    @Basic(optional = false)
    @Size(max = 100)
    @Column(name = "book_title")
    private String bookTitle;
    @Basic(optional = false)
    @Column(name = "book_pagenumber")
    private Integer bookPages;
    @Basic(optional = false)
    @Column(name = "book_publication_date")
    private LocalDate bookPublicationDate;
    @Basic(optional = true)
    @Column(name = "book_rating")
    private BigDecimal bookRating;
    @JoinColumn(name = "publisher_id", referencedColumnName = "publisher_id")
    @ManyToOne
    private Publisher publisherId;
    @JoinColumn (name = "book_img_id", referencedColumnName = "books_img_id")
    @ManyToOne
    private BookImg bookImgId;

    @Basic(optional = true)
    @Size(max = 300)
    @Column(name = "book_info")
    private String bookInfo;
    @OneToMany(mappedBy = "bookId")
    private List<Note>noteList;
    @JoinTable (name = "book_genre", joinColumns = {
            @JoinColumn(name = "book_id", referencedColumnName = "book_id")},
            inverseJoinColumns = {
            @JoinColumn(name = "genre_id", referencedColumnName = "genre_id")
    })
    @ManyToMany(fetch=FetchType.EAGER)
    private List<Genre> genreList;
    @ManyToMany(mappedBy = "bookList",fetch=FetchType.EAGER)
    private List<Author> authorList;

    public Book() {
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public Integer getBookPages() {
        return bookPages;
    }

    public void setBookPages(Integer bookPages) {
        this.bookPages = bookPages;
    }

    public LocalDate getBookPublicationDate() {
        return bookPublicationDate;
    }

    public void setBookPublicationDate(LocalDate bookPublicationDate) {
        this.bookPublicationDate = bookPublicationDate;
    }

    public BigDecimal getBookRating() {
        return bookRating;
    }

    public void setBookRating(BigDecimal bookRating) {
        this.bookRating = bookRating;
    }

    public Publisher getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(Publisher publisherId) {
        this.publisherId = publisherId;
    }

    public BookImg getBookImgId() {
        return bookImgId;
    }

    public void setBookImgId(BookImg bookImgId) {
        this.bookImgId = bookImgId;
    }
    public List<Note> getNoteList() {
        return noteList;
    }

    public void setNoteList(List<Note> noteList) {
        this.noteList = noteList;
    }

    public List<Genre> getGenreList() {
        return genreList;
    }

    public void setGenreList(List<Genre> genreList) {
        this.genreList = genreList;
    }

    public List<Author> getAuthorList() {
        return authorList;
    }

    public void setAuthorList(List<Author> authorList) {
        this.authorList = authorList;
    }



    public String getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(String bookInfo) {
        this.bookInfo = bookInfo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Book book = (Book) o;
        return Objects.equals(bookId, book.bookId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bookId);
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookTitle='" + bookTitle + '\'' +
                ", bookPages=" + bookPages +
                ", bookPublicationDate=" + bookPublicationDate +
                ", bookRating=" + bookRating +
                ", publisherId=" + publisherId +
                ", bookImgId=" + bookImgId +
                ", bookInfo='" + bookInfo + '\'' +
                '}';
    }
}
