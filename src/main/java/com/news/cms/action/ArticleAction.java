package com.news.cms.action;

import com.news.cms.dao.ArticleDAO;
import com.news.cms.model.Article;
import com.news.cms.model.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;

public class ArticleAction extends ActionSupport {
    private Article article;
    private List<Article> articles;
    private int id;

    public String list() {
        ArticleDAO articleDAO = new ArticleDAO();
        articles = articleDAO.getAllArticles();
        return SUCCESS;
    }

    public String create() {
        article = new Article();
        return SUCCESS;
    }

    public String edit() {
        ArticleDAO articleDAO = new ArticleDAO();
        article = articleDAO.getArticleById(id);
        if (article == null) {
            addActionError("Article not found");
            return ERROR;
        }
        return SUCCESS;
    }

    public String save() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return LOGIN;
        }

        ArticleDAO articleDAO = new ArticleDAO();
        if (article.getId() == 0) {
            // New article
            article.setAuthorId(user.getId());
            article.setStatus("DRAFT");
            articleDAO.saveArticle(article);
        } else {
            // Update existing
            Article existing = articleDAO.getArticleById(article.getId());
            if (existing != null && (existing.getAuthorId() == user.getId() || "ADMIN".equals(user.getRole()) || "EDITOR".equals(user.getRole()))) {
                articleDAO.updateArticle(article);
            } else {
                addActionError("You don't have permission to edit this article");
                return ERROR;
            }
        }
        return SUCCESS;
    }

    public String publish() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return LOGIN;
        }

        if (!"ADMIN".equals(user.getRole()) && !"EDITOR".equals(user.getRole())) {
            addActionError("You don't have permission to publish articles");
            return ERROR;
        }

        ArticleDAO articleDAO = new ArticleDAO();
        Article existing = articleDAO.getArticleById(id);
        if (existing != null && "REVIEW".equals(existing.getStatus())) {
            articleDAO.publishArticle(id);
        } else {
            addActionError("Article not found or not in review status");
            return ERROR;
        }
        return SUCCESS;
    }

    // Getters and Setters
    public Article getArticle() { return article; }
    public void setArticle(Article article) { this.article = article; }

    public List<Article> getArticles() { return articles; }
    public void setArticles(List<Article> articles) { this.articles = articles; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
}
