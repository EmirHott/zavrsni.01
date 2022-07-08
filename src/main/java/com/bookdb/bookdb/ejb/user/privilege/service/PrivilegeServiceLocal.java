package com.bookdb.bookdb.ejb.user.privilege.service;

import com.bookdb.bookdb.ejb.user.privilege.entity.Privilege;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface PrivilegeServiceLocal {

    void create(Privilege privilege);

    void edit(Privilege privilege);

    void remove(Privilege privilege);

    Privilege find(Object id);

    List<Privilege> findAll();
}
