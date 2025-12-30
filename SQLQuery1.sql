-- 1. Create Users Table (Matches your updated .aspx.cs)
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    full_name NVARCHAR(100),
    email NVARCHAR(100) UNIQUE,
    password NVARCHAR(100)
);

-- 2. Create Admins Table 
CREATE TABLE admins (
    id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) UNIQUE,
    password NVARCHAR(50)
);

-- 3. Create Courses Table
CREATE TABLE courses (
    id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(200),
    description NVARCHAR(MAX)
);

-- 4. Create Inquiries Table (For Contact Messages)
CREATE TABLE inquiries (
    id INT PRIMARY KEY IDENTITY(1,1),
    sender_name NVARCHAR(100),
    sender_email NVARCHAR(100),
    message NVARCHAR(MAX),
    submitted_at DATETIME DEFAULT GETDATE()
);




