# PE-001_07_Data_Discovery_and_Assessment

## Project Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Document | Data Discovery and Assessment |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to evaluate the AdventureWorks database as the primary data source for the Business Intelligence modernization initiative.

The assessment identifies the available business entities, evaluates the quality and structure of the data, and determines how the database supports the analytical requirements defined in previous project phases.

---

# Data Source Overview

AdventureWorks is a relational SQL Server sample database developed by Microsoft to simulate the operations of a manufacturing and retail organization.

The database contains interconnected business data representing sales, customers, products, purchasing, inventory, employees, and sales territories.

For this consulting engagement, AdventureWorks serves as the operational data source from which analytical datasets will be developed.

---

# Business Domains

The following business domains are represented within the database:

- Sales
- Customers
- Products
- Product Categories
- Product Subcategories
- Sales Orders
- Sales Territories
- Employees
- Purchasing
- Vendors
- Inventory

These domains provide a comprehensive foundation for business reporting and performance analysis.

---

# Primary Business Entities

The following entities are expected to play a key role in the analytical solution:

| Business Area | Representative Tables |
|---------------|----------------------|
| Sales | SalesOrderHeader, SalesOrderDetail |
| Customers | Customer, Individual, Store |
| Products | Product, ProductSubcategory, ProductCategory |
| Geography | Address, StateProvince, CountryRegion |
| Sales Organization | SalesPerson, SalesTerritory |
| Purchasing | PurchaseOrderHeader, PurchaseOrderDetail |
| Inventory | ProductInventory |

---

# Initial Data Quality Assessment

The AdventureWorks database demonstrates several characteristics of a well-designed operational database:

- Structured relational model.
- Clearly defined primary and foreign keys.
- Normalized business entities.
- Consistent naming conventions.
- Realistic transactional data.

> **Fact:** AdventureWorks is designed by Microsoft as a sample OLTP database for SQL Server demonstrations.

---

# Analytical Readiness

The available data supports a wide range of analytical scenarios, including:

- Sales performance analysis
- Customer segmentation
- Product profitability
- Regional sales analysis
- Inventory monitoring
- Sales representative performance
- Purchasing trends

These analytical capabilities align well with the business objectives defined earlier in the project.

---

# Data Limitations

The following limitations should be acknowledged:

- The database represents a simulated business environment.
- Certain modern business metrics may need to be derived rather than stored directly.
- Historical business context is limited to the available sample data.

These limitations are acceptable for demonstrating Business Intelligence methodology and technical implementation.

---

# Initial KPI Opportunities

Based on the available data, the following KPIs are candidates for executive reporting:

- Total Sales
- Gross Revenue
- Sales Growth
- Average Order Value
- Top Customers
- Top Products
- Sales by Territory
- Sales by Product Category
- Customer Count
- Inventory Levels

Additional KPIs may be introduced as the project progresses.

---

# Consultant's Assessment

The AdventureWorks database provides a strong foundation for demonstrating a complete Business Intelligence modernization initiative.

Its relational structure, business richness, and realistic operational data make it well suited for illustrating SQL development, Azure SQL migration, and Power BI reporting within a consulting-oriented case study.

---

# Next Phase

The next document, **PE-001_08_Data_Model_Design.md**, will define the analytical data model required for reporting. It will identify fact and dimension tables, describe key relationships, and explain how the operational database will be transformed into a reporting model optimized for Business Intelligence.

---

# Document Relationships

## Previous

- PE-001_06_Solution_Architecture.md

## Next

- PE-001_08_Data_Model_Design.md
