<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News CMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
        }
        .feature-card {
            transition: transform 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">📰 News CMS</a>
            <div class="navbar-nav ms-auto">
                <s:if test="#session.user != null">
                    <span class="navbar-text me-3">Welcome, <s:property value="#session.user.username"/> (<s:property value="#session.user.role"/>)</span>
                    <a class="nav-link" href="<s:url action='articleList'/>">Dashboard</a>
                    <a class="nav-link" href="<s:url action='logout'/>">Logout</a>
                </s:if>
                <s:else>
                    <a class="nav-link" href="<s:url action='login' method='input'/>">Login</a>
                </s:else>
            </div>
        </div>
    </nav>

    <section class="hero-section">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-4">News Content Management System</h1>
            <p class="lead mb-4">Professional content management with role-based editorial workflows</p>
            <s:if test="#session.user == null">
                <a href="<s:url action='login' method='input'/>" class="btn btn-light btn-lg">Get Started</a>
            </s:if>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card h-100 border-0 shadow">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <span style="font-size: 3rem;">📝</span>
                            </div>
                            <h5 class="card-title">Article Management</h5>
                            <p class="card-text">Create, edit, and manage news articles with ease. Full lifecycle support from draft to publication.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card h-100 border-0 shadow">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <span style="font-size: 3rem;">🔒</span>
                            </div>
                            <h5 class="card-title">Role-Based Access</h5>
                            <p class="card-text">Secure system with Admin, Editor, and Author roles. Strict editorial workflows ensure quality control.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card h-100 border-0 shadow">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <span style="font-size: 3rem;">⚡</span>
                            </div>
                            <h5 class="card-title">Workflow Automation</h5>
                            <p class="card-text">Streamlined publishing process with draft, review, and published states. Automated status management.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="bg-light py-5">
        <div class="container text-center">
            <h2 class="mb-4">Ready to Manage Your Content?</h2>
            <p class="lead mb-4">Join thousands of publishers using our CMS for efficient content management</p>
            <s:if test="#session.user == null">
                <a href="<s:url action='login' method='input'/>" class="btn btn-primary btn-lg">Login Now</a>
            </s:if>
            <s:else>
                <a href="<s:url action='articleList'/>" class="btn btn-primary btn-lg">Go to Dashboard</a>
            </s:else>
        </div>
    </section>

    <footer class="bg-dark text-light py-4">
        <div class="container text-center">
            <p>&copy; 2024 News CMS. Built with Struts 2 & Bootstrap.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
