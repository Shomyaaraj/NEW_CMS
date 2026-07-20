# News CMS

A modern, high-performance Content Management System (CMS) built with **Apache Struts 2** (v2.5.30), **PostgreSQL** (with Neon Cloud & embedded H2 fallback), **Bootstrap 5**, and a sleek **Indigo/Purple Glassmorphism** editorial UI.

---

## 🌟 Overview

**News CMS** is an enterprise-ready editorial web application designed for fast-paced digital newsrooms. It features:
- **Role-Based Access Control (RBAC)** for `ADMIN`, `EDITOR`, and `AUTHOR` roles.
- **Full Article Lifecycle Management** (Draft, Submit for Review, Publish, Edit, Delete).
- **Modern Glassmorphic Editorial Dashboard** with real-time KPI metrics and neon status indicators.
- **Dual Database Architecture**: Auto-connects to Neon Cloud PostgreSQL with seamless automatic fallback to embedded in-memory **H2 Database** for offline local development.
- **Production Deployment Ready**: Docker multi-stage container build and Railway / Heroku `webapp-runner` support.

---

## 🛠 Technology Stack

- **Backend Framework**: Apache Struts 2 (`v2.5.30`)
- **Language & JDK**: Java 11+ (Compatible with Java 8/11/21)
- **Database Engine**: PostgreSQL (`v42.6.0` driver) / H2 In-Memory (`v2.1.214`)
- **Connection Pool**: Apache Commons DBCP2 (`v2.9.0`)
- **Build System**: Apache Maven
- **Frontend & Design System**: JSP, Bootstrap 5 (`v5.3.0`), Bootstrap Icons, Custom Indigo/Purple Glassmorphism CSS
- **Application Server / Runner**: Apache Tomcat 9 (`webapp-runner v9.0.52.1`)
- **Containerization**: Docker (Multi-stage build)

---

## 📁 Project Structure

```
news-cms/
├── src/main/
│   ├── java/com/news/cms/
│   │   ├── action/              # Struts 2 Action Controllers
│   │   │   ├── ArticleAction.java # CRUD, publish & delete workflow logic
│   │   │   └── LoginAction.java   # Authentication & session handling
│   │   ├── dao/                 # Data Access Objects & Utilities
│   │   │   ├── ArticleDAO.java   # SQL queries for article operations
│   │   │   ├── UserDAO.java      # User lookup & authentication
│   │   │   └── DatabaseUtil.java # Connection manager & H2/Neon fallback
│   │   └── model/               # Domain Entity Models
│   │       ├── Article.java     # Article entity bean
│   │       └── User.java        # User entity bean
│   ├── resources/
│   │   ├── db.properties        # Primary database credentials
│   │   ├── schema.sql           # ANSI SQL schema & seed user initialization
│   │   └── struts.xml           # Struts 2 mappings & theme simple config
│   └── webapp/
│       ├── css/
│       │   └── style.css        # Lumina Indigo/Purple Glassmorphic theme
│       ├── index.jsp            # Landing & marketing showcase page
│       └── WEB-INF/
│           ├── web.xml          # Web application deployment descriptor
│           └── jsp/             # Internal View Templates
│               ├── login.jsp        # Authentication sign-in form
│               ├── dashboard.jsp    # Newsroom dashboard & KPI widgets
│               ├── articleList.jsp  # Article feed & management view
│               └── articleForm.jsp  # Article creation & edit form
├── Dockerfile                   # Multi-stage Docker build configuration
├── Procfile                     # Webapp-runner execution script for Railway/Heroku
├── pom.xml                      # Maven project definition & dependencies
└── README.md                    # Project documentation
```

---

## ⚡ Features & Workflow

### 1. User Authentication & Session Management
- Role-based session tracking (`ADMIN`, `EDITOR`, `AUTHOR`).
- Secure logout and login validation.
- Session authorization guards protecting action routes.

### 2. Article Editorial Lifecycle
- **Draft**: Work-in-progress state for authors.
- **Review**: Submitted to editorial queue for review.
- **Publish**: Published state managed by Admin and Editor roles.
- **Edit & Delete**: Edit and delete operations restricted to authorized users.

### 3. Demo Credentials
The database auto-seeds 3 default accounts on initial launch:

| Role | Username | Password | Permissions |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin` | `admin123` | Full access (Create, Edit, Publish, Delete any article) |
| **Editor** | `editor` | `editor123` | Editorial access (Create, Edit, Publish, Delete articles) |
| **Author** | `author` | `author123` | Creator access (Create & Edit personal draft articles) |

---

## 🚀 Quick Start for Local Development

### 1. Prerequisites
- Java JDK 8, 11, or 21 installed.
- Maven 3.6+ installed (or MavenWrapper).

### 2. Build & Package
```bash
mvn clean package
```

### 3. Run Locally with `webapp-runner`
```bash
java -jar target/dependency/webapp-runner.jar --port 8080 target/news-cms
```
Open **[http://localhost:8080/](http://localhost:8080/)** in your browser.

> **Note**: If remote PostgreSQL connection credentials fail or are unreachable, `DatabaseUtil` automatically falls back to an embedded in-memory H2 database, ensuring zero-config instant local execution.

---

## 🐳 Docker Deployment

Build and run the application container using Docker:

```bash
# Build Docker image
docker build -t news-cms .

# Run container
docker run -p 8080:8080 \
  -e DATABASE_URL="jdbc:postgresql://your-host:5432/your-db?sslmode=require" \
  -e PGUSER="your_username" \
  -e PGPASSWORD="your_password" \
  news-cms
```

---

## ☁️ Cloud Deployment (Railway / Heroku)

Deploy automatically using the provided `Procfile`:

```bash
# For Railway
railway up

# For Heroku
git push heroku main
```

---

## 🔗 Action Mappings & API Routes

### Authentication Routes
- `GET/POST /login!input` — Render login page
- `POST /login` — Authenticate credentials
- `GET /logout` — Invalidate user session

### Article Management Routes
- `GET /articleList` — View articles feed
- `GET /articleCreate` — Open new article form (Requires Login)
- `POST /articleSave` — Save new or updated article
- `GET /articleEdit?id={id}` — Open edit form (Requires Ownership/Role)
- `GET /articlePublish?id={id}` — Publish article (Requires Admin/Editor Role)
- `GET /articleDelete?id={id}` — Delete article (Requires Ownership/Role)

---

## 📄 License

This project is open-source under the MIT License.
