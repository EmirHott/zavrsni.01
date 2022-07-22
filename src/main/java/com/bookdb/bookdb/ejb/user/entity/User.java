package com.bookdb.bookdb.ejb.user.entity;


import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import com.bookdb.bookdb.ejb.user.privilege.entity.Privilege;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "user")
@NamedQueries({
        @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
        @NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username=:username"),
        @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.userId=:userId"),
        @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.userEmail = :userEmail"),
        @NamedQuery(name = "User.findLast", query = "SELECT u FROM User u ORDER BY u.userId DESC ")
})
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_id")
    private Integer userId;
    @Column(name = "user_username")
    @Basic (optional = false)
    @Size(max = 50 )
    private String username;
    @Column (name = "user_email")
    @Basic(optional = false)
    @Size(max = 50)
    private String userEmail;
    @Column(name = "user_password")
    @Basic(optional = false)
    @Size(max = 250)
    private String userPassword;
    @JoinColumn(name = "privilege_id", referencedColumnName = "privilege_id")
    @ManyToOne(optional = false)
    private Privilege privilegeId;
    @OneToMany(mappedBy = "userId")
    private List<Note> noteList;

    public User() {
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Privilege getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(Privilege privilegeId) {
        this.privilegeId = privilegeId;
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
        User user = (User) o;
        return Objects.equals(userId, user.userId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId);
    }


    @Override
    public String toString() {
        return username ;
    }
}


