# PE-001_SD-011 — Operational Dashboard Design

1. Purpose
2. Target Users
3. Operational Business Context
4. Business Questions
5. Operational Decisions Supported
6. KPI Requirements
7. Dashboard Information Architecture
8. Visual Design
9. Filtering and Interactions
10. Drill-Down / Drill-Through
11. Data Requirements
12. Performance Considerations
13. Usability Considerations
14. Assumptions and Constraints
15. Relationship to Executive Dashboard
16. Design Decisions
17. Key Takeaway

## 1. Purpose

The purpose of the Operational Dashboard is to provide sales and operational users with a detailed, interactive view of sales performance that supports day-to-day monitoring, investigation, and decision-making.

Unlike the Executive Dashboard, which provides a high-level view of overall business performance, the Operational Dashboard focuses on identifying performance differences, trends, and areas that require further investigation or action.

The dashboard will enable operational users to:

- Monitor sales performance across products, customers, territories, and salespeople.
- Identify areas of strong or weak sales performance.
- Investigate changes in sales over time.
- Compare performance across relevant business dimensions.
- Support data-driven operational decisions.

The dashboard is designed as an analytical and monitoring tool rather than a transactional operational system.

## 2. Target Users

The Operational Dashboard is primarily intended for users responsible for monitoring and managing day-to-day sales performance.

### Primary Users

- Sales Managers
- Regional Sales Managers
- Sales Operations users
- Business Analysts supporting sales operations

### Secondary Users

- Department Managers
- Business stakeholders requiring detailed sales performance analysis

The dashboard is designed for users who require more detailed analysis than is provided by the Executive Dashboard and who may need to investigate specific products, customers, territories, salespeople, or periods.

## 3. Operational Business Context

Sales performance can vary significantly across products, customers, territories, salespeople, and time periods.

While the Executive Dashboard provides management with a high-level overview of sales performance, operational users require greater detail to understand where performance differences occur and what areas may require attention.

The Operational Dashboard therefore provides a more granular analytical view of the sales data model developed for PE-001.

The dashboard will use the same governed Power BI semantic model established for the project, including the core sales fact and supporting dimensions for:

- Date
- Customer
- Product
- Sales Territory
- Salesperson

This approach ensures that operational analysis is based on the same definitions and business logic used by the Executive Dashboard.

## 4. Business Questions

The Operational Dashboard should help users answer the following questions:

### Sales Performance

- How are sales performing over time?
- Which periods show significant changes in sales performance?
- How does current performance compare with the previous period or previous year?

### Product Performance

- Which products generate the highest sales?
- Which products have relatively weak sales performance?
- How does product performance differ across product categories?

### Customer Performance

- Which customers contribute the most to sales?
- How is sales performance distributed across customers?
- Are there significant differences between customer types?

### Territory Performance

- Which sales territories generate the highest sales?
- Which territories show weaker performance?
- How does sales performance differ across territories?

### Salesperson Performance

- Which salespeople generate the highest sales?
- How does salesperson performance vary?
- Are there significant performance differences between salespeople?

### Investigation

- Where are the largest performance differences?
- Which business areas require further investigation?
- What underlying dimension or segment is contributing to an observed change in sales?

## 5. Operational Decisions Supported

The Operational Dashboard is intended to support decisions such as:

- Identifying products that may require additional attention or investigation.
- Identifying customers or customer segments with significant sales contribution or changes in performance.
- Monitoring sales territory performance.
- Reviewing salesperson performance.
- Investigating changes in sales performance over time.
- Prioritizing areas for further analysis or management attention.
- Supporting discussions between sales management and operational teams using a common view of sales performance.

The dashboard is intended to support evidence-based decision-making. It does not automatically determine business actions or replace management judgment.


## 6. KPI Requirements

The Operational Dashboard will reuse the existing PE-001 measure layer wherever possible. KPIs are selected based on the operational business questions defined in this document rather than on the availability of measures alone.

### 6.1 Core Sales KPIs

The primary operational KPIs are:

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Order Value

These measures provide a concise overview of sales volume, order activity, and transaction value within the selected analytical context.

### 6.2 Time and Trend KPIs

Time-based analysis should use the existing PE-001 time-intelligence measures where appropriate.

Relevant measures include:

- Sales MTD
- Sales QTD
- Sales YTD
- Rolling 12 Months Sales
- YoY Sales
- YoY Growth %

These measures are primarily supporting analytical measures and do not all require dedicated KPI cards.

### 6.3 Product Performance KPIs

Product analysis should primarily use:

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Selling Price

These measures should be evaluated within product category, subcategory, and individual product context.

### 6.4 Customer and Territory Performance KPIs

Customer and territory analysis should primarily reuse:

- Total Sales
- Total Orders
- Average Order Value

These measures should be evaluated within the selected customer, customer type, or sales territory context rather than duplicated as separate measures.

### 6.5 Salesperson Performance KPIs

Salesperson performance should primarily be evaluated using:

- Total Sales
- Total Orders
- Total Quantity Sold

The existing measures should respond to salesperson and territory filter context through the established semantic model relationships.

Additional salesperson-specific measures should only be introduced if implementation identifies a clear operational requirement.

### 6.6 KPI Classification

The Operational Dashboard will distinguish between:

