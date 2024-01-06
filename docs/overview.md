{% docs __overview__ %}

# Juliano Garcia's Deel Take Home Case: Advanced dbt Project Overview

This dbt project, developed by Juliano Garcia (`juliano.garcia@protonmail.com`), serves as a comprehensive solution for the Take Home exercise assigned by Deel for the Revenue Analytics Manager position. 

The project is an intricate assembly of models and datasets, meticulously designed for detailed exploration and analysis.

## Architectural Layers of the dbt Project
### Raw Data Layer
The foundational layer of this project encompasses all initial datasets in their unaltered state. This layer is crucial as it represents the starting point of the data transformation journey. The raw data, in CSV format in this case, is directly imported into the data warehouse, retaining its original structure. Within the dbt project, these datasets are identified as sources.

### Staging Layer
At this stage, the data undergoes initial processing to enhance its usability. This involves normalization, type definition, and deduplication, ensuring data integrity and consistency. The staging models mirror the raw data, providing a refined yet unembellished view. This layer is pivotal for further processing in advanced data pipelines and offers a structured yet fundamental dataset for Data Analysts and Scientists. It is imperative to note that no business-specific logic or rules are applied at this stage.

### Intermediate Layer
This layer acts as a transitional stage where intermediate data transformations are executed. It may incorporate generalized business logic, aiming to serve a broad spectrum of business needs, analyses, or dashboards. The intermediate layer is designed to accommodate transformations that are universally applicable across various products or services, avoiding product-specific modifications. Due to the current project's streamlined nature, this layer was not implemented.

### Mart Layer
The Mart Layer is the culmination of the data transformation process, where data is fully prepared for end-user consumption. It follows the One Big Table (OBT) approach, where each analysis or product-centric model incorporates all necessary values and dimensions in a single, comprehensive table. This design philosophy significantly enhances query performance for analytical purposes. Data in this layer is typically aggregated to the necessary level of granularity, tailored for specific business analyses or product insights.

{% enddocs %}