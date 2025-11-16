<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Articles - News CMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 0;
            margin-bottom: 30px;
        }
        .article-card {
            border: none;
            border-radius: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }
        .article-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .status-badge {
            font-size: 0.8em;
            padding: 4px 8px;
            border-radius: 12px;
        }
        .status-draft { background-color: #ffc107; color: #000; }
        .status-review { background-color: #17a2b8; color: #fff; }
        .status-published { background-color: #28a745; color: #fff; }
        .action-btn {
            margin-right: 5px;
            border-radius: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">📰 News CMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav me-auto">
                    <a class="nav-link active" href="<s:url action='articleList'/>">Articles</a>
                    <a class="nav-link" href="<s:url action='articleCreate'/>">Create Article</a>
                </div>
                <div class="navbar-nav">
                    <span class="navbar-text me-3">Welcome, <s:property value="#session.user.username"/></span>
                    <a class="nav-link" href="<s:url action='logout'/>">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <section class="page-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 fw-bold mb-3">Article Management</h1>
                    <p class="lead mb-0">Manage your news articles through the complete publishing workflow</p>
                </div>
                <div class="col-md-4 text-end">
                    <a href="<s:url action='articleCreate'/>" class="btn btn-light btn-lg">
                        <i class="bi bi-plus-circle me-2"></i>New Article
                    </a>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <s:if test="articles.size() == 0">
            <div class="text-center py-5">
                <i class="bi bi-file-earmark-x display-1 text-muted mb-3"></i>
                <h3 class="text-muted">No Articles Found</h3>
                <p class="text-muted">Start by creating your first article</p>
                <a href="<s:url action='articleCreate'/>" class="btn btn-primary">Create First Article</a>
            </div>
        </s:if>
        <s:else>
            <div class="row">
                <s:iterator value="articles">
                    <div class="col-md-6 col-lg-4">
                        <div class="card article-card h-100">
                            <div class="card-body d-flex flex-column">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <span class="status-badge status-<s:property value="status.toLowerCase()"/>">
                                        <s:property value="status"/>
                                    </span>
                                    <small class="text-muted">
                                        <s:date name="createdAt" format="MMM dd, yyyy"/>
                                    </small>
                                </div>

                                <h5 class="card-title mb-2">
                                    <s:if test="title.length() > 50">
                                        <s:property value="title.substring(0, 50)"/>...
                                    </s:if>
                                    <s:else>
                                        <s:property value="title"/>
                                    </s:else>
                                </h5>

                                <p class="card-text flex-grow-1">
                                    <s:if test="content.length() > 100">
                                        <s:property value="content.substring(0, 100)"/>...
                                    </s:if>
                                    <s:else>
                                        <s:property value="content"/>
                                    </s:else>
                                </p>

                                <div class="mt-3">
                                    <small class="text-muted d-block mb-2">
                                        <i class="bi bi-person me-1"></i><s:property value="authorName"/>
                                        <s:if test="category != null && category != ''">
                                            <span class="ms-2">
                                                <i class="bi bi-tag me-1"></i><s:property value="category"/>
                                            </span>
                                        </s:if>
                                    </small>

                                    <div class="btn-group w-100" role="group">
                                        <a href="<s:url action='articleEdit'><s:param name='id' value='id'/></s:url>"
                                           class="btn btn-outline-primary btn-sm action-btn">
                                            <i class="bi bi-pencil"></i> Edit
                                        </a>
                                        <s:if test="#session.user.role == 'ADMIN' || #session.user.role == 'EDITOR'">
                                            <s:if test="status == 'REVIEW'">
                                                <a href="<s:url action='articlePublish'><s:param name='id' value='id'/></s:url>"
                                                   class="btn btn-outline-success btn-sm action-btn">
                                                    <i class="bi bi-check-circle"></i> Publish
                                                </a>
                                            </s:if>
                                        </s:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </s:iterator>
            </div>
        </s:else>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