**Primary KPIs**
- Total Sales
- Total Orders
- Total Quantity Sold
- Average Order Value
- Sales Growth / Year-over-Year comparison

**Supporting Measures**
- Average Selling Price
- Sales MTD
- Sales QTD
- Sales YTD
- Rolling 12 Months Sales
- YoY Sales
- YoY Growth %

Primary KPIs may be displayed prominently through KPI cards.

Supporting measures should primarily be used within charts, tables, matrices, tooltips, or detailed analysis where they provide additional analytical context.

New DAX measures should only be created when an identified business requirement cannot be supported appropriately by the existing PE-001 measure layer.


## 7. Dashboard Information Architecture

The Operational Dashboard will be designed as a single business-facing Power BI report page focused on detailed sales performance monitoring and investigation.

The information architecture will follow a top-to-bottom analytical flow:

1. Monitor key operational performance indicators.
2. Identify sales trends and significant changes.
3. Investigate performance by product.
4. Investigate performance by customer and territory.
5. Review salesperson performance.
6. Apply filters to focus the analysis on a specific business segment or period.

The dashboard will prioritize information that supports operational investigation and decision-making while avoiding unnecessary duplication of the Executive Dashboard.

### 7.1 KPI Summary Area

The top section of the dashboard will provide a concise summary of the most important operational sales KPIs.

The KPI area should allow users to quickly understand the current analytical context before investigating individual dimensions.

Priority measures may include:

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Order Value
- Sales Growth / Year-over-Year comparison

The number of prominently displayed KPIs should remain limited to maintain a clear visual hierarchy.

### 7.2 Sales Performance and Trend Area

This section will provide an overview of sales performance over time.

It should allow users to:

- Identify sales trends.
- Compare performance across periods.
- Identify significant increases or decreases.
- Investigate changes in sales performance.

Time-based analysis should use the established DimDate dimension and existing time-intelligence measures where appropriate.

### 7.3 Product Performance Area

This section will provide detailed analysis of product performance.

Users should be able to:

- Compare sales across products.
- Identify high- and low-performing products.
- Analyze performance by product category.
- Identify products requiring further investigation.

The section should prioritize comparative analysis rather than simply reproducing the Executive Dashboard's Top Products visualization.

### 7.4 Customer and Territory Analysis Area

This section will allow users to investigate sales performance across customers and sales territories.

Users should be able to:

- Compare sales across territories.
- Identify major customer contributors.
- Analyze differences between customer types.
- Investigate regional or customer-level performance differences.

The analysis should support movement from a higher-level comparison toward more detailed investigation where appropriate.

### 7.5 Salesperson Performance Area

This section will provide operational visibility into salesperson performance.

Users should be able to:

- Compare sales performance across salespeople.
- Identify high- and low-performing salespeople.
- Investigate differences in performance between salespeople.
- Analyze salesperson performance within the selected analytical context.

### 7.6 Filter and Interaction Area

The dashboard will provide interactive filtering to allow users to focus the analysis on relevant business segments.

Primary filters may include:

- Calendar Year
- Sales Territory
- Product Category
- Customer Type

Where appropriate, visual interactions should allow users to select a business dimension and observe its impact on related visuals.

Filters should remain consistent with the filtering approach established for the Executive Dashboard.

### 7.7 Information Hierarchy

The dashboard will follow a clear visual hierarchy:

**Level 1 — Monitor**

Key operational KPIs provide an immediate performance summary.

**Level 2 — Identify**

Trend and comparative visuals highlight changes and performance differences.

**Level 3 — Investigate**

Product, customer, territory, and salesperson analysis provides greater detail.

**Level 4 — Focus**

Filters and interactive selections allow users to narrow the analysis to a relevant business context.

This hierarchy is intended to minimize cognitive load and help users move from identifying a potential issue to investigating its underlying business dimension.

### 7.8 Dashboard Scope

The Operational Dashboard will remain limited to a single primary report page.

Additional complexity will be avoided unless it provides clear business value.

Detailed investigation should be supported through visual interactions, filtering, tooltips, or drill-through functionality where appropriate rather than creating additional dashboard pages solely to accommodate more visuals.

The objective is to provide a focused operational analytical experience rather than maximize the number of visuals displayed.


## 8. Visual Design

The Operational Dashboard will use a focused set of Power BI visuals designed to support monitoring, comparison, and investigation of sales performance.

The visual design will prioritize clarity, analytical usefulness, and consistency with the Executive Dashboard while providing greater operational detail.

The dashboard will use a single-page layout and avoid unnecessary visual elements or duplication.

### 8.1 Page Layout

The page will follow a structured top-to-bottom layout:

**Top:** Dashboard title and operational filter context.

**Upper section:** KPI cards providing an immediate summary of sales performance.

**Middle section:** Sales trend and comparative analysis.

**Lower section:** Product, customer, territory, and salesperson performance analysis.

The layout should maintain sufficient spacing between visual elements and allow users to understand the information hierarchy without excessive scrolling.

### 8.2 KPI Cards

A limited number of KPI cards will be used to provide an immediate operational summary.

The preferred KPIs are:

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Order Value
- Sales Growth / Year-over-Year comparison

KPI cards should use the established PE-001 measures wherever possible.

The cards should provide consistent number formatting and should respond correctly to the dashboard's filter context.

### 8.3 Sales Trend Visual

