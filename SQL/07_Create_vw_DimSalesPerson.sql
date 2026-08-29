/*
===============================================================================
Project      : Project Elevate
Project ID   : PE-001
Script Name  : 07_Create_vw_DimSalesPerson.sql
Author       : Borko Premetarov
Purpose      : Create the Reporting.vw_DimSalesPerson view.
Database     : AdventureWorks2022
SQL Version  : Microsoft SQL Server 2022
Version      : 1.0
Created      : 2026-08-29

Description:
Creates a reporting-friendly Sales Person Dimension by combining
sales performance and employee information.

Dependencies:
- AdventureWorks2022
- Reporting schema
- PE-001_SD-006_DimSalesPerson_Design.md
===============================================================================
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('Reporting.vw_DimSalesPerson', 'V') IS NOT NULL
BEGIN
    DROP VIEW Reporting.vw_DimSalesPerson;
END;
GO

CREATE VIEW Reporting.vw_DimSalesPerson
AS

SELECT

    sp.BusinessEntityID AS SalesPersonID,

    TRIM(CONCAT(pp.FirstName, ' ', pp.LastName)) AS EmployeeName,

    sp.TerritoryID,

    sp.SalesQuota,

    sp.Bonus,

    sp.CommissionPct,

    sp.SalesYTD,

    sp.SalesLastYear,

    CAST(
        CASE
            WHEN e.CurrentFlag = 1 THEN 1
            ELSE 0
        END
    AS BIT) AS IsCurrentEmployee

FROM Sales.SalesPerson AS sp

INNER JOIN HumanResources.Employee AS e
    ON sp.BusinessEntityID = e.BusinessEntityID

INNER JOIN Person.Person AS pp
    ON e.BusinessEntityID = pp.BusinessEntityID;
GO