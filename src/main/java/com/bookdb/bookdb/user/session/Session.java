package com.bookdb.bookdb.user.session;

import com.bookdb.bookdb.ejb.user.entity.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public enum Session {
    USER("SESSION_KEY");

    private String sessionKey;

    private Session(String sessionKey){
        this.sessionKey = sessionKey;
    }

    public String getSessionKey() {
        return sessionKey;
    }

    public void addToSession(User user, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute(sessionKey) == null) {
            session.setAttribute(sessionKey, user);
        }
    }
    public User getFromSession(HttpServletRequest request){
        HttpSession session = request.getSession();
        return (User) session.getAttribute(sessionKey);
    }
}
