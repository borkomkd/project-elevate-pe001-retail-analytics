/*
===============================================================================
Project      : Project Elevate
Project ID   : PE-001
Script Name  : 06_Create_vw_DimSalesTerritory.sql
Author       : Borko Premetarov
Purpose      : Create the Reporting.vw_DimSalesTerritory view.
Database     : AdventureWorks2022
SQL Version  : Microsoft SQL Server 2022
Version      : 1.0
Created      : 2026-08-29

Description:
Creates a reporting-friendly sales territory dimension view
for geographical analysis.

Dependencies:
- AdventureWorks2022
- Reporting schema
- PE-001_SD-005_DimSalesTerritory_Design.md
===============================================================================
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('Reporting.vw_DimSalesTerritory', 'V') IS NOT NULL
BEGIN
    DROP VIEW Reporting.vw_DimSalesTerritory;
END;
GO

CREATE VIEW Reporting.vw_DimSalesTerritory
AS

SELECT

    TerritoryID,

    Name AS TerritoryName,

    ISNULL(CountryRegionCode, 'Unknown') AS CountryRegion,

    ISNULL([Group], 'Unknown') AS SalesGroup

FROM Sales.SalesTerritory;
GO