# PE-001_SD-007 – Power BI Semantic Model Design

## Solution Design Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Design Document | SD-007 |
| Component | Power BI Semantic Model |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the architecture, relationships, and design principles of the Power BI Semantic Model used within Project Elevate.

The semantic model transforms the reporting layer into a business-friendly analytical model that supports interactive reporting, executive dashboards, and operational analysis.

---

# Business Rationale

Business users should be able to answer questions without understanding SQL Server tables or database relationships.

The semantic model provides a simplified analytical layer that enables self-service reporting while maintaining consistent business definitions across all reports.

Typical business questions include:

- What are total sales this year?
- Which products generate the highest revenue?
- Which customers contribute the most revenue?
- Which territories perform best?
- Which sales representatives exceed their targets?
- How have sales changed over time?

---

# Design Objectives

The semantic model aims to:

- Provide a clean star schema.
- Support reusable DAX measures.
- Enable intuitive report creation.
- Improve report performance.
- Maintain consistent business terminology.
- Separate business logic from visualizations.

---

# Model Architecture

The semantic model follows a classic **Star Schema**.

                    DimDate
                       │
                       │
DimCustomer ─── vw_FactSales ─── DimProduct
                       │
                       │
          DimSalesTerritory
                       │
                       │
             DimSalesPerson

The fact table stores transactional data.

The dimensions provide descriptive business context.

---

# Data Sources

The semantic model will connect to the following SQL Server reporting objects:

| SQL Object | Purpose |
|------------|---------|
| Reporting.DimDate | Date dimension |
| Reporting.vw_FactSales | Sales fact table |
| Reporting.vw_DimCustomer | Customer dimension |
| Reporting.vw_DimProduct | Product dimension |
| Reporting.vw_DimSalesTerritory | Territory dimension |
| Reporting.vw_DimSalesPerson | Sales representative dimension |

---

# Relationships

| From | To | Cardinality | Filter Direction |
|------|----|-------------|------------------|
| DimDate | FactSales | One-to-Many | Single |
| DimCustomer | FactSales | One-to-Many | Single |
| DimProduct | FactSales | One-to-Many | Single |
| DimSalesTerritory | FactSales | One-to-Many | Single |
| DimSalesPerson | FactSales | One-to-Many | Single |

---

# Design Decisions

| Decision | Reason |
|----------|--------|
| Star schema | Improves performance and usability |
| Single-direction filtering | Prevents ambiguous filter paths |
| Separate reporting layer | Decouples reports from operational database |
| Reusable measures | Ensures consistent KPI definitions |
| Business-friendly naming | Improves usability for report authors |

---

# Naming Conventions

The following naming standards will be applied throughout the semantic model.

### Tables

- FactSales
- DimDate
- DimCustomer
- DimProduct
- DimSalesTerritory
- DimSalesPerson

### Measures

Examples:

- Total Sales
- Total Orders
- Average Order Value
- Sales YTD
- Sales Last Year
- YoY Growth %
- Average Selling Price

Measures will use descriptive business names rather than technical abbreviations.

---

# Measure Strategy

Business calculations will be implemented as DAX measures rather than calculated columns whenever possible.

This approach provides:

- Better performance
- Lower memory usage
- Greater flexibility
- Reusable business logic

---

# Time Intelligence

The Date Dimension will serve as the official calendar table.

It will support:

- Year-to-Date (YTD)
- Month-to-Date (MTD)
- Quarter-to-Date (QTD)
- Previous Year comparisons
- Year-over-Year growth
- Rolling 12-month analysis

---

# Performance Considerations

The semantic model is designed to optimize report responsiveness.

Key design principles include:

- Import storage mode
- Star schema modeling
- Minimized calculated columns
- Reusable DAX measures
- Single-direction relationships
- Business-friendly dimensions

---

# Model Quality Principles

The semantic model follows the following quality principles:

- One version of the truth through standardized DAX measures.
- Business-friendly naming conventions.
- Star schema design for optimal performance.
- Minimal calculated columns.
- Reusable dimensions.
- Clear separation between data preparation and reporting.
- Scalable architecture for future enhancements.

---

# Security Considerations

Version 1.0 does not implement Row-Level Security (RLS).

Future versions may include:

- Territory-based access
- Sales representative access
- Regional management access

---

# Future Enhancements

Future versions may include:

- Calculation Groups
- Dynamic Format Strings
- Incremental Refresh
- Composite Models
- Field Parameters
- Object-Level Security
- Direct Lake (Microsoft Fabric)

---

# Expected Benefits

The semantic model provides:

- Simplified report development.
- Consistent KPI calculations.
- Faster report performance.
- Improved maintainability.
- Reusable business logic.
- Scalable analytical architecture.

---

# Consultant's Perspective

The semantic model is the bridge between data engineering and business decision-making.

Rather than exposing operational database structures to report authors, the semantic model presents curated business entities with consistent relationships and standardized calculations. This reduces report complexity, improves user confidence, and enables scalable self-service analytics.

A well-designed semantic model also allows future dashboards to reuse the same business definitions, ensuring that executives, analysts, and operational teams are working from a single version of the truth.

---

# Key Takeaway

A semantic model is more than a collection of tables and relationships—it is the business layer that transforms data into trusted, reusable insights.

---

# Related Implementation

The design will be implemented in:

`PowerBI/PE-001.pbip`

---

# Next Design Document

**PE-001_SD-008_DAX_Measures_Design.md**

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
- PE-001_SD-006_DimSalesPerson_Design.md

## Related SQL Scripts

- 01_Create_DimDate.sql
- 02_Populate_DimDate.sql
- 03_Create_vw_FactSales.sql
- 04_Create_vw_DimCustomer.sql
- 05_Create_vw_DimProduct.sql
- 06_Create_vw_DimSalesTerritory.sql
- 07_Create_vw_DimSalesPerson.sql
