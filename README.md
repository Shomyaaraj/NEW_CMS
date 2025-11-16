# News CMS

A content management system for managing news articles and user authentication built with Apache Struts 2 and H2 Database.

## Overview

News CMS is a web application that provides functionality for:
- User authentication (login/logout)
- Article management (create, read, update, delete)
- Dashboard interface for content management

## Technology Stack

- **Framework**: Apache Struts 2 (v2.5.30)
- **Database**: H2 Database (v2.1.214)
- **Build Tool**: Maven
- **Language**: Java
- **Web Server**: Compatible with standard Java application servers (Tomcat, etc.)
- **Frontend**: JSP, Bootstrap CSS
- **Database Connection**: Apache Commons DBCP2

## Project Structure

```
news-cms/
├── src/main/
│   ├── java/com/news/cms/
│   │   ├── action/              # Struts 2 Action classes
│   │   │   ├── ArticleAction.java
│   │   │   └── LoginAction.java
│   │   ├── dao/                 # Data Access Objects
│   │   │   ├── ArticleDAO.java
│   │   │   ├── UserDAO.java
│   │   │   └── DatabaseUtil.java
│   │   └── model/               # Entity models
│   │       ├── Article.java
│   │       └── User.java
│   ├── resources/
│   │   ├── db.properties        # Database configuration
│   │   ├── schema.sql           # Database schema
│   │   └── struts.xml           # Struts 2 configuration
│   └── webapp/
│       ├── index.jsp
│       └── WEB-INF/
│           ├── web.xml          # Deployment descriptor
│           └── jsp/             # JSP view templates
│               ├── login.jsp
│               ├── dashboard.jsp
│               ├── articleList.jsp
│               └── articleForm.jsp
├── pom.xml                      # Maven configuration
└── README.md                    # This file
```

## Features

### Authentication
- User login/logout functionality
- Session management
- Dashboard access control

### Article Management
- View all articles
- Create new articles
- Edit existing articles
- Delete articles
- List articles with pagination support

## Prerequisites

- Java Development Kit (JDK) 8 or higher
- Maven 3.6.0 or higher
- Apache Tomcat or similar Java application server

## Installation

### 1. Clone the Repository
```bash
git clone <repository-url>
cd news-cms
```

### 2. Build the Project
```bash
mvn clean package
```

### 3. Deploy the WAR File



### 4. Start the Application Server

### 5. Access the Application
Open your web browser and navigate to:
```
http://localhost:8080/news-cms/
```

## Database Configuration

Database properties are configured in `src/main/resources/db.properties`.

The application uses H2 Database and automatically initializes the schema on startup using `schema.sql`.

### Database Schema
- **Users Table**: Stores user credentials and information
- **Articles Table**: Stores article content, author, and metadata

## Configuration Files

### struts.xml
Defines the Struts 2 action mappings and result configurations:
- Login action
- Logout action
- Article listing, creation, update, and deletion actions

### web.xml
Deployment descriptor that configures:
- Struts 2 filter mapping
- Welcome file configuration
- Display name

### db.properties
Database connection properties:
- Database URL
- Driver class
- Connection pool settings

## API Routes

### Authentication
- `GET/POST /login!input` - Display login form
- `GET/POST /login` - Process login
- `GET /logout` - Logout user

### Articles
- `GET /articleList` - View all articles
- `GET /articleCreate` - Display article creation form
- `POST /articleSave` - Save new/updated article
- `GET /articleEdit` - Display article edit form
- `GET /articleDelete` - Delete article

## Development

### Building
```bash
mvn clean package
```

### Running Tests
```bash
mvn test
```

### Running with Embedded Server (for development)
```bash
mvn tomcat7:run
```

## Directory Overview

- **action/**: Contains Struts 2 Action classes that handle HTTP requests
- **dao/**: Data Access Objects for database operations
- **model/**: Java domain objects (Article, User)
- **resources/**: Configuration files and SQL scripts
- **webapp/**: Web application files (JSP pages, static resources)

## Dependencies

Main dependencies managed through Maven:
- Apache Struts 2 Core
- H2 Database
- Apache Commons DBCP2
- Servlet API 4.0.1
- JSP API 2.3.3
- Bootstrap 5 (via WebJars)

## Troubleshooting

### Database Connection Issues
- Verify `db.properties` is correctly configured
- Check database driver is included in classpath
- Ensure schema.sql is properly initialized

### Page Not Found Errors
- Verify the WAR file is deployed to the correct location
- Check Struts 2 filter mappings in web.xml
- Review action mappings in struts.xml

### Session-Related Issues
- Clear browser cookies and session data
- Check application server session timeout settings
- Verify HttpSession configuration in actions

## Contributing

1. Create a feature branch
2. Commit your changes
3. Push to the repository
4. Submit a pull request

## License

[Specify your license here]

## Support

For issues or questions, please create an issue in the repository or contact the development team.

## Future Enhancements

- [ ] Implement role-based access control (RBAC)
- [ ] Add article search functionality
- [ ] Implement article comments system
- [ ] Add image upload support
- [ ] Create REST API endpoints
- [ ] Implement caching layer
- [ ] Add audit logging