A line chart will be used to display sales performance over time.

The visual should allow users to:

- Identify sales trends.
- Recognize significant increases or decreases.
- Compare sales performance across periods.
- Investigate changes within the selected filter context.

The existing time-intelligence measures developed for PE-001 should be reused where appropriate.

### 8.4 Product Performance Visual

A horizontal bar chart will be used to compare sales performance across products.

The visual should:

- Support comparison of individual products.
- Highlight higher- and lower-performing products.
- Allow users to analyze the selected product category.
- Support interactive filtering of related dashboard visuals.

A ranked view may be used to maintain readability when the number of products is large.

### 8.5 Territory Performance Visual

A column or bar chart will be used to compare sales performance across sales territories.

The visual should:

- Provide clear comparison between territories.
- Highlight differences in sales performance.
- Respond to the selected time, product, customer, and other filters.

The chart should provide sufficient space for territory names and avoid unnecessary label truncation.

### 8.6 Customer Performance Visual

A horizontal bar chart or table-style visual will be used to analyze customer sales performance.

The visual should:

- Identify major customer contributors.
- Support comparison between customers.
- Allow users to focus on the selected customer type.
- Support investigation of customer-level performance.

A ranked or Top N view may be used to maintain readability.

### 8.7 Salesperson Performance Visual

A horizontal bar chart or matrix will be used to compare salesperson performance.

The visual should:

- Compare sales across salespeople.
- Identify higher- and lower-performing salespeople.
- Support analysis within the selected territory or time period.
- Allow users to investigate performance differences.

Where appropriate, additional supporting measures may be displayed through tooltips rather than additional permanent visuals.

### 8.8 Detailed Operational Analysis

A compact table or matrix may be included to provide detailed operational information that cannot be communicated effectively through charts alone.

The detailed visual should be used only if it provides clear analytical value and should not become a large data dump.

Potential dimensions may include:

- Product
- Customer
- Territory
- Salesperson
- Date

Potential measures may include:

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Order Value

The detailed visual should support sorting, filtering, and investigation without overwhelming the user.

### 8.9 Filters and Interactions

The Operational Dashboard will use interactive slicers and visual interactions to allow users to focus the analysis.

Primary slicers should include:

- Calendar Year
- Sales Territory
- Product Category
- Customer Type

Visual interactions should be configured so that selections in one visual provide useful context to related visuals.

Interactions that create confusing or misleading results should be disabled.

### 8.10 Visual Formatting

The Operational Dashboard should follow the established PE-001 visual language.

Formatting principles include:

- Consistent typography.
- Consistent number formatting.
- Clear visual titles.
- Appropriate use of whitespace.
- Consistent alignment.
- Limited use of decorative elements.
- Clear distinction between primary and supporting information.
- Consistent treatment of positive and negative performance indicators.

The dashboard should prioritize readability over visual decoration.

### 8.11 Visual Scope

The Operational Dashboard will use only the visuals necessary to support the defined operational business questions.

The initial implementation should target approximately:

- 4–5 KPI cards
- 1 sales trend visual
- 1 product performance visual
- 1 territory performance visual
- 1 customer performance visual
- 1 salesperson performance visual
- 1 compact detailed analysis visual
- 3–4 primary slicers

The final number and arrangement of visuals may be adjusted during implementation if required to maintain readability and usability.

Additional visuals should only be introduced when they provide clear business value.


## 9. Filtering and Interactions

The Operational Dashboard will use filtering and visual interactions to support focused investigation of sales performance.

The interaction design should allow users to move from an overall operational view to a more specific analytical context without creating unnecessary complexity.

### 9.1 Primary Dashboard Slicers

The Operational Dashboard will provide the following primary slicers:

- Calendar Year
- Sales Territory
- Product Category
- Customer Type

These slicers represent the primary business dimensions required for operational sales analysis.

All slicers should affect the relevant KPI cards and analytical visuals unless a specific business reason requires an interaction to be disabled.

### 9.2 Date Filtering

Calendar Year will serve as the primary visible date filter.

Date-based filtering must use the established `DimDate` dimension rather than date columns directly from the sales fact table.

This ensures that filtering remains consistent with the PE-001 semantic model and existing time-intelligence measures.

More granular time analysis, such as quarter or month, may be supported through visual hierarchies or drill-down functionality where appropriate rather than adding multiple permanent date slicers.

### 9.3 Cross-Filtering and Cross-Highlighting

Analytical visuals should support useful cross-filtering or cross-highlighting.

For example, selecting a territory should allow users to investigate:

- Sales within that territory.
- Product performance within that territory.
- Customer performance within that territory.
- Salesperson performance within that territory.

Similarly, selecting a product or customer should provide relevant context across related dashboard visuals.

Interactions should support investigation rather than simply demonstrate Power BI functionality.

### 9.4 Visual Interaction Management

Power BI's Edit Interactions functionality should be used where necessary to control how visuals affect one another.

An interaction should be disabled when:

- It produces misleading analytical results.
- It creates an irrelevant filter relationship.
- It makes the dashboard difficult to understand.
- The affected visual should intentionally preserve a broader comparison context.

The default approach will be to allow useful interactions and disable only those that reduce analytical clarity.

### 9.5 Filter Context Visibility

Users should be able to understand the analytical context currently applied to the dashboard.

