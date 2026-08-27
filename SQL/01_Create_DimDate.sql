/*
===============================================================================
Project      : Project Elevate
Project ID   : PE-001
Script Name  : 01_Create_DimDate.sql
Author       : Borko Premetarov
Purpose      : Create the Reporting.DimDate table for analytical reporting.
Database     : AdventureWorks2022
SQL Version  : Microsoft SQL Server 2022
Version      : 1.0
Created      : 2026-08-27

Description:
Creates the Date Dimension table used throughout the analytical reporting
solution. The table provides standardized calendar attributes that support
time intelligence calculations in SQL Server and Power BI.

Dependencies:
- AdventureWorks2022
- Reporting schema
- PE-001_SD-001_Date_Dimension_Design.md

===============================================================================
*/

USE AdventureWorks2022;
GO

-- Drop the table if it already exists
IF OBJECT_ID('Reporting.DimDate', 'U') IS NOT NULL
BEGIN
    DROP TABLE Reporting.DimDate;
END;
GO

CREATE TABLE Reporting.DimDate
(
    DateKey         INT            NOT NULL,
    FullDate        DATE           NOT NULL,

    CalendarYear    SMALLINT       NOT NULL,
    CalendarQuarter TINYINT        NOT NULL,
    CalendarMonth   TINYINT        NOT NULL,
    MonthName       NVARCHAR(20)   NOT NULL,

    WeekNumber      TINYINT        NOT NULL,

    DayOfMonth      TINYINT        NOT NULL,
    DayOfWeek       TINYINT        NOT NULL,
    DayName         NVARCHAR(20)   NOT NULL,

    IsWeekend       BIT            NOT NULL,

    CONSTRAINT PK_DimDate
        PRIMARY KEY CLUSTERED (DateKey)
);
GO