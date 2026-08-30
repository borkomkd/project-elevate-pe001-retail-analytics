# PE-001_SD-008 – DAX Measures Design

## Solution Design Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Design Document | SD-008 |
| Component | DAX Measures |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the design principles, naming conventions, organization, and implementation strategy for DAX measures used throughout Project Elevate.

The objective is to create reusable business calculations that provide consistent and trusted metrics across all Power BI reports.

---

# Business Rationale

Business users should never need to calculate KPIs manually.

Instead, the semantic model should expose standardized measures that ensure every report answers business questions using the same business definitions.

Examples include:

- Total Sales
- Total Orders
- Average Order Value
- Sales YTD
- Sales Last Year
- Year-over-Year Growth
- Top Customers
- Top Products

---

# Design Objectives

The DAX layer aims to:

- Centralize business calculations.
- Promote measure reusability.
- Minimize duplicated logic.
- Improve report consistency.
- Optimize model performance.
- Support executive and operational reporting.

---

# Design Principles

The following principles will guide DAX development.

### Business-first

Measures should describe business concepts rather than technical calculations.

Example:

✔ Total Sales

instead of

✘ SumLineTotal

---

### Reusability

Each measure should be reusable across multiple reports.

Business logic should exist in one place only.

---

### Simplicity

Measures should remain readable and maintainable.

Complex calculations should be broken into smaller reusable measures whenever appropriate.

---

### Performance

Measures should favor efficient DAX patterns.

Whenever possible:

- Use base measures.
- Avoid unnecessary iterators.
- Avoid calculated columns when measures provide the same result.
- Reuse existing measures.

---

# Measure Organization

Measures will be grouped into logical display folders.

## Sales

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Order Value

## Customers

- Total Customers
- Active Customers

## Products

- Total Products Sold
- Average Selling Price

## Time Intelligence

- Sales YTD
- Sales Last Year
- Sales MTD
- Sales QTD
- YoY Growth %
- Rolling 12 Months

## KPIs

- Gross Revenue
- Average Revenue per Customer
- Average Revenue per Order

---

# Naming Conventions

Measures will use descriptive business names.

Examples:

- Total Sales
- Total Orders
- Sales YTD
- Average Order Value

Avoid abbreviations unless they are universally recognized (e.g., YTD, MTD, QTD).

---

# Base Measures

Version 1.0 will begin with a small set of foundational measures.

These measures will be reused by more advanced calculations.

Examples include:

- Total Sales
- Total Orders
- Total Quantity Sold

---

# Time Intelligence Strategy

All time-based calculations will use the official Date Dimension.

The following calculations will be supported:

- Year-to-Date (YTD)
- Month-to-Date (MTD)
- Quarter-to-Date (QTD)
- Previous Year
- Year-over-Year Growth
- Rolling 12 Months

---

# Performance Considerations

Measures should:

- Reuse existing measures.
- Avoid repeated calculations.
- Minimize filter context complexity.
- Use CALCULATE intentionally.
- Keep evaluation efficient.

---

# Testing Strategy

Each new measure will be validated before being used in reports.

Validation will include:

- Comparison with SQL results.
- Cross-checking against AdventureWorks data.
- Edge-case testing where appropriate.
- Review of filter context behavior.

---

# Future Enhancements

Future versions may include:

- Calculation Groups
- Dynamic Format Strings
- Currency Conversion
- Forecasting Measures
- AI-Assisted KPIs
- Scenario Analysis

---

# Expected Benefits

A well-designed DAX layer provides:

- Consistent KPI definitions.
- Reduced report complexity.
- Improved maintainability.
- Better performance.
- Reusable business logic.

---

# Consultant's Perspective

A semantic model should not expose raw aggregations for report authors to recreate repeatedly.

Instead, it should provide a curated library of trusted business measures that reflect agreed business definitions. This reduces inconsistencies between reports and allows analysts to focus on answering business questions rather than rewriting calculations.

Designing reusable measures also improves maintainability, as changes to business logic can be made in a single location and immediately benefit every report built on the model.

---

# Key Takeaway

Well-designed DAX measures transform a semantic model from a collection of tables into a trusted analytical platform that delivers consistent business insights.

---

# Related Implementation

The design will be implemented through the creation of reusable DAX measures within the Power BI semantic model.

---

# Next Design Document

**PE-001_SD-009_Executive_Dashboard_Design.md**

---

# Document Relationships

## Related Consulting Documents

- PE-001_08_Data_Model_Design.md
- PE-001_09_SQL_Server_Implementation.md

## Related Solution Design

- PE-001_SD-007_PowerBI_Semantic_Model_Design.md

## Related Power BI Implementation

- PE-001.pbip
