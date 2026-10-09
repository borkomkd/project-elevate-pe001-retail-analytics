# PE-001 — Azure SQL Migration and Validation

**Project:** Project Elevate  
**Project ID:** PE-001  
**Document:** Azure SQL Migration and Validation  
**Version:** 1.0  
**Status:** Validated

---

## 1. Purpose

The purpose of this phase was to migrate the PE-001 reporting solution from a local SQL Server environment to Azure SQL Database and verify that the existing Power BI solution continued to operate correctly.

The migration demonstrates how a business intelligence solution can transition to a cloud database platform while preserving reporting consistency and analytical functionality.

## 2. Migration Scope

The migration included:

- AdventureWorks transactional data required by the reporting solution.
- The `Reporting.DimDate` table.
- Five reporting views:
  - `Reporting.vw_FactSales`
  - `Reporting.vw_DimCustomer`
  - `Reporting.vw_DimProduct`
  - `Reporting.vw_DimSalesTerritory`
  - `Reporting.vw_DimSalesPerson`
- Power BI data-source migration from local SQL Server to Azure SQL Database.
- Semantic model, DAX, dashboard, and data-quality validation.

The existing Power BI semantic model and reporting architecture were retained.

## 3. Solution Architecture

**Before migration:**

Local SQL Server → Reporting Layer → Power BI Semantic Model → Dashboards

**After migration:**

Azure SQL Database → Reporting Layer → Power BI Semantic Model → Dashboards

The Azure reporting layer retained the structure and business logic required by the existing analytical solution.

## 4. Migration Implementation

The required AdventureWorks data was made available in Azure SQL Database.

Reporting objects were recreated using the existing PE-001 SQL scripts, with database-specific `USE` statements disabled where necessary for Azure SQL Database compatibility.

An additional `HumanResources.Employee` table containing the required employee identifiers and current-employee flags was created to support the Salesperson reporting view.

The existing Power BI project's data source was then changed to:

- **Server:** `sql-pe001-retail-analytics.database.windows.net`
- **Database:** `sqldb-pe001-adventureworks`

The existing report pages, relationships, and DAX measures were preserved.

## 5. Local vs Azure Validation

The reporting layer was validated in both environments using equivalent SQL queries.

### 5.1 Reporting Object Counts

| Reporting Object | Validated Rows |
|---|---:|
| Reporting.DimDate | 9,496 |
| Reporting.vw_FactSales | 121,317 |
| Reporting.vw_DimCustomer | 19,820 |
| Reporting.vw_DimProduct | 504 |
| Reporting.vw_DimSalesTerritory | 10 |
| Reporting.vw_DimSalesPerson | 17 |

The local and Azure environments returned matching reporting-object counts.

### 5.2 Sales Reconciliation

The FactSales validation confirmed:

- **First Order Date:** 2011-05-31
- **Last Order Date:** 2014-06-30
- **Total Sales:** Approximately $109.85 million
- **Total Quantity Sold:** 274,914

The consolidated validation also checked customer-type distribution, product-category distribution, and territory and salesperson reporting data.

## 6. Power BI Integration Validation

The existing Power BI project was redirected to Azure SQL Database using Data Source Settings.

After authentication, the data-source changes were applied and a full refresh was completed successfully.

The Executive Dashboard displayed the expected KPIs:

| KPI | Validated Result |
|---|---:|
| Total Sales | $109.8M |
| Total Orders | 31.5K |
| Total Quantity Sold | 274.9K |
| Average Order Value | $3.49K |
| Average Selling Price | $399.57 |
| Latest YoY Growth YTD | 7.4% |

The product, customer, territory, and sales trend visuals continued to display correctly.

## 7. Functional and Data Quality Validation

The Development & Validation page was used to verify the existing semantic model against Azure SQL Database.

The Calendar Year filter was tested using 2013 and subsequently reset to All.

The KPIs and time-intelligence matrices responded correctly to the filter context.

The following data-quality checks were confirmed:

| Validation Check | Result |
|---|---|
| FactSales row count | 121,317 |
| Duplicate fact grain | 0 |
| Missing dimension keys | 0 |
| Orphan dimension references | 0 |
| Invalid sales values | 0 |
| Total Sales reconciliation | MATCH |

The existing DAX measures, including MTD, QTD, YTD, and year-over-year comparisons, remained operational.

## 8. Evidence

The migration and validation evidence is stored in:

`Evidence/Azure-Migration/`

| Evidence File | Description |
|---|---|
| 01_Azure_SQL_Reporting_Objects.png | Azure SQL reporting objects |
| 02_Local_vs_Azure_Validation.png | Local and Azure SQL validation |
| 03_PowerBI_Azure_Connection.png | Power BI Azure SQL connection |
| 04_PowerBI_Azure_Dashboard.png | Executive Dashboard after Azure refresh |
| 05_PowerBI_Data_Quality.png | Power BI data-quality and DAX validation |

## 9. Outcome

**Migration and Integration Status: PASSED**

The PE-001 reporting solution was successfully migrated to Azure SQL Database and validated against the original local SQL Server implementation.

The Power BI solution continued to function with its existing semantic model, DAX measures, and dashboard visuals.

This phase demonstrates practical experience in SQL Server reporting-layer migration, Azure SQL Database integration, data reconciliation, and Power BI validation.

## 10. Consultant's Reflection

A database migration should not be considered complete simply because the target database is accessible.

A successful analytical migration must also preserve data accuracy, reporting logic, semantic-model compatibility, and business-facing functionality.

**Key Takeaway:** Cloud migration delivers business value when existing analytical capabilities remain reliable and usable after the transition.
