package com.news.cms.model;

import java.sql.Timestamp;

public class Article {
    private int id;
    private String title;
    private String content;
    private String category;
    private int authorId;
    private String authorName; // For display
    private Timestamp publishDate;
    private String status;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Constructors
    public Article() {}

    public Article(String title, String content, String category, int authorId) {
        this.title = title;
        this.content = content;
        this.category = category;
        this.authorId = authorId;
        this.status = "DRAFT";
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public int getAuthorId() { return authorId; }
    public void setAuthorId(int authorId) { this.authorId = authorId; }

    public String getAuthorName() { return authorName; }
    public void setAuthorName(String authorName) { this.authorName = authorName; }

    public Timestamp getPublishDate() { return publishDate; }
    public void setPublishDate(Timestamp publishDate) { this.publishDate = publishDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}
