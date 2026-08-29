/*
===============================================================================
Project      : Project Elevate
Project ID   : PE-001
Script Name  : 05_Create_vw_DimProduct.sql
Author       : Borko Premetarov
Purpose      : Create the Reporting.vw_DimProduct view.
Database     : AdventureWorks2022
SQL Version  : Microsoft SQL Server 2022
Version      : 1.0
Created      : 2026-08-29

Description:
Creates a reporting-friendly product dimension by combining product,
subcategory, and category information into a single reusable view.

Dependencies:
- AdventureWorks2022
- Reporting schema
- PE-001_SD-004_DimProduct_Design.md
===============================================================================
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('Reporting.vw_DimProduct', 'V') IS NOT NULL
BEGIN
    DROP VIEW Reporting.vw_DimProduct;
END;
GO

CREATE VIEW Reporting.vw_DimProduct
AS

SELECT

    p.ProductID,

    p.Name AS ProductName,

    p.ProductNumber,

    ISNULL(pc.Name, 'Uncategorized') AS ProductCategory,

    ISNULL(ps.Name, 'No Subcategory') AS ProductSubcategory,

    p.Color,

    p.Size,

    p.StandardCost,

    p.ListPrice,

    p.SellStartDate,

    p.SellEndDate,

    CAST(
        CASE
            WHEN p.SellEndDate IS NULL THEN 1
            ELSE 0
        END
    AS BIT) AS IsActive

FROM Production.Product AS p

LEFT JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID

LEFT JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID;
GO