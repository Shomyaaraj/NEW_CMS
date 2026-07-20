<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - News CMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="d-flex flex-column justify-content-center align-items-center py-5 min-vh-100">

    <div class="container" style="max-width: 450px;">
        <div class="text-center mb-4">
            <div class="display-4 mb-2">📰</div>
            <h2 class="fw-extrabold mb-1">News CMS</h2>
            <p class="text-secondary small">Sign in to your editorial newsroom workspace</p>
        </div>

        <div class="glass-card p-4 p-md-5">
            <s:if test="hasActionErrors()">
                <div class="alert alert-danger bg-danger bg-opacity-20 border-danger border-opacity-40 text-danger rounded-3 mb-4" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    <s:actionerror/>
                </div>
            </s:if>

            <s:form action="login" method="post" theme="simple">
                <div class="mb-3">
                    <label for="username" class="form-label text-light fw-medium mb-2">Username</label>
                    <s:textfield name="username" cssClass="form-control form-control-custom" id="username" required="true" placeholder="Enter your username" theme="simple"/>
                </div>

                <div class="mb-4">
                    <label for="password" class="form-label text-light fw-medium mb-2">Password</label>
                    <s:password name="password" cssClass="form-control form-control-custom" id="password" required="true" placeholder="Enter your password" theme="simple"/>
                </div>

                <div class="d-grid mb-4">
                    <s:submit value="Sign In to Newsroom" cssClass="btn btn-gradient-primary py-2 fs-6" theme="simple"/>
                </div>
            </s:form>

            <div class="border-top border-secondary border-opacity-25 pt-4 mt-2">
                <p class="text-center text-secondary small mb-3 mono-font">Demo Credentials</p>
                <div class="row g-2 text-center small">
                    <div class="col-4">
                        <div class="p-2 border border-secondary border-opacity-25 rounded bg-dark">
                            <strong class="d-block text-primary">Admin</strong>
                            <span class="text-secondary mono-font" style="font-size: 0.75rem;">admin</span>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="p-2 border border-secondary border-opacity-25 rounded bg-dark">
                            <strong class="d-block text-info">Editor</strong>
                            <span class="text-secondary mono-font" style="font-size: 0.75rem;">editor</span>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="p-2 border border-secondary border-opacity-25 rounded bg-dark">
                            <strong class="d-block text-warning">Author</strong>
                            <span class="text-secondary mono-font" style="font-size: 0.75rem;">author</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
