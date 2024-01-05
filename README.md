# Take Home Case: Deel  
_Author: Juliano Garcia_  

This repository contains the simple dbt project used to model and analyze the provided data. Below are some of the steps and assumptions used during the parsing, manipulation and validation of the data.  
This project is based on **BigQuery** as warehouse (leveraging the free tier of Google Cloud and serverless nature of that DW).

## 1. Parsing Data
Given that the format of both provided files (`Globepay Acceptance Report` and `Globepay Chargeback Report`) were csv, I opted to directly upload them into my Data warehouse and create dbt sources that would point to both tables.  
There was the possibility to create them as seeds in dbt however it is usually not a good practice to keep large information within the code/repo.

1. Acceptance Report: Required to be parsed with `;` as delimiter and the `rates`column as STRING
2. Chargeback Report: Pretty standard CSV, with no issues on parsing.

Both table were upload with all columns as STRING type, so that it'll enable me more liberty when casting dtypes and manipulating as per the specific analytics needs.