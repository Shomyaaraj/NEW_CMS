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
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom sticky-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="<s:url action='articleList'/>">
                <span class="fs-4">📰</span> News CMS
            </a>
            <button class="navbar-toggler border-0 text-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <i class="bi bi-list fs-2"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav me-auto ms-lg-4">
                    <a class="nav-link active" href="<s:url action='articleList'/>">
                        <i class="bi bi-grid me-1"></i> Dashboard
                    </a>
                    <a class="nav-link" href="<s:url action='articleCreate'/>">
                        <i class="bi bi-plus-circle me-1"></i> New Article
                    </a>
                </div>
                <div class="navbar-nav align-items-center gap-2">
                    <span class="nav-link text-light me-2">
                        <i class="bi bi-person-circle me-1 text-primary"></i>
                        <s:property value="#session.user.username"/> 
                        <span class="badge badge-published ms-1"><s:property value="#session.user.role"/></span>
                    </span>
                    <a class="btn btn-danger-custom btn-sm" href="<s:url action='logout'/>">
                        <i class="bi bi-box-arrow-right me-1"></i> Logout
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <section class="page-hero py-4">
        <div class="container">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                <div>
                    <h1 class="display-6 fw-extrabold mb-1">Newsroom Dashboard</h1>
                    <p class="text-secondary mb-0">Manage your editorial workflow, content creation, and publishing operations.</p>
                </div>
                <div>
                    <a href="<s:url action='articleCreate'/>" class="btn btn-gradient-primary">
                        <i class="bi bi-plus-lg me-2"></i>Create New Article
                    </a>
                </div>
            </div>
        </div>
    </section>

    <div class="container mb-5">
        <!-- KPI Metrics Grid -->
        <div class="row g-4 mb-5">
            <div class="col-md-3">
                <div class="glass-card glass-card-interactive p-4 text-center">
                    <div class="mb-2 text-primary fs-1">
                        <i class="bi bi-file-earmark-richtext"></i>
                    </div>
                    <h6 class="text-secondary small text-uppercase mono-font mb-1">All Articles</h6>
                    <a href="<s:url action='articleList'/>" class="btn btn-outline-custom btn-sm mt-3 w-100">
                        View Articles
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="glass-card glass-card-interactive p-4 text-center">
                    <div class="mb-2 text-warning fs-1">
                        <i class="bi bi-pencil-square"></i>
                    </div>
                    <h6 class="text-secondary small text-uppercase mono-font mb-1">New Draft</h6>
                    <a href="<s:url action='articleCreate'/>" class="btn btn-outline-custom btn-sm mt-3 w-100">
                        Start Draft
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="glass-card glass-card-interactive p-4 text-center">
                    <div class="mb-2 text-info fs-1">
                        <i class="bi bi-clock-history"></i>
                    </div>
                    <h6 class="text-secondary small text-uppercase mono-font mb-1">Review Submissions</h6>
                    <a href="<s:url action='articleList'/>" class="btn btn-outline-custom btn-sm mt-3 w-100">
                        Review Feed
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="glass-card glass-card-interactive p-4 text-center">
                    <div class="mb-2 text-success fs-1">
                        <i class="bi bi-check2-circle"></i>
                    </div>
                    <h6 class="text-secondary small text-uppercase mono-font mb-1">Published Content</h6>
                    <a href="<s:url action='articleList'/>" class="btn btn-outline-custom btn-sm mt-3 w-100">
                        Published Feed
                    </a>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-lg-8">
                <div class="glass-card p-4 h-100">
                    <h4 class="mb-3 d-flex align-items-center gap-2">
                        <i class="bi bi-lightning-charge text-warning"></i> Quick Editorial Actions
                    </h4>
                    <p class="text-secondary mb-4">Manage article lifecycles, publish pending reviews, or write new content.</p>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="p-3 border border-secondary border-opacity-25 rounded-3 bg-dark">
                                <h6 class="text-light mb-2"><i class="bi bi-pen me-2 text-primary"></i>Write Article</h6>
                                <p class="text-secondary small mb-3">Compose articles and assign category tags.</p>
                                <a href="<s:url action='articleCreate'/>" class="btn btn-gradient-primary btn-sm">Create Article</a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 border border-secondary border-opacity-25 rounded-3 bg-dark">
                                <h6 class="text-light mb-2"><i class="bi bi-card-checklist me-2 text-info"></i>Manage Feed</h6>
                                <p class="text-secondary small mb-3">Edit, review, or delete existing articles.</p>
                                <a href="<s:url action='articleList'/>" class="btn btn-outline-custom btn-sm">Go to Feed</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="glass-card p-4 h-100">
                    <h4 class="mb-3 d-flex align-items-center gap-2">
                        <i class="bi bi-person-badge text-primary"></i> Session Info
                    </h4>
                    <div class="p-3 border border-secondary border-opacity-25 rounded-3 bg-dark mb-3">
                        <span class="text-secondary small d-block">Username</span>
                        <span class="fs-5 fw-bold text-light"><s:property value="#session.user.username"/></span>
                    </div>
                    <div class="p-3 border border-secondary border-opacity-25 rounded-3 bg-dark">
                        <span class="text-secondary small d-block mb-1">Role & Privileges</span>
                        <s:if test="#session.user.role == 'ADMIN'">
                            <span class="badge badge-published fs-6">ADMIN (Full Access)</span>
                        </s:if>
                        <s:elseif test="#session.user.role == 'EDITOR'">
                            <span class="badge badge-review fs-6">EDITOR (Review & Publish)</span>
                        </s:elseif>
                        <s:else>
                            <span class="badge badge-draft fs-6">AUTHOR (Writer)</span>
                        </s:else>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
