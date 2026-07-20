<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Articles Feed - News CMS</title>
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
                        <i class="bi bi-grid me-1"></i> Articles Feed
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
                    <h1 class="display-6 fw-extrabold mb-1">Article Management</h1>
                    <p class="text-secondary mb-0">Browse, edit, review, publish, and manage all newsroom articles.</p>
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
        <s:if test="hasActionErrors()">
            <div class="alert alert-danger bg-danger bg-opacity-20 border-danger border-opacity-40 text-danger rounded-3 mb-4" role="alert">
                <i class="bi bi-exclamation-octagon-fill me-2"></i>
                <s:actionerror/>
            </div>
        </s:if>

        <s:if test="articles.size() == 0">
            <div class="glass-card p-5 text-center my-5">
                <i class="bi bi-journal-x display-1 text-muted mb-3"></i>
                <h3 class="text-light">No Articles Found</h3>
                <p class="text-secondary">Start by creating the first article for your newsroom.</p>
                <a href="<s:url action='articleCreate'/>" class="btn btn-gradient-primary mt-3">
                    <i class="bi bi-plus-lg me-2"></i>Create First Article
                </a>
            </div>
        </s:if>
        <s:else>
            <div class="row g-4">
                <s:iterator value="articles">
                    <div class="col-md-6 col-lg-4">
                        <div class="glass-card glass-card-interactive p-4 h-100 d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="badge-status badge-<s:property value="status.toLowerCase()"/>">
                                    <s:property value="status"/>
                                </span>
                                <span class="text-secondary small mono-font">
                                    <i class="bi bi-calendar3 me-1"></i><s:date name="createdAt" format="MMM dd, yyyy"/>
                                </span>
                            </div>

                            <h5 class="card-title text-light mb-2">
                                <s:if test="title.length() > 55">
                                    <s:property value="title.substring(0, 55)"/>...
                                </s:if>
                                <s:else>
                                    <s:property value="title"/>
                                </s:else>
                            </h5>

                            <p class="text-secondary small flex-grow-1 mb-4">
                                <s:if test="content.length() > 110">
                                    <s:property value="content.substring(0, 110)"/>...
                                </s:if>
                                <s:else>
                                    <s:property value="content"/>
                                </s:else>
                            </p>

                            <div class="pt-3 border-top border-secondary border-opacity-25 mt-auto">
                                <div class="d-flex justify-content-between align-items-center mb-3 text-secondary small">
                                    <span>
                                        <i class="bi bi-person me-1 text-primary"></i><s:property value="authorName"/>
                                    </span>
                                    <s:if test="category != null && category != ''">
                                        <span class="badge bg-secondary bg-opacity-25 text-light border border-secondary border-opacity-25">
                                            <i class="bi bi-tag me-1"></i><s:property value="category"/>
                                        </span>
                                    </s:if>
                                </div>

                                <div class="d-flex gap-2">
                                    <a href="<s:url action='articleEdit'><s:param name='id' value='id'/></s:url>"
                                       class="btn btn-outline-custom btn-sm flex-fill text-center">
                                        <i class="bi bi-pencil me-1"></i> Edit
                                    </a>
                                    <s:if test="#session.user.role == 'ADMIN' || #session.user.role == 'EDITOR'">
                                        <s:if test="status == 'REVIEW' || status == 'DRAFT'">
                                            <a href="<s:url action='articlePublish'><s:param name='id' value='id'/></s:url>"
                                               class="btn btn-success btn-sm flex-fill text-center fw-bold">
                                                <i class="bi bi-check-circle me-1"></i> Publish
                                            </a>
                                        </s:if>
                                    </s:if>
                                    <s:if test="#session.user.role == 'ADMIN' || #session.user.role == 'EDITOR' || authorId == #session.user.id">
                                        <a href="<s:url action='articleDelete'><s:param name='id' value='id'/></s:url>"
                                           class="btn btn-danger-custom btn-sm px-3"
                                           onclick="return confirm('Are you sure you want to delete this article?');"
                                           title="Delete Article">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                    </s:if>
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
