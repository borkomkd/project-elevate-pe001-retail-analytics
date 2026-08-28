/*
===============================================================================
Project      : Project Elevate
Project ID   : PE-001
Script Name  : 04_Create_vw_DimCustomer.sql
Author       : Borko Premetarov
Purpose      : Create the Reporting.vw_DimCustomer view.
Database     : AdventureWorks2022
SQL Version  : Microsoft SQL Server 2022
Version      : 1.0
Created      : 2026-08-28

Description:
Creates a reporting-friendly customer dimension view by combining
customer, person, and store information into a single reusable object.

Dependencies:
- AdventureWorks2022
- Reporting schema
- PE-001_SD-003_DimCustomer_Design.md
===============================================================================
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('Reporting.vw_DimCustomer', 'V') IS NOT NULL
BEGIN
    DROP VIEW Reporting.vw_DimCustomer;
END;
GO

CREATE VIEW Reporting.vw_DimCustomer
AS

SELECT

    c.CustomerID,

    c.AccountNumber,

    CASE
        WHEN c.PersonID IS NOT NULL THEN 'Individual'
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        ELSE 'Unknown'
    END AS CustomerType,

    COALESCE(
        CONCAT(p.FirstName, ' ', p.LastName),
        s.Name
    ) AS CustomerName,

    c.TerritoryID,

    CAST(1 AS BIT) AS IsActive

FROM Sales.Customer AS c

LEFT JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID

LEFT JOIN Sales.Store AS s
    ON c.StoreID = s.BusinessEntityID;
GO