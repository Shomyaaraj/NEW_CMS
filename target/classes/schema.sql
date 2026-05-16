-- =============================================
-- NEWS CMS - Neon PostgreSQL Schema
-- H2 se convert kiya gaya
-- =============================================

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,                        -- AUTO_INCREMENT → SERIAL
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL                     -- ADMIN, EDITOR, AUTHOR
);

-- Articles Table
CREATE TABLE IF NOT EXISTS articles (
    id SERIAL PRIMARY KEY,                        -- AUTO_INCREMENT → SERIAL
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    category VARCHAR(100),
    author_id INT NOT NULL,
    publish_date TIMESTAMP,
    status VARCHAR(20) DEFAULT 'DRAFT',           -- DRAFT, REVIEW, PUBLISHED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- ON UPDATE hata diya (PostgreSQL support nahi karta)
    FOREIGN KEY (author_id) REFERENCES users(id)
);

-- Auto-update updated_at ke liye trigger (ON UPDATE ka replacement)
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_articles_updated_at
    BEFORE UPDATE ON articles
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =============================================
-- Sample Users
-- (Production mein password hashing zaroor karna!)
-- =============================================
INSERT INTO users (username, password, role) 
VALUES ('admin', 'admin123', 'ADMIN')
ON CONFLICT (username) DO NOTHING;

INSERT INTO users (username, password, role) 
VALUES ('editor', 'editor123', 'EDITOR')
ON CONFLICT (username) DO NOTHING;

INSERT INTO users (username, password, role) 
VALUES ('author', 'author123', 'AUTHOR')
ON CONFLICT (username) DO NOTHING;
```

---

### H2 → PostgreSQL — Kya Badla:

| H2 | PostgreSQL (Neon) | Reason |
|---|---|---|
| `INT AUTO_INCREMENT` | `SERIAL` | PostgreSQL ka auto-increment |
| `ON UPDATE CURRENT_TIMESTAMP` | Trigger banaya | PostgreSQL directly support nahi karta |
| `INSERT INTO` | `INSERT INTO ... ON CONFLICT DO NOTHING` | Duplicate insert error avoid karne ke liye |

---

### Ab Neon Setup karo:

1. [neon.tech](https://neon.tech) pe **free account** banao
2. **New Project** create karo
3. Dashboard pe **Connection String** milega kuch aisa:
```
   postgresql://user:password@ep-xxx.us-east-2.aws.neon.tech/neondb