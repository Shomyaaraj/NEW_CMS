<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><s:if test="article.id == 0">Create</s:if><s:else>Edit</s:else> Article - News CMS</title>
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
                    <a class="nav-link" href="<s:url action='articleList'/>">
                        <i class="bi bi-grid me-1"></i> Articles Feed
                    </a>
                    <a class="nav-link active" href="<s:url action='articleCreate'/>">
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
            <h1 class="display-6 fw-extrabold mb-1">
                <s:if test="article.id == 0"><i class="bi bi-pencil-square me-2 text-primary"></i>Create New Article</s:if>
                <s:else><i class="bi bi-pencil me-2 text-info"></i>Edit Article</s:else>
            </h1>
            <p class="text-secondary mb-0">Fill in the story headline, content, category, and workflow status.</p>
        </div>
    </section>

    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-9">
                <div class="glass-card p-4 p-md-5">
                    <s:if test="hasActionErrors()">
                        <div class="alert alert-danger bg-danger bg-opacity-20 border-danger border-opacity-40 text-danger rounded-3 mb-4" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                            <s:actionerror/>
                        </div>
                    </s:if>

                    <s:form action="articleSave" method="post" theme="simple">
                        <s:hidden name="article.id" theme="simple"/>

                        <div class="mb-4">
                            <label for="title" class="form-label text-light fw-semibold fs-5 mb-2">Article Title</label>
                            <s:textfield name="article.title" cssClass="form-control form-control-custom fs-5" id="title" required="true" placeholder="Enter headline title..." theme="simple"/>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label for="category" class="form-label text-light fw-semibold mb-2">Category Tag</label>
                                <s:textfield name="article.category" cssClass="form-control form-control-custom" id="category" placeholder="e.g., Technology, Business, Sports" theme="simple"/>
                            </div>
                            <div class="col-md-6">
                                <label for="status" class="form-label text-light fw-semibold mb-2">Workflow Status</label>
                                <s:select name="article.status" cssClass="form-select form-select-custom" id="status" list="#{'DRAFT':'Draft (Work in Progress)', 'REVIEW':'Submit for Review'}" value="article.status" theme="simple"/>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="content" class="form-label text-light fw-semibold mb-2">Article Content</label>
                            <s:textarea name="article.content" cssClass="form-control form-control-custom" id="content" rows="11" required="true" placeholder="Write or paste your article content here..." theme="simple"/>
                        </div>

                        <div class="d-flex justify-content-between align-items-center pt-3 border-top border-secondary border-opacity-25">
                            <a href="<s:url action='articleList'/>" class="btn btn-outline-custom px-4">
                                <i class="bi bi-arrow-left me-1"></i> Cancel
                            </a>
                            <s:submit value="Save Article" cssClass="btn btn-gradient-primary px-4 py-2 fs-6 fw-bold" theme="simple"/>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
