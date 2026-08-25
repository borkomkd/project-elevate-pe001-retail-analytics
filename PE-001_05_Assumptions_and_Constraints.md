# PE-001_05_Assumptions_and_Constraints

## Project Information

| Item | Description |
|------|-------------|
| Project | Project Elevate |
| Project ID | PE-001 |
| Document | Assumptions and Constraints |
| Version | 0.1 |
| Status | Draft |

---

# Purpose

The purpose of this document is to identify the assumptions and constraints that define the scope and boundaries of the Business Intelligence modernization initiative.

Documenting these elements helps establish realistic expectations and provides transparency regarding the planning decisions made throughout the engagement.

---

# Project Assumptions

The following assumptions have been made for the purpose of this consulting case study.

## Business Assumptions

### Assumption 1 – Executive Sponsorship

Executive management supports the Business Intelligence modernization initiative and recognizes the value of data-driven decision-making.

---

### Assumption 2 – Data Availability

The operational data stored within AdventureWorks is sufficient to demonstrate meaningful business analysis and reporting.

---

### Assumption 3 – Reporting Demand

Business users require regular reporting on sales performance, customers, products, and regional performance.

---

### Assumption 4 – Cloud Modernization

The organization is evaluating Microsoft Azure as the preferred cloud platform for future analytical workloads.

---

### Assumption 5 – Business Growth

The company expects continued growth in sales transactions and analytical reporting requirements over the coming years.

---

# Technical Assumptions

### Assumption 6 – Existing SQL Server Environment

Adventure Works currently stores operational data within Microsoft SQL Server.

---

### Assumption 7 – Microsoft Technology Stack

The organization has selected Microsoft technologies as the strategic platform for Business Intelligence modernization.

---

### Assumption 8 – Power BI Adoption

Power BI has been selected as the enterprise reporting and visualization platform.

---

# Project Constraints

The following constraints define the boundaries of this engagement.

## Scope Constraints

- The project is a portfolio demonstration rather than a production implementation.
- Recommendations are based on the AdventureWorks sample database.
- The engagement focuses on analytical reporting rather than operational application development.

---

## Technical Constraints

- Azure implementation is limited to Azure SQL Database.
- Advanced Azure services (such as Azure Synapse Analytics, Microsoft Fabric, Azure Data Factory, or Azure Databricks) are outside the scope of Version 1.0.
- Security implementation is discussed conceptually but not implemented in full.

---

## Resource Constraints

- The project is completed by a single consultant.
- Development activities are performed within a personal learning environment.
- Cloud resources are created only when required for demonstrations and removed after completion to minimize costs.

---

## Time Constraints

The project is planned as a focused consulting portfolio engagement completed over approximately 30–45 days.

The objective is to demonstrate quality and completeness rather than rapid delivery.

---

# Project Dependencies

Successful completion of the engagement depends upon:

- Availability of the AdventureWorks sample database.
- Access to SQL Server.
- Access to an Azure subscription.
- Access to Power BI Desktop.
- Availability of GitHub for documentation and version control.

---

# Risk Considerations

Potential project risks include:

- Incomplete understanding of business processes due to the use of a sample database.
- Differences between simulated business scenarios and real-world client environments.
- Changes to Azure services or licensing over time.
- Technical limitations associated with a portfolio-based implementation.

These risks are acknowledged and considered acceptable for the purpose of demonstrating consulting methodology and technical capability.

---

# Consultant's Perspective

Every consulting engagement begins with a degree of uncertainty.

By documenting assumptions and constraints at the outset, both the consultant and the client establish a shared understanding of the project's scope, limitations, and expectations.

This approach reduces ambiguity, improves planning, and provides a clear foundation for solution design.

---

# Next Phase

The next document, **PE-001_06_Solution_Architecture.md**, will define the proposed analytical architecture and explain how SQL Server, Azure SQL Database, and Power BI work together to support the organization's Business Intelligence strategy.

---

# Document Relationships

## Previous

- PE-001_04_Project_Objectives.md

## Next

- PE-001_06_Solution_Architecture.md
