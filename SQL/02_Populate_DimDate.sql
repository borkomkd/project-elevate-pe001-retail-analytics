/*
===============================================================================
Project      : Project Elevate
Project ID   : PE-001
Script Name  : 02_Populate_DimDate.sql
Author       : Borko Premetarov
Purpose      : Populate the Reporting.DimDate table.
Database     : AdventureWorks2022
SQL Version  : Microsoft SQL Server 2022
Version      : 1.0
Created      : 2026-08-28

Description:
Populates the Reporting.DimDate table using a set-based approach.
The script generates one row per calendar day and calculates
standard calendar attributes for analytical reporting.

Dependencies:
- AdventureWorks2022
- Reporting.DimDate
- 01_Create_DimDate.sql

===============================================================================
*/

USE AdventureWorks2022;
GO
SET DATEFIRST 1;
------------------------------------------------------------
-- Configuration
------------------------------------------------------------

DECLARE @StartDate DATE = '2010-01-01';
DECLARE @EndDate   DATE = '2035-12-31';

------------------------------------------------------------
-- Prevent duplicate data
------------------------------------------------------------

TRUNCATE TABLE Reporting.DimDate;

------------------------------------------------------------
-- Generate calendar dates
------------------------------------------------------------

;WITH Numbers AS
(
    SELECT TOP (DATEDIFF(DAY, @StartDate, @EndDate) + 1)
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS Number
    FROM sys.all_objects AS a
    CROSS JOIN sys.all_objects AS b
),
Dates AS
(
    SELECT DATEADD(DAY, Number, @StartDate) AS CalendarDate
    FROM Numbers
)

------------------------------------------------------------
-- Populate Date Dimension
------------------------------------------------------------

INSERT INTO Reporting.DimDate
(
    DateKey,
    FullDate,
    CalendarYear,
    CalendarQuarter,
    CalendarMonth,
    MonthName,
    WeekNumber,
    DayOfMonth,
    DayOfWeek,
    DayName,
    IsWeekend
)

SELECT

    CONVERT(INT, CONVERT(CHAR(8), CalendarDate, 112))      AS DateKey,
    CalendarDate                                            AS FullDate,

    YEAR(CalendarDate)                                      AS CalendarYear,
    DATEPART(QUARTER, CalendarDate)                         AS CalendarQuarter,
    MONTH(CalendarDate)                                     AS CalendarMonth,
    DATENAME(MONTH, CalendarDate)                           AS MonthName,

    DATEPART(ISO_WEEK, CalendarDate)                        AS WeekNumber,

    DAY(CalendarDate)                                       AS DayOfMonth,
    DATEPART(WEEKDAY, CalendarDate)                         AS DayOfWeek,
    DATENAME(WEEKDAY, CalendarDate)                         AS DayName,

    CASE
        WHEN DATENAME(WEEKDAY, CalendarDate) IN ('Saturday','Sunday')
        THEN 1
        ELSE 0
    END                                                     AS IsWeekend

FROM Dates
ORDER BY CalendarDate;

GO

------------------------------------------------------------
-- Validation
------------------------------------------------------------

PRINT 'DimDate successfully populated.';
PRINT '';

SELECT COUNT(*) AS TotalRows
FROM Reporting.DimDate;

SELECT
    MIN(FullDate) AS FirstDate,
    MAX(FullDate) AS LastDate
FROM Reporting.DimDate;

SELECT TOP (10) *
FROM Reporting.DimDate
ORDER BY FullDate;