Slicer selections should therefore remain clearly visible.

Visual titles and KPI values should respond appropriately to the selected filter context so that users can distinguish between overall results and filtered results.

### 9.6 Multi-Dimensional Investigation

Users may combine filters to investigate a specific business context.

For example:

**Calendar Year → Territory → Product Category → Customer Type**

This enables operational questions such as:

> How did a specific product category perform within a selected territory and customer segment during a selected year?

The number of primary slicers will remain limited to avoid excessive filtering complexity.

### 9.7 Resetting the Analytical Context

Users should have a simple way to return the dashboard to its default analytical state.

A Reset Filters button may be implemented using a Power BI bookmark if it improves usability and can be introduced without unnecessary complexity.

This functionality is considered a usability enhancement rather than a mandatory requirement for the initial dashboard implementation.

### 9.8 Drill-Down Behaviour

Where a natural hierarchy exists, selected visuals may support drill-down.

Potential examples include:

- Year → Quarter → Month
- Product Category → Product Subcategory → Product
- Territory → Salesperson

Drill-down should only be implemented where it supports a defined operational business question.

The dashboard should not introduce hierarchies solely to demonstrate technical functionality.

### 9.9 Drill-Through Boundary

Detailed drill-through functionality will be evaluated separately in Section 10.

The primary Operational Dashboard should remain capable of answering the core operational questions without requiring users to navigate through multiple report pages.

Drill-through should therefore be introduced only where additional detail provides clear analytical value.

### 9.10 Interaction Design Principles

The filtering and interaction design will follow these principles:

- Keep the primary filtering experience simple.
- Use existing dimension tables for filtering.
- Maintain consistent filter behaviour across visuals.
- Enable interactions that support investigation.
- Disable interactions that create confusion or misleading results.
- Avoid unnecessary slicers and navigation controls.
- Preserve a clear path from monitoring to investigation.
- Prioritize business usability over demonstrating advanced Power BI features.


## 10. Drill-Down / Drill-Through

The Operational Dashboard will use selective drill-down and one dedicated drill-through page to support deeper operational analysis while maintaining a focused reporting experience.

The objective is to provide sufficient analytical depth without creating unnecessary report pages or navigation complexity.

### 10.1 Drill-Down Strategy

Drill-down will be used where a natural business hierarchy exists and where moving between levels of detail helps answer operational business questions.

The primary hierarchies are:

- Date: Calendar Year → Quarter → Month
- Product: Product Category → Product Subcategory → Product

Drill-down should allow users to move from summarized performance toward more detailed information without requiring multiple permanent visuals.

### 10.2 Date Drill-Down

The Sales Trend visual may support the following hierarchy:

**Calendar Year → Quarter → Month**

This allows users to identify a change at a higher level and investigate the relevant period in greater detail.

The hierarchy should use fields from `DimDate` to remain consistent with the established semantic model and time-intelligence design.

### 10.3 Product Drill-Down

The Product Performance visual should support the hierarchy:

**Product Category → Product Subcategory → Product**

This allows users to begin with category-level performance and progressively investigate the products contributing to the result.

This approach provides analytical depth while reducing the need for multiple product visuals.

### 10.4 Territory and Salesperson Investigation

Territory and salesperson analysis will primarily use:

- Dashboard slicers
- Cross-filtering
- Cross-highlighting
- Visual selections

Selecting a territory should provide the appropriate filter context for salesperson and other operational performance visuals.

A dedicated salesperson or territory drill-through page is not required for the initial implementation.

### 10.5 Product Detail Drill-Through Page

One dedicated drill-through page will be created:

**Product Detail**

The purpose of this page is to allow users to move from product analysis on the Operational Dashboard to a focused view of an individual product.

The drill-through context should be based on the selected product.

The Product Detail page may include:

- Product identification and descriptive information
- Total Sales
- Total Orders
- Total Quantity Sold
- Average Selling Price
- Sales performance over time
- Territory contribution to product sales

The exact number of visuals should remain limited and focused on answering product-level operational questions.

### 10.6 Product Detail User Flow

The intended analytical flow is:

**Operational Dashboard**
→ Identify a product requiring investigation
→ Drill through to **Product Detail**
→ Review product-level KPIs and performance
→ Return to the Operational Dashboard

A Back button should be provided on the Product Detail page to support clear navigation.

### 10.7 Tooltips

Standard Power BI tooltips should provide supporting information where appropriate.

Potential tooltip measures include:

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Order Value
- Comparative sales performance where appropriate

A dedicated report-page tooltip is not required for the initial implementation.

### 10.8 Drill-Through Scope

Only one dedicated drill-through page will be included in the initial Operational Dashboard implementation.

Additional pages such as:

- Customer Detail
- Territory Detail
- Salesperson Detail

are outside the current PE-001 scope.

They may be considered in a future project version if additional business requirements justify them.

### 10.9 Design Decision

The Operational Dashboard will therefore use:

**Single Operational Dashboard + selective drill-down + one Product Detail drill-through page**

This provides a balance between analytical depth, usability, portfolio value, and controlled implementation scope.

The design demonstrates Power BI drill-through functionality without unnecessarily expanding the PE-001 report architecture.


## 11. Data Requirements

The Operational Dashboard and Product Detail drill-through page will use the existing PE-001 reporting layer and Power BI semantic model.

