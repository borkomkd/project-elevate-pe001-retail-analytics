# PE-001_SD-003 – Customer Dimension Design

## Solution Design Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Design Document | SD-003 |
| Component | Customer Dimension |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the design of the **Customer Dimension** within the Project Elevate analytical model.

The Customer Dimension provides descriptive business information about customers and supports customer-centric reporting, segmentation, and business analysis.

---

# Business Rationale

Business stakeholders frequently ask questions such as:

- Who are our most valuable customers?
- Which customer groups generate the highest revenue?
- How many active customers do we have?
- What is the geographical distribution of customers?
- Which customers have reduced their purchasing activity?
- Which customer segments should receive targeted marketing initiatives?

A dedicated Customer Dimension enables these analyses while keeping the reporting model intuitive and scalable.

---

# Design Objectives

The Customer Dimension aims to:

- Provide descriptive customer attributes.
- Support customer segmentation.
- Simplify Power BI relationships.
- Improve reporting readability.
- Create a reusable business entity for future analytical models.

---

# Business Entity

The Customer Dimension represents a unique customer.

Each customer appears only once in the dimension.

The dimension stores descriptive information rather than transactional measures.

---

# Grain

**One row represents one customer.**

This ensures that customer attributes remain consistent and can be reused across multiple fact tables in future projects.

---

# Why this Grain?

Choosing one row per customer provides a stable analytical structure.

This enables business users to:

- Analyze purchasing behaviour.
- Rank customers by revenue.
- Perform customer segmentation.
- Calculate customer lifetime value.
- Support future analytical models without redesigning the dimension.

---

# Data Sources

The Customer Dimension will be built using AdventureWorks tables:

| Source Table | Purpose |
|--------------|---------|
| Sales.Customer | Customer identifiers |
| Person.Person | Customer names |
| Person.BusinessEntity | Customer entity information (when applicable) |
| Person.EmailAddress | Customer email (optional in Version 1.0) |

Future versions may also include additional demographic information if appropriate.

---

# Proposed Attributes

| Attribute | Description |
|-----------|-------------|
| CustomerKey | Analytical customer identifier |
| CustomerID | Operational customer identifier |
| CustomerName | Full customer name |
| CustomerType | Individual or Store |
| TerritoryID | Sales territory |
| AccountNumber | Customer account number |

---

# Relationships

The Customer Dimension will relate to:

| Related Object | Relationship |
|----------------|--------------|
| Reporting.vw_FactSales | CustomerID |

---

# Design Decisions

| Decision | Reason |
|----------|--------|
| One row per customer | Eliminates duplication. |
| Separate descriptive attributes from transactional measures | Aligns with dimensional modeling principles. |
| Business-friendly attribute names | Improves usability for report developers and business users. |
| Reusable dimension | Supports future analytical projects. |

---

# Expected Benefits

The Customer Dimension provides:

- Consistent customer reporting.
- Simplified Power BI relationships.
- Easier customer segmentation.
- Better analytical performance.
- Improved maintainability.

---

# Future Enhancements

Potential enhancements include:

- Customer Status
- Customer Classification
- Customer Lifetime Value
- First Purchase Date
- Last Purchase Date
- Total Orders
- Preferred Product Category

These attributes are intentionally excluded from Version 1.0 to maintain a clean, understandable design.

---

# Consultant's Perspective

A Customer Dimension is much more than a lookup table.

It represents the business view of the organization's customers and provides the descriptive context required to transform transactional sales records into actionable business insights.

Well-designed dimensions reduce complexity, improve consistency, and enable business users to explore information without needing to understand the underlying operational database.

---

# Key Takeaway

Strong dimensional design separates descriptive business entities from transactional events.

By modeling customers as a reusable dimension, the reporting solution becomes easier to maintain, extend, and integrate with future analytical initiatives.

---

# Related Implementation

The design will be implemented through:

`SQL/04_Create_vw_DimCustomer.sql`

---

# Next Design Document

**PE-001_SD-004_DimProduct_Design.md**

---

# Document Relationships

## Related Consulting Documents

- PE-001_08_Data_Model_Design.md
- PE-001_09_SQL_Server_Implementation.md

## Related Solution Design

- PE-001_SD-001_Date_Dimension_Design.md
- PE-001_SD-002_FactSales_Design.md

## Related SQL Scripts

- 01_Create_DimDate.sql
- 02_Populate_DimDate.sql
- 03_Create_vw_FactSales.sql
- 04_Create_vw_DimCustomer.sql
