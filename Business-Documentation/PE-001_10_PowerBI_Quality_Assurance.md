# PE-001 — Power BI Quality Assurance

**Project:** Project Elevate — PE-001 Retail Analytics  
**Document:** PE-001_10_PowerBI_Quality_Assurance  
**Solution:** AdventureWorks Retail Analytics  
**Platform:** Microsoft SQL Server | Power BI  
**Status:** QA Completed  
**QA Result:** PASS  

---

## 1. Purpose

The purpose of this document is to record the quality assurance activities performed on the PE-001 Power BI reporting solution.

The QA process validates that:

- the reporting dataset is structurally reliable;
- core business KPIs return consistent results;
- Power BI filters propagate correctly;
- report visuals respond correctly to analytical context;
- drill-through functionality preserves the required context;
- report navigation behaves as expected;
- Power BI results reconcile with the SQL reporting layer.

The objective is to provide documented evidence that the reporting solution is reliable for analytical use and portfolio demonstration.

---

## 2. QA Scope

The QA process covered the four main report pages of the PE-001 Power BI solution.

| Report Page | Validation Focus |
|---|---|
| Executive Dashboard | Executive KPIs, trends, filters and visual interactions |
| Operational Dashboard | Operational analysis, combined filters and cross-highlighting |
| Product Detail | Product-level drill-through and contextual analysis |
| Development & Validation | Measure validation, time intelligence and data-quality controls |

Testing was performed across the Power BI semantic model, DAX measures, report visuals and the underlying SQL reporting dataset.

---

## 3. SQL Data Quality Validation

A dedicated SQL validation script was created to verify the integrity of the reporting dataset before completing Power BI functional QA.

**SQL Artifact:** `SQL/08_Data_Quality_Validation.sql`

Six validation checks were implemented.

### Check 01 — Fact Sales Row Count

**Purpose:**  
Confirm the number of rows available in the reporting fact dataset.

**Result:**

`121,317` fact rows validated.

**Status:** ✓ VALIDATED

---

### Check 02 — Duplicate Fact Grain

**Purpose:**  
Identify duplicate records at the expected fact-table grain.

**Result:**

`0` duplicate rows identified.

**Status:** ✓ PASS

---

### Check 03 — Missing Dimension Keys

**Purpose:**  
Identify NULL dimension references within the Power BI fact dataset.

The validation covered:

- Order Date
- Customer
- Product
- Sales Territory

**Result:**

`0` missing dimension references identified.

**Status:** ✓ PASS

---

### Check 04 — Orphan Dimension References

**Purpose:**  
Identify fact records that do not have a corresponding record in the reporting dimensions.

The validation covered:

- Date
- Customer
- Product
- Sales Territory

**Result:**

`0` orphan dimension references identified.

**Status:** ✓ PASS

---

### Check 05 — Invalid Sales Values

**Purpose:**  
Identify invalid business values within the sales dataset.

**Result:**

`0` invalid sales values identified.

**Status:** ✓ PASS

---

### Check 06 — Total Sales Reconciliation

**Purpose:**  
Validate the core Total Sales KPI against the SQL reporting fact dataset used by Power BI.

SQL validation returned approximately:

`$109.85M`

The Power BI Total Sales KPI reconciled with the SQL reporting dataset.

**Status:** ✓ MATCH

---

## 4. KPI and Measure Validation

Core business measures were tested across multiple report contexts.

The validated KPI set included:

- Total Sales
- Total Orders
- Total Quantity Sold
- Total Customers
- Average Order Value
- Average Selling Price

The following time-intelligence measures were also reviewed during report development and QA:

- Sales MTD
- Sales QTD
- Sales YTD
- Sales Last Year
- YoY Growth %
- Rolling 12 Months Sales
- Latest Sales Date
- Latest YoY Growth YTD %

The measures responded to the expected report filter context during the tested scenarios.

**Status:** ✓ PASS

---

## 5. Filter and Context Validation

The main analytical filters were tested individually and in combination.

Filters included:

- Calendar Year
- Sales Territory
- Product Category
- Customer Type

Example combined scenarios included:

- Calendar Year + Sales Territory
- Calendar Year + Product Category
- Calendar Year + Sales Territory + Product Category
- Calendar Year + Sales Territory + Product Category + Customer Type

A representative multi-filter scenario tested:

`2013 + Canada + Bikes + Individual`

The report KPIs and analytical visuals updated consistently under the applied filter context.

Customer Type behavior was additionally checked against the reporting data to confirm that the displayed values were consistent with the available customer classification.

**Status:** ✓ PASS

---

## 6. Executive Dashboard QA

The Executive Sales Dashboard was tested for:

- KPI responsiveness;
- Calendar Year filtering;
- Sales Territory filtering;
- Product Category filtering;
- Customer Type filtering;
- combined filter contexts;
- sales trend behavior;
- Top Products analysis;
- Top Customers analysis;
- Territory analysis;
- cross-highlighting between visuals.

The dashboard responded correctly to the tested analytical contexts.

The executive time-intelligence KPI was labelled:

**Latest YoY Growth YTD %**

This naming reflects the calculation's purpose more clearly for report users.

**Status:** ✓ PASS

---

## 7. Operational Dashboard QA

The Operational Dashboard was tested using progressively more detailed filter contexts.

