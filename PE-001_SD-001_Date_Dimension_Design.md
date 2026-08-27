# PE-001_SD-001 – Date Dimension Design

## Solution Design Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Design Document | SD-001 |
| Component | Date Dimension |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to define the design of the Date Dimension (`DimDate`) that will support analytical reporting throughout Project Elevate.

A dedicated Date Dimension provides a consistent foundation for time-based analysis, enables advanced Business Intelligence calculations, and simplifies report development in Power BI.

---

# Business Rationale

Business users frequently analyze information over time.

Typical questions include:

- How did sales perform this month compared to last month?
- What is the year-over-year revenue growth?
- Which quarter generated the highest revenue?
- What are the sales trends by month?
- Are weekend sales different from weekday sales?

Answering these questions efficiently requires a standardized Date Dimension.

---

# Design Objectives

The Date Dimension has been designed to:

- Support consistent time intelligence calculations.
- Simplify Power BI report development.
- Standardize calendar attributes.
- Eliminate repeated date calculations in reports.
- Improve analytical query performance.

---

# Proposed Structure

The Date Dimension will contain one record for every calendar date within the selected reporting period.

Each record represents a single day.

---

# Proposed Attributes

| Column | Description |
|---------|-------------|
| DateKey | Integer surrogate key (YYYYMMDD). |
| FullDate | Calendar date. |
| Day | Day of the month. |
| DayName | Name of the day (Monday, Tuesday, etc.). |
| DayOfWeek | Numeric day of week. |
| WeekNumber | Week of the year. |
| Month | Month number. |
| MonthName | Full month name. |
| Quarter | Quarter of the year. |
| Year | Calendar year. |
| IsWeekend | Indicates weekend (Yes/No). |

Future versions may include:

- Fiscal Year
- Fiscal Quarter
- Fiscal Month
- Holiday Indicator
- Working Day Indicator

---

# Primary Key

The table will use:

**DateKey**

Example:

| Date | DateKey |
|------|---------|
| 2025-01-01 | 20250101 |
| 2025-01-02 | 20250102 |

Using an integer key improves readability and aligns with common dimensional modeling practices.

---

# Expected Relationships

The Date Dimension will have a one-to-many relationship with the FactSales table.

```text
DimDate (1)
      │
      │
      ▼
FactSales (Many)
```

Every sales transaction will reference a single reporting date.

---

# Design Decisions

| Decision | Reason |
|----------|--------|
| Create a dedicated Date Dimension | Supports consistent time-based analysis. |
| Use a surrogate integer key | Simplifies joins and follows dimensional modeling best practices. |
| Store descriptive calendar attributes | Reduces repetitive calculations in Power BI. |
| Separate calendar logic from reports | Improves maintainability and consistency. |

---

# Expected Benefits

Implementing a dedicated Date Dimension provides:

- Faster report development.
- Consistent KPI calculations.
- Simplified DAX measures.
- Better query performance.
- Standardized time intelligence.
- Reusable reporting logic.

---

# Consultant's Perspective

Although a Date Dimension may appear simple, it is one of the most important components of a Business Intelligence solution.

A well-designed Date Dimension ensures that every report uses the same calendar definitions, enabling consistent analysis across departments and reducing maintenance effort over time.

---

# Related Implementation

This design will be implemented in the following SQL script:

`SQL-Scripts/01_Create_DimDate.sql`

---

# Next Design Document

**PE-001_SD-002_FactSales_Design.md**

---

# Document Relationships

## Related Consulting Document

- PE-001_08_Data_Model_Design.md
- PE-001_09_SQL_Server_Implementation.md

## Related SQL Script

- 01_Create_DimDate.sql
