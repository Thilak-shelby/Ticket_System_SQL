# Support System Database Schema

## Overview

This repository contains the SQL schema for a **Customer Support System** database. It is designed to manage and track customer details, support staff, support requests (tickets), and interactions on those requests.

The schema supports:

- Storing customer personal details along with multiple phone numbers and email addresses.
- Managing support staff information, including department and role.
- Creating and tracking support requests with status and priority.
- Assigning multiple staff members to handle each request.
- Recording detailed interaction logs (comments/messages) by staff on support requests.

---

## MC Notation Diagram

![Screenshot 2025-05-23 011211](https://github.com/user-attachments/assets/fd63607f-38b2-4176-a6d8-af6ada7c3dc7)

---



## Schema Details

- Primary keys use `SERIAL` for auto-incremented IDs.
- Composite primary keys are used in `CustomerPhone`, `CustomerEmail`, and `HandledRequest` to prevent duplicate entries.
- Foreign keys enforce referential integrity between related tables.
- Constraints enforce allowed values for `Status` (`Open`, `In Progress`, `Closed`) and `Priority` (`Low`, `Medium`, `High`) in support requests.
- Timestamps and dates track creation and closing of tickets and interactions.

---

## Usage

1. **Database Setup**  
   Run the SQL script `support_system_schema.sql` (provided in this repo) in your PostgreSQL (or compatible) database environment to create the necessary tables.

2. **Data Insertion**  
   Insert customer data into `Customer`, and their contact details into `CustomerPhone` and `CustomerEmail`.  
   Add support staff to `SupportStaff`.  
   Create support tickets in `SupportRequest` and assign handlers via `HandledRequest`.  
   Use `Interaction` to log comments/messages related to each ticket.

3. **Queries**  
   Join tables as needed to retrieve complete information about customers, tickets, handlers, and interactions.

---

## Example SQL Command to Create Tables

(See the `support_system_schema.sql` file for the full code.)

```sql
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

-- Additional tables omitted for brevity
```

---

## Contributing

Contributions, suggestions, and improvements are welcome. Feel free to open issues or submit pull requests.

---


## Contact

Created by Thilakraj Soundararajan — feel free to reach out for questions or collaboration.

---