Testing included:

`2013`

followed by:

`2013 + Canada`

then:

`2013 + Canada + Bikes`

and finally:

`2013 + Canada + Bikes + Individual`

The following report components responded to the active analytical context:

- Total Sales
- Total Orders
- Total Quantity Sold
- Sales Performance Trend
- Product Performance
- Salesperson Performance
- Territory Performance
- Customer Performance

Cross-highlighting behavior was also tested between operational visuals.

The selected visual context was reflected across related report visuals as expected.

**Status:** ✓ PASS

---

## 8. Product Drill-Through Validation

Product-level drill-through was tested from the analytical dashboards to the Product Detail page.

Example product:

`Mountain-200 Black, 38`

The drill-through workflow was:

`Dashboard → Product Selection → Drill Through → Product Detail`

The Product Detail page correctly received the selected product context.

The page displayed contextual results for:

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Selling Price
- Sales Performance Over Time
- Sales by Territory
- Sales by Customer Type
- Top Customers

**Status:** ✓ PASS

---

## 9. Multi-Context Drill-Through Validation

Drill-through was also tested while additional analytical filters were active.

Representative context:

`Calendar Year = 2013`

`Sales Territory = Canada`

`Product = Mountain-200 Black, 38`

The Product Detail page retained the relevant Product, Calendar Year and Sales Territory context.

The resulting Product Detail KPIs and visuals reflected the inherited analytical context.

This confirmed that drill-through works not only for product selection, but also within a filtered business-analysis scenario.

**Status:** ✓ PASS

---

## 10. Back Navigation Validation

Navigation from Product Detail back to the source analytical page was tested.

Test workflow:

`Operational Dashboard`

→ apply `2013 + Canada`

→ select a product

→ drill through to `Product Detail`

→ review contextual analysis

→ select the **Back** navigation control

Power BI returned to the Operational Dashboard with the previous analytical context preserved.

This confirms that users can move from summary analysis to detailed product analysis and return without losing their previous analytical context.

**Status:** ✓ PASS

---

## 11. Development & Validation Page

A dedicated **Development & Validation** page was included in the Power BI solution to make model validation visible within the report.

The page contains:

### KPI Validation

- Total Sales
- Total Orders
- Total Quantity Sold
- Total Customers

### Time Intelligence Validation

- YoY Validation
- MTD / QTD / YTD Validation

### Data Quality Validation

Six compact validation cards communicate the results of the SQL QA process:

1. Fact Sales Row Count
2. Duplicate Fact Grain
3. Missing Dimension Keys
4. Orphan Dimension References
5. Invalid Sales Values
6. Total Sales Reconciliation

This page provides a transparent validation layer demonstrating how the analytical solution was checked before final delivery.

---

## 12. QA Results Summary

| # | QA Area | Result |
|---|---|---|
| 01 | Fact Sales Row Count | ✓ VALIDATED |
| 02 | Duplicate Fact Grain | ✓ PASS |
| 03 | Missing Dimension Keys | ✓ PASS |
| 04 | Orphan Dimension References | ✓ PASS |
| 05 | Invalid Sales Values | ✓ PASS |
| 06 | SQL / Power BI Sales Reconciliation | ✓ MATCH |
| 07 | Core KPI Measures | ✓ PASS |
| 08 | Time Intelligence | ✓ PASS |
| 09 | Calendar Year Filtering | ✓ PASS |
| 10 | Sales Territory Filtering | ✓ PASS |
| 11 | Product Category Filtering | ✓ PASS |
| 12 | Customer Type Filtering | ✓ PASS |
| 13 | Combined Filter Context | ✓ PASS |
| 14 | Visual Cross-Highlighting | ✓ PASS |
| 15 | Product Drill-Through | ✓ PASS |
| 16 | Multi-Context Drill-Through | ✓ PASS |
| 17 | Back Navigation / Context Preservation | ✓ PASS |

---

## 13. Final QA Conclusion

The PE-001 Power BI solution successfully completed the defined functional and data-quality QA activities.

The validation process demonstrated that:

- the reporting fact dataset contains no identified duplicate-grain records;
- required dimension references are populated;
- no tested orphan dimension references were identified;
- no tested invalid sales values were identified;
- the Power BI Total Sales KPI reconciles with the SQL reporting layer;
- core KPIs respond correctly to the tested analytical filters;
- combined filter contexts propagate across the report;
- visual interactions behave as expected;
- product drill-through preserves the required analytical context;
- back navigation restores the previous analytical state.

**Overall QA Result: PASS**

The PE-001 Power BI reporting solution is therefore considered validated for the scope defined in this document.

---

## 14. Consultant's Reflection

Quality assurance should not be treated as a final visual inspection of a dashboard.

A reliable BI solution requires validation across multiple layers:

**Source Data → Reporting Dataset → Semantic Model → DAX Measures → Filters → Visuals → User Navigation**

PE-001 applies this principle by combining SQL-based data-quality controls with Power BI functional testing.

This provides stronger evidence that the dashboard is not only visually complete, but that its analytical behavior can be traced back to a validated reporting dataset.

### Key Takeaway

> A professional BI solution should demonstrate not only what the data says, but also why users can trust the result.

---

**Document Status:** Completed  
**QA Status:** PASS  
**Project:** PE-001 — Project Elevate
