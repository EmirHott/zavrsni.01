package com.bookdb.bookdb.ejb.books.author.entity;

import com.bookdb.bookdb.ejb.books.entity.Book;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "authors")
@NamedQueries({
        @NamedQuery(name = "Author.findAll", query = "SELECT a FROM Author a"),
        @NamedQuery(name = "Author.findById", query = "SELECT a FROM Author a WHERE a.authorId = :authorId"),
        @NamedQuery(name = "Author.findByName", query = "SELECT a FROM Author a WHERE a.authorName = :authorName"),
        @NamedQuery(name = "Author.findBySurname", query = "SELECT a FROM Author a WHERE a.authorSurname = :authorSurname"),
        @NamedQuery(name = "Author.findLast", query = "SELECT a FROM Author a ORDER BY a.authorId DESC")
})
public class Author implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "author_id")
    private Integer authorId;
    @Basic(optional = false)
    @Size(max = 50)
    @Column(name = "author_name")
    private String authorName;
    @Basic(optional = false)
    @Size(max = 50)
    @Column(name = "author_surname")
    private String authorSurname;
    @JoinTable(name = "books_authors", joinColumns = {
            @JoinColumn(name = "author_id", referencedColumnName = "author_id")},
            inverseJoinColumns = {
            @JoinColumn(name = "book_id", referencedColumnName = "book_id")
    })
    @ManyToMany
    private List<Book>bookList;

    public Author() {
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorSurname() {
        return authorSurname;
    }

    public void setAuthorSurname(String authorSurname) {
        this.authorSurname = authorSurname;
    }

    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Author author = (Author) o;
        return Objects.equals(authorId, author.authorId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(authorId);
    }

    @Override
    public String toString() {
        return authorName +
                ""+
                authorSurname;

    }
}
