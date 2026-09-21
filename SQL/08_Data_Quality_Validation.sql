/* =====================================================================
   Project: PE-001 | Project Elevate – Retail Analytics
   Script : 07_Data_Quality_Validation.sql
   Purpose:
       Validate the quality, integrity, and reconciliation of the
       reporting dataset used by the Power BI semantic model.

   Validation Scope:
       01. FactSales Row Count
       02. Duplicate Fact Grain
       03. Missing Dimension References
       04. Orphan Dimension References
       05. Invalid Sales Values
       06. Total Sales Reconciliation

   Source:
       AdventureWorks2022

   Reporting Layer:
       Reporting.vw_FactSales
       Reporting.DimDate
       Reporting.vw_DimCustomer
       Reporting.vw_DimProduct
       Reporting.vw_DimSalesTerritory

   Project: Project Elevate
   Case Study: PE-001
   ===================================================================== */


-- =====================================================================
-- CHECK 01: FACTSALES ROW COUNT
-- Purpose:
-- Confirm the number of rows exposed to the Power BI fact table.
-- Expected result for current dataset: 121,317
-- =====================================================================

SELECT
    COUNT(*) AS FactSalesRowCount
FROM Reporting.vw_FactSales;


-- =====================================================================
-- CHECK 02: DUPLICATE FACT GRAIN
-- Purpose:
-- Confirm that the expected fact grain
-- (SalesOrderID + SalesOrderDetailID) is unique.
-- Expected result: 0 rows
-- =====================================================================

SELECT
    SalesOrderID,
    SalesOrderDetailID,
    COUNT(*) AS DuplicateCount
FROM Reporting.vw_FactSales
GROUP BY
    SalesOrderID,
    SalesOrderDetailID
HAVING COUNT(*) > 1;


-- =====================================================================
-- CHECK 03: MISSING DIMENSION REFERENCES
-- Purpose:
-- Identify NULL dimension references in the Power BI fact dataset.
-- Expected result: 0 for all checks
-- =====================================================================

SELECT
    SUM(CASE WHEN OrderDate IS NULL THEN 1 ELSE 0 END)
        AS MissingOrderDate,

    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END)
        AS MissingCustomerID,

    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END)
        AS MissingProductID,

    SUM(CASE WHEN TerritoryID IS NULL THEN 1 ELSE 0 END)
        AS MissingTerritoryID
FROM Reporting.vw_FactSales;


-- =====================================================================
-- CHECK 04: ORPHAN DIMENSION REFERENCES
-- Purpose:
-- Identify fact rows that do not have a matching record
-- in the corresponding reporting dimension.
-- Expected result: 0 for all checks
-- =====================================================================

SELECT
    SUM(CASE WHEN d.FullDate IS NULL THEN 1 ELSE 0 END)
        AS OrphanDate,

    SUM(CASE WHEN c.CustomerID IS NULL THEN 1 ELSE 0 END)
        AS OrphanCustomer,

    SUM(CASE WHEN p.ProductID IS NULL THEN 1 ELSE 0 END)
        AS OrphanProduct,

    SUM(CASE WHEN t.TerritoryID IS NULL THEN 1 ELSE 0 END)
        AS OrphanTerritory

FROM Reporting.vw_FactSales AS f

LEFT JOIN Reporting.DimDate AS d
    ON f.OrderDate = d.FullDate

LEFT JOIN Reporting.vw_DimCustomer AS c
    ON f.CustomerID = c.CustomerID

LEFT JOIN Reporting.vw_DimProduct AS p
    ON f.ProductID = p.ProductID

LEFT JOIN Reporting.vw_DimSalesTerritory AS t
    ON f.TerritoryID = t.TerritoryID;


-- =====================================================================
-- CHECK 05: INVALID SALES VALUES
-- Purpose:
-- Identify invalid or unexpected numeric values
-- in the Power BI fact dataset.
-- Expected result: 0 for all checks
-- =====================================================================

SELECT
    SUM(CASE WHEN OrderQty <= 0 THEN 1 ELSE 0 END)
        AS InvalidOrderQty,

    SUM(CASE WHEN UnitPrice < 0 THEN 1 ELSE 0 END)
        AS NegativeUnitPrice,

    SUM(
        CASE
            WHEN UnitPriceDiscount < 0
              OR UnitPriceDiscount > 1
            THEN 1
            ELSE 0
        END
    ) AS InvalidDiscount,

    SUM(CASE WHEN LineTotal < 0 THEN 1 ELSE 0 END)
        AS NegativeLineTotal
FROM Reporting.vw_FactSales;


-- =====================================================================
-- CHECK 06: TOTAL SALES RECONCILIATION
-- Purpose:
-- Validate the core Total Sales KPI against the reporting
-- fact dataset used by Power BI.
--
-- SQL result:
--     109,846,381.399888
--
-- Expected Power BI result:
--     109,846,381.40
--
-- Difference is due only to currency display rounding.
-- =====================================================================

SELECT
    SUM(LineTotal) AS SQLTotalSales
FROM Reporting.vw_FactSales;


/* =====================================================================
   VALIDATION SUMMARY

   Check 01 | FactSales Row Count
            | Result: 121,317 rows
            | Status: PASS

   Check 02 | Duplicate Fact Grain
            | Result: 0 duplicate grain combinations
            | Status: PASS

   Check 03 | Missing Dimension References
            | Result: 0 missing references
            | Status: PASS

   Check 04 | Orphan Dimension References
            | Result: 0 orphan references
            | Status: PASS

   Check 05 | Invalid Sales Values
            | Result: 0 invalid values
            | Status: PASS

   Check 06 | Total Sales Reconciliation
            | SQL:       109,846,381.399888
            | Power BI:  109,846,381.40
            | Status: PASS after currency rounding

   Overall Validation Status: PASS

   Conclusion:
       The PE-001 reporting dataset passed the defined data-quality,
       integrity, and KPI reconciliation checks and is suitable for
       use by the Power BI semantic model.

   ===================================================================== */