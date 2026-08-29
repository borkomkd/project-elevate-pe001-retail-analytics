# PE-001_SD-006 – Sales Person Dimension Design

## Solution Design Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Design Document | SD-006 |
| Component | Sales Person Dimension |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the design of the **Sales Person Dimension** for the Project Elevate reporting solution.

The Sales Person Dimension provides descriptive information about sales representatives, enabling performance analysis at both individual and regional levels.

---

# Business Rationale

Business leaders frequently ask questions such as:

- Which sales representatives generate the highest revenue?
- Who consistently exceeds sales expectations?
- Which territories have the strongest sales performance?
- How is revenue distributed across the sales team?
- Which representatives require additional support or coaching?
- How does individual performance change over time?

The Sales Person Dimension provides the business context required to answer these questions consistently.

---

# Design Objectives

The Sales Person Dimension aims to:

- Provide descriptive employee information.
- Support sales performance analysis.
- Simplify Power BI relationships.
- Improve report readability.
- Create a reusable analytical dimension.

---

# Business Entity

The Sales Person Dimension represents a unique sales representative.

Each sales representative appears only once and stores descriptive attributes rather than transactional measures.

---

# Grain

**One row represents one sales representative.**

---

# Why this Grain?

Using one row per sales representative enables business users to:

- Compare employee performance.
- Rank sales representatives.
- Analyze regional performance.
- Monitor productivity trends.
- Reuse the dimension across multiple analytical solutions.

---

# Data Sources

The Sales Person Dimension will be built using the following AdventureWorks tables:

| Source Table | Purpose |
|--------------|---------|
| Sales.SalesPerson | Sales representative information |
| HumanResources.Employee | Employee information |
| Person.Person | Employee names |

---

# Proposed Attributes

| Attribute | Description |
|-----------|-------------|
| SalesPersonID | Sales representative identifier |
| EmployeeName | Full employee name |
| TerritoryID | Assigned sales territory |
| SalesQuota | Annual sales quota |
| Bonus | Bonus amount |
| CommissionPct | Commission percentage |
| SalesYTD | Year-to-date sales |
| SalesLastYear | Previous year's sales |

---

# Attribute Classification

### Business Attributes

- Employee Name
- Territory

### Performance Attributes

- Sales Quota
- Sales YTD
- Sales Last Year
- Bonus
- Commission Percentage

### Operational Attributes

- SalesPersonID
- TerritoryID

---

# Relationships

The Sales Person Dimension will relate to:

| Related Object | Relationship |
|----------------|--------------|
| Reporting.vw_FactSales | SalesPersonID |
| Reporting.vw_DimSalesTerritory | TerritoryID |

---

# Business Questions Supported

The Sales Person Dimension enables analysis such as:

- Revenue by sales representative
- Top-performing sales representatives
- Sales quota achievement
- Bonus analysis
- Sales by territory
- Sales team ranking
- Year-over-year performance comparison

---

# Design Decisions

| Decision | Reason |
|----------|--------|
| One row per sales representative | Eliminates duplication. |
| Include performance metrics | Supports executive reporting. |
| Separate descriptive and performance attributes | Aligns with dimensional modeling principles. |
| Business-friendly column names | Improves usability. |
| Reusable dimension | Supports future analytical models. |

---

# Expected Benefits

The Sales Person Dimension provides:

- Consistent employee reporting.
- Simplified Power BI relationships.
- Better sales performance analysis.
- Improved maintainability.
- Reusable business dimension.

---

# Future Enhancements

Future versions may include:

- Manager Name
- Department
- Hire Date
- Employment Status
- Performance Rating
- Sales Certifications
- Organizational Hierarchy

These enhancements are intentionally deferred to maintain a focused Version 1.0.

---

# Consultant's Perspective

Sales performance is one of the most visible indicators of business success.

A dedicated Sales Person Dimension enables organizations to evaluate individual contributions, identify high-performing employees, monitor regional effectiveness, and support performance management initiatives through reliable and consistent reporting.

Separating sales representative information into its own reusable dimension also prepares the reporting model for future HR and workforce analytics.

---

# Key Takeaway

Business performance is driven by people as well as products and customers.

Modeling sales representatives as a dedicated dimension enables organizations to analyze performance consistently while maintaining a scalable and reusable analytical model.

---

# Related Implementation

The design will be implemented through:

`SQL/07_Create_vw_DimSalesPerson.sql`

---

# Next Design Document

**Power BI Semantic Model Design** *(to be introduced after the core reporting layer is complete).*

---

# Document Relationships

## Related Consulting Documents

- PE-001_08_Data_Model_Design.md
- PE-001_09_SQL_Server_Implementation.md

## Related Solution Design

- PE-001_SD-001_Date_Dimension_Design.md
- PE-001_SD-002_FactSales_Design.md
- PE-001_SD-003_DimCustomer_Design.md
- PE-001_SD-004_DimProduct_Design.md
- PE-001_SD-005_DimSalesTerritory_Design.md

## Related SQL Scripts

- 03_Create_vw_FactSales.sql
- 04_Create_vw_DimCustomer.sql
- 05_Create_vw_DimProduct.sql
- 06_Create_vw_DimSalesTerritory.sql
- 07_Create_vw_DimSalesPerson.sql
