package com.news.cms.action;

import com.news.cms.dao.UserDAO;
import com.news.cms.model.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

public class LoginAction extends ActionSupport {
    private String username;
    private String password;

    public String execute() {
        System.out.println("LoginAction.execute() called with username: " + username);
        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.authenticate(username, password);
            if (user != null) {
                System.out.println("Login successful for user: " + user.getUsername() + " with role: " + user.getRole());
                HttpSession session = ServletActionContext.getRequest().getSession();
                session.setAttribute("user", user);
                return SUCCESS;
            } else {
                System.out.println("Login failed: Invalid credentials");
                addActionError("Invalid username or password");
                return INPUT;
            }
        } catch (Exception e) {
            System.err.println("Exception in LoginAction.execute(): " + e.getMessage());
            e.printStackTrace();
            addActionError("System error occurred");
            return INPUT;
        }
    }

    public String logout() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.invalidate();
        return SUCCESS;
    }

    public String input() {
        return SUCCESS;
    }

    // Getters and Setters
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
