# PE-001 | Final Case Study
## Retail Sales Analytics & Cloud Modernization

**Project:** Project Elevate — PE-001  
**Reference Dataset:** AdventureWorks2022  
**Project Type:** Business Intelligence, Data Analytics & Cloud Data Migration  
**Technologies:** SQL Server, T-SQL, Azure SQL Database, Power BI, DAX, GitHub  
**Status:** Implementation and functional validation completed

---

## 1. Engagement Snapshot

**Business Challenge:** A retail organization needs a consistent, accessible view of sales performance across products, customers, sales territories, and salespeople.

**Proposed Solution:** Develop a centralized reporting layer, implement interactive Power BI dashboards, and demonstrate migration of the underlying database from SQL Server to Azure SQL Database.

**Delivery Approach:** Business assessment → Data discovery → Solution design → SQL implementation → Power BI development → Azure migration → Quality assurance.

**Project Outcome:** A validated retail analytics solution with executive and operational reporting, product-level drill-through, and a successfully tested Azure SQL data source.

> **Project context:** PE-001 is a portfolio consulting simulation using Microsoft's AdventureWorks sample database. Business challenges and organizational benefits are illustrative; implementation and technical validation results reflect the completed project.

## 2. Business Challenge

Retail organizations generate sales information across multiple business dimensions. Without a structured analytics solution, stakeholders may struggle to answer fundamental questions consistently:

- How are sales and orders performing over time?
- Which products contribute most to revenue?
- How does performance differ between sales territories?
- Which customers and salespeople drive business results?
- How can management compare performance across periods?

The PE-001 scenario assumes that existing reporting processes do not provide a sufficiently unified, interactive view of these questions.

The consulting objective was to demonstrate how structured data modeling and business intelligence could improve the accessibility and consistency of sales performance information.

### Consultant's Reflection

A successful analytics project begins with business questions rather than dashboard visuals. Defining the required decisions first helps determine which data, measures, and reporting views are necessary.

## 3. Current-State Assessment

The starting technical environment consisted of the AdventureWorks2022 database hosted on a local SQL Server instance.

The source database contained transactional and reference data suitable for retail sales analysis. However, its operational structure was not designed as a dedicated Power BI reporting model.

The project therefore required a reporting-oriented layer that could expose relevant sales facts and descriptive dimensions while preserving consistency with the source.

The assessment focused on data availability, business relationships, reporting grain, quality, and migration considerations.

### Consultant's Reflection

Operational databases and analytical models serve different purposes. A reporting layer helps translate operational structures into information that business users can understand and explore.

## 4. Project Objectives

The project established five delivery objectives:

1. Build a reusable SQL reporting layer for retail sales analysis.
2. Design a Power BI semantic model with consistent business measures.
3. Deliver executive and operational dashboards with interactive filtering.
4. Demonstrate migration from local SQL Server to Azure SQL Database.
5. Validate data consistency and dashboard functionality after migration.

The project was deliberately limited to a manageable portfolio scope, prioritizing a complete, documented solution over unnecessary technical complexity.

## 5. Solution Architecture

The solution follows this logical flow:

**AdventureWorks2022 → SQL Server Reporting Layer → Azure SQL Database → Power BI Semantic Model → Business Dashboards**

The project was initially developed and tested against local SQL Server. The required database objects and reporting views were subsequently established in Azure SQL Database, and the Power BI connection was updated to use the cloud database.

### Main solution components

| Component | Purpose |
|---|---|
| SQL Server / AdventureWorks2022 | Original transactional and reference data |
| Reporting schema | Analytical views and date dimension |
| Azure SQL Database | Cloud-hosted database for migration demonstration |
| Power BI semantic model | Relationships, business measures, and filtering |
| Executive Dashboard | High-level sales performance monitoring |
| Operational Dashboard | Detailed product, customer, territory, and salesperson analysis |
| Product Detail | Product-level drill-through |
| GitHub repository | Version-controlled implementation, documentation, and evidence |

### Consultant's Reflection

Cloud migration should preserve business reporting outcomes, not merely transfer database objects. The important success criterion is whether stakeholders can continue using the analytical solution with reliable results.

## 6. Data Modeling and SQL Implementation

A reporting-oriented dimensional model was implemented using a sales fact view and supporting dimensions.

**Reporting objects:**

- `Reporting.vw_FactSales`
- `Reporting.DimDate`
- `Reporting.vw_DimCustomer`
- `Reporting.vw_DimProduct`
- `Reporting.vw_DimSalesTerritory`
- `Reporting.vw_DimSalesPerson`

The model supports analysis by date, customer, product, territory, and salesperson.

SQL views were used to organize the source data into reporting-friendly structures, while Power BI provided the semantic relationships and reusable DAX measures.

### Validated data volumes

| Reporting object | Validated rows |
|---|---:|
| FactSales | 121,317 |
| DimDate | 9,496 |
| DimCustomer | 19,820 |
| DimProduct | 504 |
| DimSalesTerritory | 10 |
| DimSalesPerson | 17 |

The sales fact dataset covers transactions from May 2011 through June 2014.

### Consultant's Reflection

A clear dimensional structure makes analytical results easier to validate, maintain, and explain. Data modeling is a business-enablement activity, not simply a technical implementation step.

## 7. Business Intelligence Delivery

Two primary dashboards were developed in Power BI.

### 7.1 Executive Dashboard

The Executive Dashboard provides an overview of retail sales performance through key indicators and analytical visuals.

Its capabilities include:

- Sales, order, and quantity performance indicators
- Average order value and year-over-year analysis
- Sales trends over time
- Leading products and customers
- Territory-level performance
- Interactive business filters

The dashboard is designed to support management-level monitoring and performance discussions.

### 7.2 Operational Dashboard

The Operational Dashboard supports more detailed exploration of sales performance.

Its capabilities include:

- Sales, order, and quantity KPIs
- Product performance analysis
- Salesperson performance analysis
- Territory performance analysis
- Customer performance analysis
- Year, territory, product category, and customer type slicers

The existing dashboard was retained during the Azure migration, without redesigning visuals or introducing unnecessary measures.

### 7.3 Product Detail

A dedicated Product Detail page supports drill-through from product performance visuals.

This allows users to move from a broader operational view into the context of an individual product and return to the originating dashboard.

### Consultant's Reflection

Executive and operational audiences need different levels of detail. Separating strategic monitoring from operational exploration improves usability without requiring separate underlying data models.

## 8. Azure SQL Migration

The project demonstrated the transition of the reporting solution from local SQL Server to Azure SQL Database.

Key activities included:

1. Establishing the Azure SQL environment.
2. Migrating the required source tables and supporting database objects.
3. Creating and validating the reporting schema and views.
4. Comparing local and Azure SQL reporting results.
5. Updating Power BI's data source connection.
6. Refreshing the semantic model and validating dashboards.

The migration demonstrated that the analytical solution could continue operating against the Azure-hosted data source.

This was a controlled portfolio migration exercise rather than a production cutover or high-availability implementation.

### Consultant's Reflection

Migration success should be evaluated at multiple levels: database objects, data completeness, analytical calculations, and user-facing functionality.

## 
