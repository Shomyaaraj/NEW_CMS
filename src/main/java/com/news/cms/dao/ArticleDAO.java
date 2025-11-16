package com.news.cms.dao;

import com.news.cms.model.Article;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {

    public List<Article> getAllArticles() {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT a.*, u.username as author_name FROM articles a JOIN users u ON a.author_id = u.id ORDER BY a.created_at DESC";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Article article = new Article();
                article.setId(rs.getInt("id"));
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setCategory(rs.getString("category"));
                article.setAuthorId(rs.getInt("author_id"));
                article.setAuthorName(rs.getString("author_name"));
                article.setPublishDate(rs.getTimestamp("publish_date"));
                article.setStatus(rs.getString("status"));
                article.setCreatedAt(rs.getTimestamp("created_at"));
                article.setUpdatedAt(rs.getTimestamp("updated_at"));
                articles.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

    public Article getArticleById(int id) {
        String sql = "SELECT a.*, u.username as author_name FROM articles a JOIN users u ON a.author_id = u.id WHERE a.id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Article article = new Article();
                article.setId(rs.getInt("id"));
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setCategory(rs.getString("category"));
                article.setAuthorId(rs.getInt("author_id"));
                article.setAuthorName(rs.getString("author_name"));
                article.setPublishDate(rs.getTimestamp("publish_date"));
                article.setStatus(rs.getString("status"));
                article.setCreatedAt(rs.getTimestamp("created_at"));
                article.setUpdatedAt(rs.getTimestamp("updated_at"));
                return article;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void saveArticle(Article article) {
        String sql = "INSERT INTO articles (title, content, category, author_id, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setString(3, article.getCategory());
            stmt.setInt(4, article.getAuthorId());
            stmt.setString(5, article.getStatus());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateArticle(Article article) {
        String sql = "UPDATE articles SET title = ?, content = ?, category = ?, status = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setString(3, article.getCategory());
            stmt.setString(4, article.getStatus());
            stmt.setInt(5, article.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void publishArticle(int id) {
        String sql = "UPDATE articles SET status = 'PUBLISHED', publish_date = CURRENT_TIMESTAMP WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteArticle(int id) {
        String sql = "DELETE FROM articles WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
