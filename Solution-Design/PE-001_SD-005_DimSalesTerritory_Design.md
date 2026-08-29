# PE-001_SD-005 – Sales Territory Dimension Design

## Solution Design Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Design Document | SD-005 |
| Component | Sales Territory Dimension |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the design of the **Sales Territory Dimension** for the Project Elevate reporting solution.

The Sales Territory Dimension provides geographical business information that enables sales analysis across territories, countries, and sales regions.

---

# Business Rationale

Business leaders frequently need answers to questions such as:

- Which sales territories generate the highest revenue?
- Which countries have the strongest sales performance?
- How does revenue compare across regions?
- Which territories demonstrate the highest growth?
- Where should future sales investments be focused?

The Sales Territory Dimension enables consistent geographical reporting while simplifying analytical models used by Power BI.

---

# Design Objectives

The Sales Territory Dimension aims to:

- Provide descriptive geographical attributes.
- Support regional performance analysis.
- Simplify Power BI relationships.
- Improve report usability.
- Create a reusable analytical dimension.

---

# Business Entity

The Sales Territory Dimension represents a unique sales territory.

Each territory appears only once and stores descriptive geographical information rather than transactional measures.

---

# Grain

**One row represents one sales territory.**

---

# Why this Grain?

A single-row-per-territory design enables business users to:

- Compare regional performance.
- Analyze country-level sales.
- Monitor regional growth.
- Build geographic dashboards.
- Reuse the dimension across multiple reporting models.

---

# Data Source

The Sales Territory Dimension will be built using:

| Source Table | Purpose |
|--------------|---------|
| Sales.SalesTerritory | Territory information |

---

# Proposed Attributes

| Attribute | Description |
|-----------|-------------|
| TerritoryID | Operational territory identifier |
| TerritoryName | Territory name |
| CountryRegion | Country or region |
| SalesGroup | Sales region grouping |

---

# Attribute Classification

### Business Attributes

- Territory Name
- Country Region
- Sales Group

### Operational Attributes

- TerritoryID

---

# Relationships

The Sales Territory Dimension will relate to:

| Related Object | Relationship |
|----------------|--------------|
| Reporting.vw_FactSales | TerritoryID |
| Reporting.vw_DimCustomer | TerritoryID |

---

# Business Questions Supported

The Sales Territory Dimension enables analysis such as:

- Revenue by country
- Revenue by sales region
- Revenue by territory
- Average order value by territory
- Territory contribution
- Regional sales trends

---

# Design Decisions

| Decision | Reason |
|----------|--------|
| One row per territory | Eliminates duplication. |
| Use business-friendly column names | Improves report readability. |
| Separate descriptive information from transactional measures | Aligns with dimensional modeling principles. |
| Reusable dimension | Supports future analytical models. |

---

# Expected Benefits

The Sales Territory Dimension provides:

- Consistent geographical reporting.
- Simplified Power BI relationships.
- Better regional analysis.
- Improved maintainability.
- Reusable business dimension.

---

# Future Enhancements

Future versions may include:

- Regional Manager
- Market Classification
- Sales Targets
- Currency
- Population
- Economic Indicators

These attributes are intentionally excluded from Version 1.0 to maintain a focused analytical model.

---

# Consultant's Perspective

Geographical analysis is fundamental for strategic decision-making.

A dedicated Sales Territory Dimension allows organizations to compare regional performance consistently, identify growth opportunities, and support executive decision-making through intuitive dashboards and reports.

Keeping geographical information in a reusable dimension simplifies reporting and prepares the analytical model for future expansion.

---

# Key Takeaway

Separating geographical attributes into a dedicated dimension improves reporting consistency, enhances analytical flexibility, and enables scalable business intelligence solutions.

---

# Related Implementation

The design will be implemented through:

`SQL/06_Create_vw_DimSalesTerritory.sql`

---

# Next Design Document

**PE-001_SD-006_DimSalesPerson_Design.md**

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

## Related SQL Scripts

- 03_Create_vw_FactSales.sql
- 04_Create_vw_DimCustomer.sql
- 05_Create_vw_DimProduct.sql
- 06_Create_vw_DimSalesTerritory.sql