The current data architecture already provides the primary fact and dimension data required to support the defined operational business questions.

No additional SQL reporting objects are required as part of the initial Operational Dashboard implementation unless a specific data gap is identified during development.

### 11.1 Sales Fact Data

The primary source of sales transaction data is:

`Reporting.vw_FactSales`

The sales fact provides the transactional measures and dimensional keys required for operational analysis.

It supports analysis of:

- Sales amount
- Order activity
- Quantity sold
- Product performance
- Customer performance
- Territory performance
- Salesperson performance
- Sales performance over time

Existing DAX measures based on the sales fact should be reused wherever possible.

### 11.2 Date Dimension

Date-based analysis will use:

`Reporting.DimDate`

The date dimension provides the calendar structure required for:

- Calendar Year analysis
- Quarter analysis
- Month analysis
- Time-intelligence calculations
- Sales trend analysis
- Period comparison

Power BI time-intelligence calculations and dashboard date filtering should use the established `DimDate[Date]` field and related date attributes rather than date fields directly from the sales fact.

### 11.3 Product Dimension

Product analysis will use:

`Reporting.vw_DimProduct`

The product dimension provides the descriptive attributes required for:

- Product-level analysis
- Product category analysis
- Product subcategory analysis
- Product drill-down
- Product Detail drill-through

The intended analytical hierarchy is:

**Product Category → Product Subcategory → Product**

The Product Detail page will receive the selected product context through Power BI drill-through filtering.

### 11.4 Customer Dimension

Customer analysis will use:

`Reporting.vw_DimCustomer`

The customer dimension supports:

- Customer-level sales analysis
- Customer contribution analysis
- Customer Type filtering
- Comparison of customer performance

Customer analysis should reuse the existing semantic model relationship between the customer dimension and sales fact.

### 11.5 Sales Territory Dimension

Territory analysis will use:

`Reporting.vw_DimSalesTerritory`

The territory dimension supports:

- Territory-level sales comparison
- Territory filtering
- Regional performance investigation
- Cross-filtering of related operational visuals

Territory attributes should be used from the dimension rather than duplicated within report-specific calculations.

### 11.6 Salesperson Dimension

Salesperson analysis will use:

`Reporting.vw_DimSalesPerson`

The salesperson dimension supports:

- Salesperson performance comparison
- Salesperson-level investigation
- Analysis within selected territory and time contexts

Existing model relationships should provide the required filter propagation between salesperson and sales performance.

### 11.7 Existing DAX Measures

The Operational Dashboard should reuse the established PE-001 DAX measure layer wherever possible.

Relevant existing measures include measures for:

- Total Sales
- Total Orders
- Total Quantity Sold
- Average Order Value
- Average Selling Price
- Time-intelligence calculations
- Year-over-Year comparison

Additional measures should only be introduced when a defined operational requirement cannot be supported by the existing measure layer.

Any new measure should follow the established PE-001 naming, formatting, and organization conventions within `MeasuresBI`.

### 11.8 Product Detail Data Requirements

The Product Detail drill-through page should use the same semantic model and should not require a separate dataset or SQL reporting object.

The selected product context should filter the existing fact and related dimensions.

The page may use existing data to display:

- Product identification and descriptive attributes
- Total Sales
- Total Orders
- Total Quantity Sold
- Average Selling Price
- Sales performance over time
- Sales contribution by territory

This approach maintains a single governed semantic model across the report.

### 11.9 Data Model Consistency

Both the Operational Dashboard and Product Detail page must use the existing PE-001 star-schema relationships.

Report-specific workarounds, duplicated data tables, or unnecessary calculated tables should be avoided.

The preferred architecture remains:

**SQL Reporting Layer → Power BI Semantic Model → DAX Measures → Report Visuals**

This ensures that business logic remains centralized and reusable across the Executive Dashboard, Operational Dashboard, and Product Detail page.

### 11.10 Data Scope Decision

The existing PE-001 data model is considered sufficient for the initial Operational Dashboard implementation.

The project will not expand the SQL reporting layer or semantic model solely to add additional dashboard functionality.

New data requirements will only be introduced if implementation identifies a clear business requirement that cannot be addressed using the existing model.


## 12. Performance Considerations

The Operational Dashboard should provide a responsive analytical experience while reusing the existing PE-001 reporting architecture and semantic model.

Performance optimization will focus on practical Power BI and data-modeling principles appropriate to the current project scope.

### 12.1 Reuse of the Existing Star Schema

The Operational Dashboard and Product Detail page will use the existing PE-001 star-schema model.

Analysis should continue to use the established fact and dimension structure rather than introducing duplicated or report-specific data structures.

This supports efficient filtering, simplified DAX calculations, and consistent business logic across report pages.

### 12.2 Measure Reuse

Existing measures from `MeasuresBI` should be reused wherever possible.

New DAX measures should only be created when an identified business requirement cannot be satisfied by the existing measure layer.

This reduces duplicated business logic and helps maintain a simpler semantic model.

### 12.3 Calculated Columns and Tables

Unnecessary Power BI calculated columns and calculated tables should be avoided.

Where possible, data preparation and structural transformations should remain within the established SQL reporting layer.

DAX should primarily be used for analytical measures and calculations that depend on report filter context.

### 12.4 Visual Density

The number of visuals displayed on the Operational Dashboard should remain controlled.

