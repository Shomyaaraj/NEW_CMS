<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lumina News CMS - Modern Editorial Content Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-glass sticky-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="#">
                <span class="fs-4">📰</span> Lumina <span class="badge bg-primary fs-6 font-monospace">CMS</span>
            </a>
            <button class="navbar-toggler border-0 text-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <i class="bi bi-list fs-2"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto align-items-center gap-2">
                    <s:if test="#session.user != null">
                        <span class="nav-link text-light me-2">
                            <i class="bi bi-person-circle me-1 text-primary"></i>
                            <s:property value="#session.user.username"/> 
                            <span class="badge badge-published ms-1"><s:property value="#session.user.role"/></span>
                        </span>
                        <a class="btn btn-outline-lumina btn-sm" href="<s:url action='articleList'/>">
                            <i class="bi bi-speedometer2 me-1"></i> Dashboard
                        </a>
                        <a class="btn btn-danger-lumina btn-sm" href="<s:url action='logout'/>">
                            <i class="bi bi-box-arrow-right me-1"></i> Logout
                        </a>
                    </s:if>
                    <s:else>
                        <a class="btn btn-primary-lumina" href="<s:url action='login' method='input'/>">
                            <i class="bi bi-box-arrow-in-right me-1"></i> Sign In
                        </a>
                    </s:else>
                </div>
            </div>
        </div>
    </nav>

    <section class="page-hero text-center py-5">
        <div class="container">
            <span class="badge badge-review mb-3 px-3 py-2 fs-6">
                <i class="bi bi-stars me-1"></i> Lumina Editorial Platform
            </span>
            <h1 class="display-3 fw-bold mb-3">Modern News Content Management</h1>
            <p class="lead text-secondary max-width-600 mx-auto mb-4" style="max-width: 680px;">
                Streamline editorial workflows with deep slate glassmorphism, instant article state tracking, and role-based editorial authorization.
            </p>
            <s:if test="#session.user == null">
                <a href="<s:url action='login' method='input'/>" class="btn btn-primary-lumina btn-lg px-4 py-3">
                    <i class="bi bi-rocket-takeoff me-2"></i> Get Started
                </a>
            </s:if>
            <s:else>
                <a href="<s:url action='articleList'/>" class="btn btn-primary-lumina btn-lg px-4 py-3">
                    <i class="bi bi-grid-1x2 me-2"></i> Go to Newsroom Dashboard
                </a>
            </s:else>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="glass-card glass-card-interactive p-4 h-100">
                        <div class="mb-3 text-primary fs-1">
                            <i class="bi bi-journal-richtext"></i>
                        </div>
                        <h4 class="card-title mb-2">Editorial Workflows</h4>
                        <p class="text-secondary mb-0">
                            Seamless article lifecycles with Draft, Review, and Published status transitions designed for fast-paced digital newsrooms.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="glass-card glass-card-interactive p-4 h-100">
                        <div class="mb-3 text-info fs-1">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <h4 class="card-title mb-2">Role Access Control</h4>
                        <p class="text-secondary mb-0">
                            Strict role enforcement across Admin, Editor, and Author positions to protect content integrity and publishing rights.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="glass-card glass-card-interactive p-4 h-100">
                        <div class="mb-3 text-warning fs-1">
                            <i class="bi bi-lightning-charge"></i>
                        </div>
                        <h4 class="card-title mb-2">Cloud Database Sync</h4>
                        <p class="text-secondary mb-0">
                            Powered by Neon Cloud PostgreSQL with JDBC connection pooling and automated schema initialization.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="py-4 mt-5">
        <div class="container text-center text-secondary">
            <p class="mb-0 small">&copy; 2026 Lumina News CMS. Redesigned with Stitch Lumina Editorial System.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
