# Take Home Case: Deel  
_Author: Juliano Garcia_  

This repository contains the simple dbt project used to model and analyze the provided data. Below are some of the steps and assumptions used during the parsing, manipulation and validation of the data.  
This project is based on **BigQuery** as warehouse (leveraging the free tier of Google Cloud and serverless nature of that DW).

## 1. Parsing Data
Given that the format of both provided files (`Globepay Acceptance Report` and `Globepay Chargeback Report`) were csv, I opted to directly upload them into my Data warehouse and create dbt sources that would point to both tables.  
There was the possibility to create them as seeds in dbt however it is usually not a good practice to keep large information within the code/repo.

1. Acceptance Report: Required to be parsed with `;` as delimiter and the `rates` column as STRING. No duplicated id (`ref`) were found in the table.
2. Chargeback Report: Pretty standard CSV, with no issues on parsing.

Both table were upload with all columns as STRING type, so that it'll enable me more liberty when casting dtypes and manipulating as per the specific analytics needs.

## 2. Manipulation
For this project I've specified 3 specific layers:
1. **Staging**: Used to tabularize, cast types and remove any duplicated records from the raw source tables. No business rules or agregation logic should happen in this layer.
2. **Intermediate**: Used to consolidate business specific logics that might be used to multiple consumption purposes later on. For example, currency standardization from local to USD.
3. **Mart**: Here we have th final consumption models. I've choosen to go for an apporah of OBTs (One Big Table), whhere we have all the required values and dimentions for a specific analysis or product already persisted in the final table, thus optimizing query performance (avoiding multiple JOINs like a snowflake modeling).

### Assumptions
- No duplicated records were found in the Acceptance Report, based on the field `ref`, therefore its staging model will remains as a view given that it simply handles data typing.
- As stated in the provided pdf, the `amount` field is reported in local currency.

## Misc
- The description of the field `external_ref` in the API documentation seems misleading. It states that it is the card expiry year (4 digits) but the contents of the tables are hashed.