Each visual introduces additional queries and rendering requirements and also increases cognitive load for the user.

The dashboard should therefore prioritize a smaller number of analytically useful visuals rather than maximizing visual density.

### 12.5 Visual Interactions

Cross-filtering and cross-highlighting should be enabled only where they support meaningful operational investigation.

Unnecessary interactions should be disabled if they create confusing behaviour or additional processing without providing analytical value.

### 12.6 Detailed Analysis Visual

The detailed operational table or matrix should contain only the dimensions and measures required for investigation.

Displaying unnecessary columns or excessive levels of detail should be avoided.

Top N filtering, report filters, or other appropriate techniques may be used where necessary to maintain readability and responsiveness.

### 12.7 Product Detail Page

The Product Detail drill-through page should remain focused on the selected product.

Only visuals required to answer product-level operational questions should be included.

The drill-through filter context should reduce the analytical scope of the page and support focused investigation rather than duplicate the entire Operational Dashboard.

### 12.8 Performance Validation

Report responsiveness should be reviewed during implementation.

Power BI Performance Analyzer may be used if a visual or interaction demonstrates noticeable performance issues.

Detailed performance optimization will only be performed when an actual issue is identified.

### 12.9 Performance Scope

Advanced performance features such as aggregation tables, incremental refresh, complex model optimization, or extensive DAX benchmarking are outside the current PE-001 scope unless a demonstrated performance requirement justifies them.

The objective is to maintain a clean, responsive, and professionally designed report using appropriate modeling and visualization practices without unnecessary technical complexity.


## 13. Usability Considerations

The Operational Dashboard should provide a clear and intuitive analytical experience for users who need to monitor and investigate sales performance.

Usability decisions should prioritize clarity, consistency, and ease of navigation rather than unnecessary visual or interactive complexity.

### 13.1 Visual Consistency

The Operational Dashboard should maintain visual consistency with the existing Executive Dashboard.

This includes:

- Consistent typography.
- Consistent KPI card formatting.
- Consistent number and percentage formats.
- Consistent spacing and alignment.
- Consistent visual titles.
- Consistent treatment of filters and slicers.

The Operational Dashboard should feel like part of the same PE-001 reporting solution while serving a different analytical purpose.

### 13.2 Information Hierarchy

The dashboard should guide users naturally through the analytical process:

**Monitor → Identify → Investigate → Focus**

The most important information should appear first, followed by increasingly detailed analytical content.

Users should be able to understand the purpose of each dashboard section without requiring additional instructions.

### 13.3 Readability

Visuals should remain readable at the standard report-page viewing size.

The design should avoid:

- Excessively small text.
- Unnecessary data labels.
- Overcrowded charts.
- Excessive visual density.
- Truncated labels where reasonable layout adjustments can prevent them.

Number formatting should be concise and appropriate to the measure being displayed.

### 13.4 Filter Usability

Primary slicers should remain clearly visible and easy to understand.

The dashboard should use a limited number of primary filters:

- Calendar Year
- Sales Territory
- Product Category
- Customer Type

Users should be able to identify the active filter context without searching through multiple filter controls.

Additional filtering should primarily occur through visual interactions or drill-down rather than adding unnecessary permanent slicers.

### 13.5 Interaction Predictability

Visual interactions should behave consistently and predictably.

When users select a product, territory, customer, or salesperson, related visuals should respond in a way that supports the analytical question being investigated.

Interactions that produce confusing or misleading results should be disabled.

### 13.6 Operational Dashboard Navigation

The Operational Dashboard should function as the primary location for operational sales analysis.

Users should be able to perform the majority of operational investigation without leaving the page.

Navigation to additional pages should therefore remain limited and purposeful.

### 13.7 Product Detail Navigation

Users should be able to drill through from an appropriate product-level visual to the `Product Detail` page.

The Product Detail page should clearly communicate that the user is viewing information for a selected product.

A Power BI Back button should be provided so users can return easily to the Operational Dashboard while preserving a clear analytical workflow.

The intended navigation flow is:

**Operational Dashboard → Product Detail → Back**

### 13.8 Product Detail Usability

The Product Detail page should remain compact and focused.

It should not duplicate the complete Operational Dashboard.

Instead, it should provide only the information necessary to understand the selected product's performance, such as:

- Product identification.
- Key product-level KPIs.
- Sales trend.
- Territory contribution.

This keeps the drill-through experience focused on investigation rather than creating another general-purpose dashboard.

### 13.9 Accessibility and Clarity

The dashboard should not rely solely on color to communicate important information.

Titles, labels, values, and contextual information should make the meaning of visuals understandable.

Color usage should remain consistent and restrained, with emphasis placed on readability and business meaning.

### 13.10 Usability Scope

Advanced navigation systems, complex bookmark-based interfaces, custom visual navigation frameworks, and unnecessary interactive features are outside the initial PE-001 scope.

Usability improvements should be introduced when they make the report easier to understand or operate.

The objective is to create a professional and intuitive reporting experience without adding complexity that does not provide clear user or business value.


## 14. Assumptions and Constraints

The Operational Dashboard is designed within the established scope, architecture, and data availability of PE-001.

The following assumptions and constraints define the boundaries of the initial implementation.

### 14.1 Data Source

PE-001 uses the AdventureWorks sample database as the source system for the sales analytics solution.

