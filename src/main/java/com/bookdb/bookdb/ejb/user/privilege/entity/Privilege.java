package com.bookdb.bookdb.ejb.user.privilege.entity;


import com.bookdb.bookdb.ejb.user.entity.User;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "privilege")
@NamedQueries({
        @NamedQuery(name = "Privilege.findAll", query = "SELECT p FROM Privilege p"),
        @NamedQuery(name = "Privilege.findById", query = "SELECT p FROM Privilege p WHERE p.privilegeId = :privilegeId"),
        @NamedQuery(name = "Privilege.findByName", query = "SELECT p FROM Privilege p WHERE p.privilegeName = :privilegeName")
})
public class Privilege implements Serializable {

    public static final Integer USER_PRIVILEGE = 2;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "privilege_id")
    private Integer privilegeId;
    @Column(name = "privilege_name")
    @Basic(optional = false)
    @Size(max = 50)
    private String privilegeName;
    @OneToMany(mappedBy = "privilegeId")
    private List<User> userList;

    public Privilege() {
    }

    public Integer getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(Integer privilegeId) {
        this.privilegeId = privilegeId;
    }

    public String getPrivilegeName() {
        return privilegeName;
    }

    public void setPrivilegeName(String privilegeName) {
        this.privilegeName = privilegeName;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Privilege privilege = (Privilege) o;
        return Objects.equals(privilegeId, privilege.privilegeId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(privilegeId);
    }

    @Override
    public String toString() {
        return privilegeName;
    }
}


