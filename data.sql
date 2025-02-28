-- Create the banking database
CREATE DATABASE BankDB;
USE BankDB;

-- Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT
);

-- Accounts table
CREATE TABLE Accounts (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    AccountType ENUM('Savings', 'Checking', 'Credit') NOT NULL,
    Balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- Transactions table
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    TransactionType ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    Amount DECIMAL(15,2) NOT NULL,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO Customers (Name, Email, Phone, Address) 
VALUES ('John Doe', 'john.doe@email.com', '123-456-7890', '123 Main St, New York');

INSERT INTO Accounts (CustomerID, AccountType, Balance) 
VALUES (1, 'Savings', 5000.00);

INSERT INTO Transactions (AccountID, TransactionType, Amount) 
VALUES (1, 'Deposit', 2000.00);
