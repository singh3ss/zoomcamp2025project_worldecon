### The Data has been extracted from the Fraser Institute website is about the economic freedom metrics captured of various countries across the globe. 

[https://efotw.org/economic-freedom/dataset?geozone=world&page=dataset&min-year=2&max-year=0&filter=0
](url)
The above dataset is among the suggested data sources for Zoomcamp 2025 capstone project.

The metrics have been split into 5 areas:

Government Size

Sound Money

Market Regulation

Judiciary and Property

Global Trade

The metrics have also been captured between 1970 and 2022 with one year increments between 2000 and 2022 and 5 year increments between 1970 and 2000. The data captured between 1970 and 2000 has been split into a single file and then one file per year. 





The data pipeline has been created such that terraform is first used to create the data lake and data warehouse, this has been done to ensure they exist before the pipelines run and their persistence can be monitored through a control outside of the pipeline itself.

All the codes and their steps are well documented with comments within the codes for ease of walkthrough, understanding and reproducibility. 


This has been done using the two files: main.tf and var.tf. Var.tf contains different variables necessary to create the data lake which in this case is a GCP bucket and the data warehouse which is a big query dataset. The dataset is then used to create various tables.The tables are created such that we have one master table, various tables for different years, staging table and then we have tables split according to the different areas mentioned above.

The different files are uploaded into the tables with respective years using KESTRA. Since the dates are before the current year and time we have done this using the backfilling option in KESTRA. KESTRA module is used to create the main table, staging table, table with respective years and all their schemas as well.



KESTRA instance was initiated using docker and the docker YAML file has been added to this repository. It also includes a key value file which helps include the project ID, location, data lake (GCP bucket) name, data warehouse (BQ Dataset) name etc. The JSON file which helps us create and edit these tables etc have been added directly in the KV option in KESTRA. The JSON file is an admin key extracted from the IAM of the GCP account. 

We have then created storied queries in ig query in GCP to split the master table to create individual tables. Due to the size of the table it was more efficient to do this  in GCP itself but if the volume increases the same queries can be easily transformed to be created and executed in DBT.

These include:

econdata_governmentsize
econdata_Judiciaryandproperty
econdata_Soundmoney
econdata_Globaltrade
econdata_MarketRegulation


These individual tables are then used to create various visualisations in Looker. The visualisations in looker capture essential metrics that help us understand the economic outlook of our world and the metrics that help drive the trade.





The steps to run the data pipeline is as follows:


# TERRAFORM STEPS

Please install Terraform directly from their website and add the install location to your PATH variable. This PATH variable helps command line initiate terraform. 

Then create an ADMIN key from your GCP account and download the same as a JSON file. Store the same int he same directory as you plan to store the Terraform files - main and variables. 

```
main.tf
```

```
var.tf
```

Next please instantiate terraform in command line:

```
Terraform INIT
```

Followed by to start the file plan:	Terraform PLAN

And then apply the terraform file - main.tf using the command:

```
Terraform APPLY
```

This should create the Data lake and the data warehouse and the process automatically uses the variable file.



# KESTRA STEPS

Kestra as mentioned is used to create the main tables and their schema. Kestra can be initiated efficiently and quickly using docker. To do this follows the steps below:

Please start the docker engine.

Then initiate KESTRA docker module by downloading the KESTRA YAML file from their website and then start the file using the commands:

```
docker-compose up -d
```

In KESTRA then create the two files by copying them from the repository:

```
Gcp_econ_data
```

```
Gcp_kv
```

Please execute the KV file followed by the main GCP_Econ_data file. When initiated you’ll be prompted to choose the year. The default has been set to 2022 since when downloaded from the main website all data from 1970-2022 s captured together. For the purposes of this project and best practices we have created the code such that we can download different years separately. 


Once this is completed we would have our master table created along with the tables for respective years and respective staging tables as and when executed. 





# DATA MODELING STEPS in GCP:

We have created a saved query in GCP which uses the master table to create individual tables split by various areas. Splitting the same into various areas helps decouple different functions. This kind of modeling is more efficient in decoupling and creating a buffer between different teams/areas/functions. Another example of this can be seen how data is stored in various organisations where customer, marketing, sales, product etc data are all kept in individual tables after being derived from a singular data warehouse.

So, to do this please copy the code attached into a query instance in GCP and save it:

```
Individual_tables.sql
```


The same query can also be scheduled and run in accordance with the data being produced in the original sources by Fraser institute followed by the cadence of main data tables being updated. 



# DATA VISUALIZATION STEPS in LOOKER - GCP:


Since our data lake and data ware house are currently maintained in GCP including the modeling steps, it makes sense for us to find our visualisation tool within GCP for the ease of integration. GCP offers Looker as an option for visualization.

To do this we use the same account used for the above steps and give it access to the above data sources individually as needed by the visualization itself, this is done by enabling the API that connects them together. 


Once done we have the option to look at the data we have, one addition that was done by to enable some actions in looker is create calculated fields for certain variables by converting them to a numeric format from character.



The visualization one wants to create depends on the need, this dataset has 40+ variables and one can use them as they wish. I have created three different dashboards both containing two different charts that help explain the economic outlook of our world and the metrics that influence them. 
