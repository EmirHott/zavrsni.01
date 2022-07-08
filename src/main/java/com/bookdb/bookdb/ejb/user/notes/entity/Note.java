package com.bookdb.bookdb.ejb.user.notes.entity;

import com.bookdb.bookdb.ejb.books.entity.Book;
import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.notes.status.entity.Status;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "notes")
@NamedQueries({
        @NamedQuery(name = "Notes.findAll", query = "SELECT n FROM Note n"),
        @NamedQuery(name = "Notes.findById", query = "SELECT n FROM Note n WHERE n.noteId = :noteId"),
        @NamedQuery(name = "Notes.findLast", query = "SELECT n FROM Note n ORDER BY n.noteId DESC ")
})
public class Note implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "note_id")
    private Integer noteId;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne
    private User userId;
    @JoinColumn(name = "book_id", referencedColumnName = "book_id")
    @ManyToOne
    private Book bookId;
    @Basic(optional = true)
    @Size(max = 250)
    @Column(name = "note_text")
    private String noteText;
    @JoinColumn(name = "status_id", referencedColumnName = "status_id")
    @ManyToOne
    private Status statusId;

    public Note() {
    }

    public Integer getNoteId() {
        return noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Book getBookId() {
        return bookId;
    }

    public void setBookId(Book bookId) {
        this.bookId = bookId;
    }

    public String getNoteText() {
        return noteText;
    }

    public void setNoteText(String noteText) {
        this.noteText = noteText;
    }

    public Status getStatusId() {
        return statusId;
    }

    public void setStatusId(Status statusId) {
        this.statusId = statusId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Note note = (Note) o;
        return Objects.equals(noteId, note.noteId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(noteId);
    }

    @Override
    public String toString() {
        return "Note{" +
                "noteId=" + noteId +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", noteText='" + noteText + '\'' +
                ", statusId=" + statusId +
                '}';
    }
}
