<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title><s:if test="article.id == 0">Create</s:if><s:else>Edit</s:else> Article - News CMS</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="text"], textarea, select { width: 100%; padding: 8px; }
        textarea { height: 200px; }
        .error { color: red; }
        button { padding: 10px 20px; background-color: #007bff; color: white; border: none; cursor: pointer; }
        .cancel { background-color: #6c757d; }
    </style>
</head>
<body>
    <div class="container">
        <h2><s:if test="article.id == 0">Create New Article</s:if><s:else>Edit Article</s:else></h2>

        <s:if test="hasActionErrors()">
            <div class="error">
                <s:actionerror/>
            </div>
        </s:if>

        <s:form action="articleSave" method="post">
            <s:hidden name="article.id"/>
            <div class="form-group">
                <s:textfield name="article.title" label="Title" required="true"/>
            </div>
            <div class="form-group">
                <s:textfield name="article.category" label="Category"/>
            </div>
            <div class="form-group">
                <s:textarea name="article.content" label="Content" required="true"/>
            </div>
            <div class="form-group">
                <s:select name="article.status" label="Status" list="#{'DRAFT':'Draft', 'REVIEW':'Review'}" value="article.status"/>
            </div>
            <s:submit value="Save"/>
            <a href="<s:url action='articleList'/>" class="cancel" style="padding: 10px 20px; text-decoration: none; color: white; margin-left: 10px;">Cancel</a>
        </s:form>
    </div>
</body>
</html>
