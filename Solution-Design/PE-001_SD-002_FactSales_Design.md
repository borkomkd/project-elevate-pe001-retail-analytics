# PE-001_SD-002 – Fact Sales Design

## Solution Design Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Design Document | SD-002 |
| Component | Fact Sales |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the design of the **FactSales** object that will serve as the central fact table within the analytical reporting solution.

The FactSales object consolidates transactional sales data from AdventureWorks into a structure optimized for reporting, business intelligence, and cloud migration.

---

# Business Rationale

Business users need reliable and consistent sales information to answer questions such as:

- What are total sales by month?
- Which products generate the highest revenue?
- Which sales territories perform best?
- Which customers contribute the most revenue?
- How are sales trends changing over time?
- Which sales representatives achieve the highest performance?

A centralized FactSales object provides a single, trusted source for these analyses.

---

# Design Objectives

The FactSales design aims to:

- Create a reporting-friendly structure.
- Centralize sales metrics.
- Simplify Power BI model development.
- Support efficient SQL queries.
- Prepare the solution for Azure SQL migration.

---

# Business Process

The FactSales object represents the **Sales Order Detail** business process.

Each record corresponds to a single sales order line.

This level of detail (the grain) provides maximum flexibility for aggregation and analysis.

---

# Grain

**One row represents one sales order line.**

This means that every record contains:

- One product
- One customer
- One sales order
- One order date
- One sales territory
- One sales representative (when available)

---

# Data Sources

The FactSales object will be built using AdventureWorks tables, including:

| Source Table | Purpose |
|--------------|---------|
| Sales.SalesOrderHeader | Order information |
| Sales.SalesOrderDetail | Line-item sales |
| Production.Product | Product details |
| Sales.Customer | Customer information |
| Sales.SalesTerritory | Territory information |
| Sales.SalesPerson | Sales representative information |

---

# Measures

The FactSales object will expose business measures including:

| Measure | Description |
|----------|-------------|
| Order Quantity | Quantity sold |
| Unit Price | Price per unit |
| Line Total | Revenue for the order line |
| Unit Price Discount | Applied discount |
| Sales Amount | Revenue after discounts |

Future versions may include:

- Profit
- Cost
- Margin
- Margin Percentage

---

# Relationships

The FactSales object will relate to the following dimensions:

| Dimension | Relationship |
|-----------|--------------|
| DimDate | Order Date |
| DimCustomer | Customer |
| DimProduct | Product |
| DimSalesTerritory | Sales Territory |
| DimSalesPerson | Sales Representative |

---

# Proposed Star Schema

```text
                 DimDate
                    │
                    │
DimCustomer ─ FactSales ─ DimProduct
                    │
                    │
         DimSalesTerritory
                    │
                    │
           DimSalesPerson
```

---

# Design Decisions

| Decision | Reason |
|----------|--------|
| Use Sales Order Detail as the grain | Preserves the highest level of analytical detail. |
| Build a reporting-friendly fact object | Simplifies downstream reporting. |
| Separate reporting objects from operational tables | Protects transactional workloads and improves maintainability. |
| Keep business calculations centralized | Ensures consistent KPIs across reports. |

---

# Expected Benefits

The FactSales object provides:

- A trusted analytical dataset.
- Consistent business metrics.
- Improved SQL performance.
- Simplified Power BI development.
- Better scalability.
- Easier cloud migration.

---

# Consultant's Perspective

A well-designed fact table is the foundation of every Business Intelligence solution.

Choosing the correct grain and clearly defining business measures ensures that dashboards remain flexible, scalable, and consistent as reporting requirements evolve.

Rather than replicating operational tables directly, the reporting layer should present business data in a format optimized for analytical workloads.

---

# Related Implementation

The design will be implemented through:

`SQL/03_Create_FactSales_View.sql`

---

# Next Design Document

**PE-001_SD-003_DimCustomer_Design.md**

---

# Document Relationships

## Related Consulting Documents

- PE-001_08_Data_Model_Design.md
- PE-001_09_SQL_Server_Implementation.md

## Related Solution Design

- PE-001_SD-001_Date_Dimension_Design.md

## Related SQL Scripts

- 01_Create_DimDate.sql
- 02_Populate_DimDate.sql
- 03_Create_FactSales_View.sql
