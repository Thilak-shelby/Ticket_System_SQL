-- Table to store customer details
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,               -- Unique ID for each customer (auto-increment)
    FirstName VARCHAR(50) NOT NULL,              -- Customer's first name (required)
    LastName VARCHAR(50) NOT NULL                -- Customer's last name (required)
);

-- Table to store multiple phone numbers per customer
CREATE TABLE CustomerPhone (
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID),  -- Link to Customer table
    PhoneNumber VARCHAR(20) NOT NULL,                         -- Phone number
    PRIMARY KEY (CustomerID, PhoneNumber)                     -- Composite key to avoid duplicates
);

-- Table to store multiple email addresses per customer
CREATE TABLE CustomerEmail (
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID),  -- Link to Customer table
    Email VARCHAR(100) NOT NULL,                              -- Email address
    PRIMARY KEY (CustomerID, Email)                           -- Composite key
);

-- Table to store support staff information
CREATE TABLE SupportStaff (
    StaffID SERIAL PRIMARY KEY,              -- Unique ID for staff (auto-increment)
    FirstName VARCHAR(50) NOT NULL,          -- First name (required)
    LastName VARCHAR(50) NOT NULL,           -- Last name (required)
    Department VARCHAR(50) NOT NULL,         -- Department (e.g., IT, Networking)
    Role VARCHAR(50) NOT NULL                -- Role (e.g., 1st Level Support)
);

-- Table to store support requests (tickets)
CREATE TABLE SupportRequest (
    RequestID SERIAL PRIMARY KEY,                                -- Unique ticket ID
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID),     -- Link to customer
    Subject VARCHAR(100) NOT NULL,                               -- Short title of the request
    Description TEXT,                                            -- Full description
    DateCreated DATE NOT NULL DEFAULT CURRENT_DATE,              -- Auto-fills current date
    ClosedDate DATE,                                             -- When the request was closed
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Open', 'In Progress', 'Closed')),  -- Ticket status
    Priority VARCHAR(20) NOT NULL CHECK (Priority IN ('Low', 'Medium', 'High'))       -- Ticket priority
);

-- M:N link table for which staff handles which requests
CREATE TABLE HandledRequest (
    StaffID INT NOT NULL REFERENCES SupportStaff(StaffID),       -- Staff assigned to handle
    RequestID INT NOT NULL REFERENCES SupportRequest(RequestID), -- Request being handled
    PRIMARY KEY (StaffID, RequestID)                             -- Prevent duplicate pairings
);

-- Table to store all interactions (comments/messages) on support requests
CREATE TABLE Interaction (
    InteractionID SERIAL PRIMARY KEY,                                -- Unique message ID
    RequestID INT NOT NULL REFERENCES SupportRequest(RequestID),     -- Related support request
    StaffID INT NOT NULL REFERENCES SupportStaff(StaffID),           -- Staff who wrote it
    Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,          -- When the comment was made
    Comment TEXT NOT NULL                                            -- The message itself
);

