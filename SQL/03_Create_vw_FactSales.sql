/*
===============================================================================
Project      : Project Elevate
Project ID   : PE-001
Script Name  : 03_Create_vw_FactSales.sql
Author       : Borko Premetarov
Purpose      : Create the Reporting.vw_FactSales view.
Database     : AdventureWorks2022
SQL Version  : Microsoft SQL Server 2022
Version      : 1.0
Created      : 2026-08-28

Description:
Creates the central reporting view that consolidates sales transactions
from AdventureWorks into a reporting-friendly structure.

Dependencies:
- AdventureWorks2022
- Reporting schema
- PE-001_SD-002_FactSales_Design.md

===============================================================================
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('Reporting.vw_FactSales', 'V') IS NOT NULL
BEGIN
    DROP VIEW Reporting.vw_FactSales;
END;
GO

CREATE VIEW Reporting.vw_FactSales
AS

SELECT

    soh.SalesOrderID,
    sod.SalesOrderDetailID,

    soh.OrderDate,

    soh.CustomerID,

    sod.ProductID,

    soh.TerritoryID,

    soh.SalesPersonID,

    sod.OrderQty,

    sod.UnitPrice,

    sod.UnitPriceDiscount,

    sod.LineTotal

FROM Sales.SalesOrderHeader AS soh

INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID;
GO