The available data is treated as representative business data for the purpose of demonstrating:

- Data analysis
- SQL reporting-layer development
- Dimensional modeling
- Power BI semantic modeling
- DAX development
- Business intelligence reporting
- Operational and executive analysis

The project is a portfolio case study and does not represent a live production environment.

### 14.2 Historical Data

The available sales data is historical and static rather than real-time operational data.

The Operational Dashboard therefore provides analytical monitoring of the available sales history and should not be interpreted as a real-time monitoring system.

The project does not require:

- Streaming data
- Real-time refresh
- Event-based alerts
- Continuous operational monitoring

### 14.3 Existing Reporting Architecture

The Operational Dashboard will use the existing PE-001 reporting architecture:

**AdventureWorks → SQL Reporting Layer → Power BI Semantic Model → DAX Measures → Report Visuals**

The existing reporting views and `DimDate` table are considered sufficient for the initial implementation.

New SQL objects should only be introduced if an identified business requirement cannot be supported by the current reporting layer.

### 14.4 Existing Semantic Model

The existing PE-001 Power BI semantic model will be reused.

The project assumes that the established relationships between the sales fact and supporting dimensions provide the required analytical filtering behaviour.

The Operational Dashboard should not introduce duplicate tables or separate report-specific data models.

### 14.5 Business Scope

The Operational Dashboard focuses primarily on sales performance analysis.

The initial scope does not include detailed analysis of:

- Inventory management
- Supply-chain operations
- Financial accounting
- Profitability modeling beyond available measures
- Sales forecasting
- Predictive analytics
- Customer lifetime value
- Marketing campaign performance

These areas may represent valid future analytical requirements but are outside the current PE-001 scope.

### 14.6 Dashboard Scope

The operational reporting experience will consist of:

- One primary `Operational Dashboard` page.
- One `Product Detail` drill-through page.

The existing `Executive Dashboard` remains the strategic reporting page.

The `Development & Validation` page remains the technical working and testing area and is not intended as a business-facing dashboard.

Additional operational or drill-through pages will not be introduced unless a clear business requirement justifies them.

### 14.7 Product Detail Scope

The Product Detail page will provide focused analysis of the selected product.

It will not function as a second Operational Dashboard.

Its purpose is limited to supporting deeper investigation after a product of interest has been identified on the Operational Dashboard.

### 14.8 Technology Scope

The initial Operational Dashboard implementation will use the existing PE-001 SQL Server and Power BI solution.

Advanced platform capabilities will not be introduced solely to increase technical complexity.

Technologies or capabilities such as real-time analytics, advanced Microsoft Fabric workloads, machine learning, or complex enterprise-scale Power BI features are outside the current dashboard scope unless required by a future project phase.

### 14.9 Performance Assumption

The PE-001 dataset is assumed to be of a size that can be handled effectively by the existing Power BI model.

Advanced enterprise-scale performance techniques will only be considered if an actual performance issue is identified during implementation.

### 14.10 Scope Control

The primary objective of PE-001 is to demonstrate a complete and professionally structured analytics solution rather than implement every possible analytical capability.

Additional functionality should only be introduced when it provides clear business, analytical, usability, or portfolio value.

This constraint is intended to maintain a focused solution and prevent unnecessary project complexity.


## 15. Relationship to Executive Dashboard

The Operational Dashboard complements the existing Executive Dashboard by providing a more detailed analytical view of sales performance.

Both dashboards use the same PE-001 reporting layer, semantic model, business dimensions, and governed DAX measures, ensuring consistency between strategic and operational analysis.

### 15.1 Executive Dashboard Purpose

The Executive Dashboard provides a high-level overview of business performance.

Its primary purpose is to help management answer questions such as:

- How is the business performing overall?
- What are the major sales trends?
- Which products, customers, and territories contribute most to sales?
- How is current performance comparing with previous periods?

The Executive Dashboard therefore prioritizes concise KPIs, high-level comparisons, and strategic visibility.

### 15.2 Operational Dashboard Purpose

The Operational Dashboard provides greater analytical detail for users responsible for monitoring and investigating sales performance.

Its primary purpose is to help users answer questions such as:

- Where are performance differences occurring?
- Which products, territories, customers, or salespeople require further investigation?
- What is contributing to a change in sales performance?
- How does performance change when a specific business context is selected?

The Operational Dashboard therefore emphasizes comparison, filtering, interaction, and investigation.

### 15.3 Analytical Flow

The two dashboards support different levels of analysis:

**Executive Dashboard**
→ Monitor overall business performance
→ Identify important trends or areas of interest

**Operational Dashboard**
→ Analyze performance differences
→ Investigate products, customers, territories, and salespeople
→ Narrow the analysis using filters and interactions

**Product Detail**
→ Investigate an individual product identified through operational analysis

This creates a logical analytical progression:

**Strategic Overview → Operational Investigation → Product Detail**

### 15.4 Shared Semantic Model

Both dashboards use the same PE-001 semantic model and measure layer.

This ensures that common measures such as Total Sales, Total Orders, Total Quantity Sold, Average Order Value, and time-intelligence calculations use consistent business definitions across the report.

Business logic should not be recreated separately for individual report pages.

### 15.5 Avoiding Dashboard Duplication

