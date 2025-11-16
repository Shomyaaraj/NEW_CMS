<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - News CMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
        }
        .login-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 25px;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-card p-4">
                        <div class="text-center mb-4">
                            <h2 class="fw-bold text-primary">📰 News CMS</h2>
                            <p class="text-muted">Sign in to your account</p>
                        </div>

                        <s:if test="hasActionErrors()">
                            <div class="alert alert-danger" role="alert">
                                <s:actionerror/>
                            </div>
                        </s:if>

                        <s:form action="login" method="post" cssClass="mb-4">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <s:textfield name="username" cssClass="form-control" id="username" required="true" placeholder="Enter your username"/>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <s:password name="password" cssClass="form-control" id="password" required="true" placeholder="Enter your password"/>
                            </div>
                            <div class="d-grid">
                                <s:submit value="Sign In" cssClass="btn btn-primary btn-login"/>
                            </div>
                        </s:form>

                        <div class="text-center">
                            <h6 class="text-muted mb-3">Sample Accounts</h6>
                            <div class="row g-2">
                                <div class="col-4">
                                    <div class="p-2 border rounded small">
                                        <strong>Admin</strong><br>
                                        admin/admin123
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="p-2 border rounded small">
                                        <strong>Editor</strong><br>
                                        editor/editor123
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="p-2 border rounded small">
                                        <strong>Author</strong><br>
                                        author/author123
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
