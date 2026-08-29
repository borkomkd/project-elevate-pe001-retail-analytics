# PE-001_SD-004 – Product Dimension Design

## Solution Design Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Design Document | SD-004 |
| Component | Product Dimension |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the design of the **Product Dimension** for the Project Elevate reporting solution.

The Product Dimension provides descriptive information about products and serves as the primary business entity for product performance analysis within the analytical reporting model.

---

# Business Rationale

Business users frequently need answers to questions such as:

- Which products generate the highest revenue?
- Which product categories perform best?
- Which product subcategories are growing?
- Which products sell the highest quantities?
- Which products should receive increased marketing investment?
- Which products contribute the most to overall sales?

The Product Dimension enables consistent product reporting while simplifying analytical models used by Power BI.

---

# Design Objectives

The Product Dimension aims to:

- Provide descriptive product attributes.
- Support product hierarchy analysis.
- Simplify Power BI relationships.
- Improve report usability.
- Create a reusable analytical dimension.

---

# Business Entity

The Product Dimension represents a unique product available for sale.

Each product appears only once in the dimension and stores descriptive business attributes rather than transactional measures.

---

# Grain

**One row represents one product.**

Each product is uniquely identified and can participate in multiple sales transactions through the FactSales view.

---

# Why this Grain?

Choosing one row per product provides maximum analytical flexibility.

Business users can:

- Analyze revenue by product.
- Compare product categories.
- Monitor product performance over time.
- Aggregate sales across categories and subcategories.
- Reuse the Product Dimension across multiple reporting solutions.

---

# Data Sources

The Product Dimension will be built using the following AdventureWorks tables:

| Source Table | Purpose |
|--------------|---------|
| Production.Product | Product information |
| Production.ProductSubcategory | Product subcategory |
| Production.ProductCategory | Product category |

---

# Proposed Attributes

| Attribute | Description |
|-----------|-------------|
| ProductID | Operational product identifier |
| ProductName | Product name |
| ProductNumber | Product code |
| ProductCategory | Business category |
| ProductSubcategory | Business subcategory |
| Color | Product color |
| Size | Product size |
| StandardCost | Product cost |
| ListPrice | Product selling price |
| SellStartDate | Product availability start date |
| SellEndDate | Product availability end date |
| IsActive | Indicates whether the product is currently active |

---

# Relationships

The Product Dimension will relate to:

| Related Object | Relationship |
|----------------|--------------|
| Reporting.vw_FactSales | ProductID |

---

# Business Questions Supported

The Product Dimension enables analysis such as:

- Top-selling products
- Revenue by product category
- Revenue by product subcategory
- Product mix analysis
- Average selling price
- Product portfolio performance
- Sales by color
- Sales by size

---

# Design Decisions

| Decision | Reason |
|----------|--------|
| One row per product | Eliminates duplication. |
| Flatten category hierarchy | Simplifies Power BI reporting. |
| Include category and subcategory names | Improves business readability. |
| Use business-friendly column names | Reduces report complexity. |
| Separate descriptive attributes from sales measures | Aligns with dimensional modeling principles. |

---

# Expected Benefits

The Product Dimension provides:

- Consistent product reporting.
- Simplified dashboard development.
- Faster analytical queries.
- Improved maintainability.
- Better scalability.
- Easier Azure SQL migration.

---

# Future Enhancements

Future versions may include:

- Product Model
- Product Line
- Product Class
- Product Style
- Product Weight
- Product Status
- Product Lifecycle Stage

These attributes are intentionally excluded from Version 1.0 to maintain a focused analytical model.

---

# Consultant's Perspective

Products are one of the core analytical entities within every retail and manufacturing organization.

A well-designed Product Dimension transforms a normalized operational schema into a business-friendly structure that enables executives and analysts to explore product performance without understanding database relationships.

By exposing categories, subcategories, pricing, and descriptive attributes within a single reusable dimension, the reporting model becomes easier to maintain and significantly more intuitive for business users.

---

# Key Takeaway

A Product Dimension should describe products—not transactions.

Separating descriptive product attributes from sales facts creates a flexible reporting model that supports both operational and executive analytics.

---

# Related Implementation

The design will be implemented through:

`SQL/05_Create_vw_DimProduct.sql`

---

# Next Design Document

**PE-001_SD-005_DimSalesTerritory_Design.md**

---

# Document Relationships

## Related Consulting Documents

- PE-001_08_Data_Model_Design.md
- PE-001_09_SQL_Server_Implementation.md

## Related Solution Design

- PE-001_SD-001_Date_Dimension_Design.md
- PE-001_SD-002_FactSales_Design.md
- PE-001_SD-003_DimCustomer_Design.md

## Related SQL Scripts

- 03_Create_vw_FactSales.sql
- 04_Create_vw_DimCustomer.sql
- 05_Create_vw_DimProduct.sql