The Operational Dashboard should not reproduce the Executive Dashboard with additional visuals.

Where similar business dimensions are used, the Operational Dashboard should provide additional analytical capability through:

- Greater detail
- Interactive filtering
- Cross-filtering and cross-highlighting
- Drill-down
- Salesperson analysis
- Detailed operational analysis
- Product drill-through

This ensures that each dashboard has a distinct business purpose.

### 15.6 Reporting Experience

The final PE-001 Power BI reporting experience will therefore contain three distinct analytical levels:

1. **Executive Dashboard** — strategic performance overview.
2. **Operational Dashboard** — operational monitoring and investigation.
3. **Product Detail** — focused product-level drill-through analysis.

The `Development & Validation` page remains a technical workspace used for testing and validating the model, measures, and report behaviour rather than a business-facing analytical page.


## 16. Design Decisions

The following design decisions define the final direction of the PE-001 Operational Dashboard.

These decisions were made to balance business value, analytical capability, usability, technical quality, and controlled project scope.

### 16.1 Single Operational Dashboard

The operational reporting experience will use one primary `Operational Dashboard` page.

A single-page approach was selected to:

- Maintain a focused analytical experience.
- Reduce unnecessary navigation.
- Keep the report easy to understand.
- Avoid creating additional pages solely to accommodate more visuals.

Additional operational pages will only be considered if future business requirements justify them.

### 16.2 One Product Detail Drill-Through Page

One dedicated drill-through page, `Product Detail`, will be included.

The page provides deeper product-level investigation while demonstrating Power BI drill-through functionality without creating multiple detail pages.

Additional Customer, Territory, or Salesperson drill-through pages are outside the current PE-001 scope.

### 16.3 Shared Semantic Model

The Executive Dashboard, Operational Dashboard, and Product Detail page will use the same PE-001 semantic model.

No separate report-specific model will be created.

This maintains consistent relationships, filtering behaviour, and business definitions across the reporting solution.

### 16.4 Existing Measure Reuse

Existing measures in `MeasuresBI` will be reused wherever possible.

New measures will only be created when an operational business requirement cannot be addressed appropriately using the existing measure layer.

This avoids unnecessary duplication of DAX logic.

### 16.5 Limited Primary Slicers

The Operational Dashboard will initially use four primary slicers:

- Calendar Year
- Sales Territory
- Product Category
- Customer Type

Additional filtering will primarily be supported through visual selections, cross-filtering, and drill-down rather than adding excessive permanent slicers.

### 16.6 Selective Drill-Down

Drill-down will be implemented where a natural analytical hierarchy supports operational investigation.

The primary drill-down paths are:

**Date:** Calendar Year → Quarter → Month

**Product:** Product Category → Product Subcategory → Product

Additional hierarchies will only be introduced when they provide clear analytical value.

### 16.7 Controlled Visual Density

The Operational Dashboard will prioritize analytical usefulness over the number of visuals displayed.

If the planned visuals cannot be presented clearly within the available report canvas, lower-priority content should be removed or simplified rather than reducing readability.

### 16.8 Detailed Operational Analysis

A compact table or matrix may be used to support detailed investigation when chart-based analysis is insufficient.

The visual should contain only information required for operational analysis and should not become a large transactional data dump.

### 16.9 Consistency with the Executive Dashboard

The Operational Dashboard will maintain the established PE-001 visual language and formatting conventions.

However, the dashboard will serve a different analytical purpose and should not simply reproduce the Executive Dashboard.

The intended distinction remains:

**Executive Dashboard → Strategic Overview**

**Operational Dashboard → Operational Investigation**

**Product Detail → Focused Product Analysis**

### 16.10 Development & Validation Page

The `Development & Validation` page will remain available as a technical workspace for:

- Measure validation.
- Time-intelligence testing.
- Visual testing.
- Filter-context validation.
- Development troubleshooting.

It is not considered part of the business-facing dashboard experience.

### 16.11 Scope Control

The initial Operational Dashboard will not introduce additional complexity solely for demonstration purposes.

Functionality such as additional drill-through pages, advanced navigation systems, forecasting, predictive analytics, real-time monitoring, or enterprise-scale performance features will remain outside the current scope unless supported by a clear business requirement.

### 16.12 Final Design Principle

The final design follows the principle:

**Business Requirement → Analytical Question → Appropriate Measure → Appropriate Visual → User Decision**

Technology and visualization choices should support this sequence rather than drive the solution design.


## 17. Key Takeaway

The PE-001 Operational Dashboard extends the existing reporting solution from executive-level monitoring into more detailed operational investigation.

By combining a focused Operational Dashboard with selective drill-down, interactive filtering, and one Product Detail drill-through page, the solution enables users to move from identifying performance differences to investigating the products, customers, territories, salespeople, and time periods contributing to those results.

The design reuses the established PE-001 SQL reporting layer, Power BI semantic model, and governed DAX measures, maintaining consistency across the Executive Dashboard, Operational Dashboard, and Product Detail experience.

The final design intentionally balances analytical capability with simplicity and controlled scope. The objective is not to maximize the number of visuals, measures, or report pages, but to provide the appropriate information and analytical functionality required to support business decisions.

The Operational Dashboard therefore follows the core PE-001 design principle:

**Business Requirement → Analytical Question → Appropriate Measure → Appropriate Visual → User Decision**