# News CMS

A content management system for managing news articles and user authentication built with Apache Struts 2 and PostgreSQL. Easily deployable with Docker and supports Railway/Heroku deployment.

## Overview

News CMS is a web application that provides functionality for:
- User authentication (login/logout)
- Article management (create, read, update, delete)
- Dashboard interface for content management
- RESTful API routes for article and user operations

## Technology Stack

- **Framework**: Apache Struts 2 (v2.5.30)
- **Database**: PostgreSQL (with Neon cloud support)
- **Build Tool**: Maven
- **Language**: Java 11+
- **Web Server**: Webapp Runner (supports Railway, Heroku deployment)
- **Frontend**: JSP, Bootstrap 5
- **Database Connection**: Apache Commons DBCP2 (v2.9.0)
- **Containerization**: Docker with multi-stage builds

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

### 2. Set Up Environment Variables
Create a `.env` file or set the following environment variables:
```bash
DATABASE_URL=jdbc:postgresql://your-host:5432/your-db
DATABASE_USER=your_username
DATABASE_PASSWORD=your_password
```

For **Neon PostgreSQL**, use:
```bash
DATABASE_URL=jdbc:postgresql://ep-xxx.aws.neon.tech/neondb?sslmode=require
DATABASE_USER=neondb_owner
DATABASE_PASSWORD=your_password
```

Update `src/main/resources/db.properties` with your database credentials.

### 3. Build the Project
```bash
mvn clean package
```

### 4a. Deploy Locally
Deploy the WAR file to your local Tomcat server:
```bash
cp target/news-cms.war $CATALINA_HOME/webapps/
```

Then access the application:
```
http://localhost:8080/news-cms/
```

### 4b. Deploy with Docker
Build and run the Docker image:
```bash
docker build -t news-cms .
docker run -p 8080:8080 \
  -e DATABASE_URL="jdbc:postgresql://your-host/your-db?sslmode=require" \
  -e DATABASE_USER="your_username" \
  -e DATABASE_PASSWORD="your_password" \
  news-cms
```

### 4c. Deploy to Railway/Heroku
1. Ensure you have the Railway or Heroku CLI installed
2. Configure your PostgreSQL database connection in environment variables
3. Deploy using:
```bash
# For Railway
railway up

# For Heroku
git push heroku main
```

The application will be available at the provided Railway/Heroku URL.

## Database Configuration

The application connects to PostgreSQL and automatically initializes the schema on startup using `schema.sql`.

Database properties are configured in `src/main/resources/db.properties`:
```properties
db.driver=org.postgresql.Driver
db.url=jdbc:postgresql://host:port/database?sslmode=require
db.username=your_username
db.password=your_password
```

### Database Schema
- **Users Table**: Stores user credentials and information
- **Articles Table**: Stores article content, author, and metadata

### Using Neon PostgreSQL
For **Neon** cloud database integration:
1. Create a database on [Neon Console](https://console.neon.tech/)
2. Copy the connection string and update `db.properties`
3. Ensure `sslmode=require` is set in the connection URL for secure connection
4. The schema will be initialized automatically on first run

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

### Quick Start for Local Development
1. Update `db.properties` with your local PostgreSQL credentials
2. Create a database: `createdb news_cms`
3. Run: `mvn clean package && mvn tomcat7:run`
4. Access: `http://localhost:8080/news-cms/`

## Deployment Options

### Local Development
- Use Maven Tomcat plugin with `mvn tomcat7:run`
- Requires local PostgreSQL or compatible database

### Docker Deployment
- Multi-stage Docker build included (Dockerfile)
- Optimized image size with separate build and runtime stages
- Pass database credentials via environment variables

### Cloud Deployment (Railway/Heroku)
- Automatic deployment via `Procfile`
- Uses webapp-runner for Java web application hosting
- Configure database connection via platform environment variables
- Application runs on PORT environment variable (default 8080)

## Directory Overview

- **action/**: Contains Struts 2 Action classes that handle HTTP requests
- **dao/**: Data Access Objects for database operations
- **model/**: Java domain objects (Article, User)
- **resources/**: Configuration files and SQL scripts
- **webapp/**: Web application files (JSP pages, static resources)

## Dependencies

Main dependencies managed through Maven:
- Apache Struts 2 Core (v2.5.30)
- PostgreSQL JDBC Driver (v42.6.0)
- Apache Commons DBCP2 (v2.9.0) - Connection pooling
- Servlet API (v4.0.1)
- JSP API (v2.3.3)
- Bootstrap 5 (via WebJars v5.3.0)
- JUnit (v3.8.1) - Testing

### Java Version Requirements
- JDK 11 or higher recommended
- Maven 3.6.0 or higher

## Troubleshooting

### Database Connection Issues
- Verify PostgreSQL credentials in `db.properties`
- Check if `sslmode=require` is needed (required for Neon)
- Ensure PostgreSQL driver (postgresql-42.6.0.jar) is in classpath
- Verify the database server is running and accessible
- For Neon, ensure network access is allowed in security settings

### Port Already in Use
- Local development: Change port with `mvn tomcat7:run -Dmaven.tomcat.port=8081`
- Docker: Use different port mapping: `docker run -p 9090:8080`
- Railway/Heroku: Platform automatically assigns PORT environment variable

### Page Not Found Errors
- Verify the WAR file is deployed to the correct location
- Check Struts 2 filter mappings in web.xml
- Review action mappings in struts.xml
- Ensure the application context is correct

### Session-Related Issues
- Clear browser cookies and session data
- Check application server session timeout settings
- Verify HttpSession configuration in actions
- For Railway/Heroku, ensure session persistence is configured

### Docker Build Issues
- Use `docker build --no-cache` to force fresh build
- Ensure Maven dependencies are downloadable from repository
- Check Java and Maven versions match requirements

### Missing Database Schema
- Run `schema.sql` manually if not auto-initialized
- Check application logs for SQL initialization errors
- Verify database user has CREATE TABLE permissions

## Contributing

1. Create a feature branch
2. Commit your changes
3. Push to the repository

## License

[Add your license information here]

## Support & Resources

- **Struts 2 Documentation**: https://struts.apache.org/
- **PostgreSQL Documentation**: https://www.postgresql.org/docs/
- **Neon PostgreSQL**: https://neon.tech/
- **Railway Documentation**: https://docs.railway.app/
- **Heroku Java Support**: https://devcenter.heroku.com/categories/java

## Version History

### v1.0-SNAPSHOT
- Initial release
- User authentication system
- Article CRUD operations
- PostgreSQL integration
- Docker and Railway deployment support
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
