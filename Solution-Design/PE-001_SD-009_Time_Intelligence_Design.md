# PE-001_SD-009_Time_Intelligence_Design

## Project

Project Elevate (PE-001)

---

## Document Purpose

This document defines the Time Intelligence strategy used within the Power BI Semantic Model.

Time Intelligence measures enable business users to analyze sales performance across different time periods, identify trends, compare historical performance, and monitor organizational growth.

The design described in this document serves as the blueprint for implementing reusable DAX measures that support executive dashboards and analytical reporting.

---

# Business Objectives

The Time Intelligence layer enables business users to answer questions such as:

- How much have we sold this year?
- How is this month performing?
- How does this quarter compare to previous quarters?
- How do current sales compare to last year?
- Are sales growing or declining over time?

These measures provide historical context and support data-driven decision making.

---

# Prerequisites

The following prerequisites must be satisfied before implementing Time Intelligence measures.

## Date Dimension

The semantic model contains a dedicated Date Dimension.

Table:

DimDate

---

## Date Table

DimDate has been marked as the official Date Table in Power BI.

---

## Relationships

FactSales is related to DimDate through:

FactSales[OrderDate]
        ↓
DimDate[Date]

The relationship is:

- One-to-Many
- Single Direction
- Active

---

## Base Measures

The following foundational measures already exist.

- Total Sales
- Total Orders
- Total Quantity Sold

All Time Intelligence measures will be built upon these reusable measures.

---

# Time Intelligence Strategy

Rather than calculating values directly from FactSales, all calculations will reference existing base measures.

Example:

Sales YTD

↓

uses

↓

Total Sales

This layered design improves maintainability and ensures consistent business logic throughout the semantic model.

---

# Planned Measures

The following measures will be implemented.

## Year-to-Date

Sales YTD

Purpose

Returns cumulative sales from the beginning of the current year through the selected date.

---

## Month-to-Date

Sales MTD

Purpose

Returns cumulative sales for the current month through the selected date.

---

## Quarter-to-Date

Sales QTD

Purpose

Returns cumulative sales for the current quarter through the selected date.

---

## Previous Year

Sales Last Year

Purpose

Returns Total Sales for the equivalent period in the previous year.

---

## Year-over-Year Growth

YoY Growth %

Purpose

Measures percentage growth compared to the same period in the previous year.

---

## Rolling 12 Months

Rolling 12 Months Sales

Purpose

Returns sales accumulated over the previous twelve months, regardless of calendar year boundaries.

---

# Design Decisions

## Decision 1

Use built-in DAX Time Intelligence functions whenever appropriate.

Reason

They improve readability, reduce implementation complexity, and align with Microsoft best practices.

---

## Decision 2

Always reference existing base measures.

Reason

Avoid duplicated aggregation logic and ensure calculation consistency.

---

## Decision 3

Perform all calculations using DimDate.

Reason

A dedicated Date Dimension provides accurate filtering, supports continuous calendars, and enables reliable time-based analysis.

---

## Decision 4

Use DIVIDE() for percentage calculations.

Reason

Prevents division-by-zero errors and returns BLANK() when appropriate.

---

# Expected Business Value

The Time Intelligence layer enables executives and analysts to:

- Monitor business growth
- Compare current and historical performance
- Track monthly, quarterly, and yearly trends
- Evaluate seasonal patterns
- Support strategic planning and forecasting

---

# Future Enhancements

Future versions of Project Elevate may include:

- Previous Month Sales
- Previous Quarter Sales
- Previous Year-to-Date
- Moving Average
- Running Total by Fiscal Calendar
- Custom Fiscal Year Support
- Dynamic Date Comparison

---

# Implementation Artifacts

After approval of this design, the following implementation will be created.

Power BI

MeasuresBI

Pack 3

- Sales YTD
- Sales MTD
- Sales QTD
- Sales Last Year
- YoY Growth %
- Rolling 12 Months Sales

---

# Document Relationships

Previous

PE-001_SD-008_DAX_Measures_Design.md

Next

Implementation:
DAX Measure Pack 3 – Time Intelligence
