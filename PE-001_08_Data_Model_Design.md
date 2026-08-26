# PE-001_08_Data_Model_Design

## Project Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Document | Data Model Design |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the analytical data model that will support Business Intelligence reporting for Adventure Works Cycles.

Rather than querying the operational database directly, a reporting model will be designed to improve performance, simplify reporting, and provide consistent business metrics.

---

# Why an Analytical Data Model?

Operational databases are optimized for recording business transactions.

Business Intelligence, however, requires a model optimized for:

- Fast analytical queries
- Consistent KPI calculations
- Simple report development
- Historical trend analysis
- Executive decision-making

For these reasons, a dedicated analytical model is proposed.

---

# Proposed Data Model

The reporting solution will use a **Star Schema**, a widely adopted design pattern in Business Intelligence.

The model consists of:

## Fact Table

### FactSales

The central fact table stores measurable business events such as:

- Sales Amount
- Order Quantity
- Unit Price
- Discount
- Order Date

---

## Dimension Tables

### DimCustomer

Provides customer-related attributes for analysis.

Examples:

- Customer
- Customer Type
- Geography

---

### DimProduct

Provides product-related information.

Examples:

- Product
- Product Subcategory
- Product Category
- Product Model

---

### DimDate

Supports time-based reporting.

Examples:

- Year
- Quarter
- Month
- Week
- Day

---

### DimSalesTerritory

Supports geographical analysis.

Examples:

- Territory
- Country
- Region

---

### DimSalesPerson

Supports sales performance analysis.

Examples:

- Sales Representative
- Sales Region

---

# High-Level Star Schema

```

                 DimDate
                    │
                    │
DimCustomer ── FactSales ── DimProduct
                    │
                    │
      DimSalesTerritory
                    │
                    │
           DimSalesPerson

```

---

# Key Relationships

The analytical model follows one-to-many relationships:

- DimCustomer → FactSales
- DimProduct → FactSales
- DimDate → FactSales
- DimSalesTerritory → FactSales
- DimSalesPerson → FactSales

This structure simplifies reporting while improving query performance.

---

# Design Decisions

| Decision | Reason |
|----------|--------|
| Use a Star Schema | Simplifies reporting and improves analytical performance. |
| Separate analytical reporting from the operational database | Reduces impact on transactional workloads. |
| Introduce a dedicated Date dimension | Supports consistent time intelligence calculations. |
| Store KPIs as measures rather than calculated columns where appropriate | Promotes flexibility and reduces model size. |
| Keep dimensions descriptive and facts measurable | Aligns with Business Intelligence best practices. |

---

# Expected Business Benefits

The proposed model enables:

- Faster report development
- Consistent KPI definitions
- Simplified dashboard design
- Improved report performance
- Easier maintenance
- Better scalability for future business growth

---

# Consultant's Perspective

A well-designed data model is the foundation of every successful Business Intelligence solution.

Dashboards may be the most visible outcome of the project, but their reliability, performance, and maintainability depend on the quality of the underlying data model.

Investing time in proper modeling reduces future complexity and supports long-term analytical success.

---

# Next Phase

The next document, **PE-001_09_SQL_Server_Implementation.md**, will describe how the analytical model is implemented within SQL Server, including views, transformations, and preparation of reporting datasets.

---

# Document Relationships

## Previous

- PE-001_07_Data_Discovery_and_Assessment.md

## Next

- PE-001_09_SQL_Server_Implementation.md
