CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL -- ADMIN, EDITOR, AUTHOR
);

CREATE TABLE IF NOT EXISTS articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    category VARCHAR(100),
    author_id INT NOT NULL,
    publish_date TIMESTAMP,
    status VARCHAR(20) DEFAULT 'DRAFT', -- DRAFT, REVIEW, PUBLISHED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

-- Insert sample users
INSERT INTO users (username, password, role) VALUES ('admin', 'admin123', 'ADMIN');
INSERT INTO users (username, password, role) VALUES ('editor', 'editor123', 'EDITOR');
INSERT INTO users (username, password, role) VALUES ('author', 'author123', 'AUTHOR');
