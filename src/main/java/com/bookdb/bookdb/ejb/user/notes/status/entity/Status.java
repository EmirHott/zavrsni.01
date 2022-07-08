package com.bookdb.bookdb.ejb.user.notes.status.entity;

import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "status")
@NamedQueries({
        @NamedQuery(name = "Status.findAll", query = "SELECT s FROM Status s"),
        @NamedQuery(name = "Status.findById", query = "SELECT s FROM Status s WHERE s.statusId = :statusId"),
        @NamedQuery(name = "Status.findByStatus", query = "SELECT s FROM Status s WHERE s.status = :status")
})
public class Status implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "status_id")
    private Integer statusId;
    @Basic(optional = false)
    @Size(max = 50)
    @Column(name = "status")
    private String status;
    @OneToMany(mappedBy = "statusId")
    private List<Note> noteList;

    public Status() {
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Note> getNoteList() {
        return noteList;
    }

    public void setNoteList(List<Note> noteList) {
        this.noteList = noteList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Status status = (Status) o;
        return Objects.equals(statusId, status.statusId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(statusId);
    }

    @Override
    public String toString() {
        return "Status{" +
                "statusId=" + statusId +
                ", status='" + status + '\'' +
                '}';
    }
}
