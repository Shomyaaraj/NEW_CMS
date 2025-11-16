<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - News CMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .dashboard-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 0;
            margin-bottom: 30px;
        }
        .stat-card {
            border: none;
            border-radius: 15px;
            transition: transform 0.3s ease;
        }
        .stat-card:hover {
            transform: translateY(-5px);
        }
        .action-card {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border: none;
            border-radius: 15px;
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
                <div class="navbar-nav ms-auto">
                    <span class="navbar-text me-3">Welcome, <s:property value="#session.user.username"/> (<s:property value="#session.user.role"/>)</span>
                    <a class="nav-link" href="<s:url action='articleList'/>">Articles</a>
                    <a class="nav-link" href="<s:url action='logout'/>">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <section class="dashboard-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 fw-bold mb-3">Dashboard</h1>
                    <p class="lead mb-0">Manage your content efficiently with our powerful CMS</p>
                </div>
                <div class="col-md-4 text-end">
                    <a href="<s:url action='articleCreate'/>" class="btn btn-light btn-lg">
                        <i class="bi bi-plus-circle me-2"></i>Create Article
                    </a>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="row g-4 mb-5">
            <div class="col-md-3">
                <div class="card stat-card shadow">
                    <div class="card-body text-center">
                        <div class="mb-3">
                            <i class="bi bi-file-earmark-text display-4 text-primary"></i>
                        </div>
                        <h3 class="card-title">Articles</h3>
                        <p class="card-text">Manage your news articles</p>
                        <a href="<s:url action='articleList'/>" class="btn btn-primary">View All</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stat-card shadow">
                    <div class="card-body text-center">
                        <div class="mb-3">
                            <i class="bi bi-pencil-square display-4 text-success"></i>
                        </div>
                        <h3 class="card-title">Create</h3>
                        <p class="card-text">Write new articles</p>
                        <a href="<s:url action='articleCreate'/>" class="btn btn-success">Create New</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stat-card shadow">
                    <div class="card-body text-center">
                        <div class="mb-3">
                            <i class="bi bi-check-circle display-4 text-warning"></i>
                        </div>
                        <h3 class="card-title">Review</h3>
                        <p class="card-text">Articles pending review</p>
                        <a href="<s:url action='articleList'/>" class="btn btn-warning">Review</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stat-card shadow">
                    <div class="card-body text-center">
                        <div class="mb-3">
                            <i class="bi bi-globe display-4 text-info"></i>
                        </div>
                        <h3 class="card-title">Publish</h3>
                        <p class="card-text">Published content</p>
                        <a href="<s:url action='articleList'/>" class="btn btn-info">Published</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="card action-card text-white">
                    <div class="card-body">
                        <h4 class="card-title mb-3">Quick Actions</h4>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <h6><i class="bi bi-file-earmark-plus me-2"></i>Content Creation</h6>
                                <p class="mb-2">Create and edit articles with our rich editor</p>
                                <a href="<s:url action='articleCreate'/>" class="btn btn-light btn-sm">Start Writing</a>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="bi bi-list-check me-2"></i>Workflow Management</h6>
                                <p class="mb-2">Manage article lifecycles and publishing</p>
                                <a href="<s:url action='articleList'/>" class="btn btn-light btn-sm">Manage Articles</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Your Role</h5>
                    </div>
                    <div class="card-body">
                        <p class="mb-2"><strong>Role:</strong> <s:property value="#session.user.role"/></p>
                        <s:if test="#session.user.role == 'ADMIN'">
                            <div class="alert alert-success small">
                                <i class="bi bi-shield-check me-1"></i>Full system access
                            </div>
                        </s:if>
                        <s:elseif test="#session.user.role == 'EDITOR'">
                            <div class="alert alert-info small">
                                <i class="bi bi-pencil me-1"></i>Can publish and edit
                            </div>
                        </s:elseif>
                        <s:else>
                            <div class="alert alert-warning small">
                                <i class="bi bi-person me-1"></i>Author privileges
                            </div>
                        </s:else>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
