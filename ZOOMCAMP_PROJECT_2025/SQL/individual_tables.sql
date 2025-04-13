create or replace table econ_datawh.econdata_governmentsize as 
SELECT Year, Countries, World_Bank_Region,	World_Bank_Current_Income_Classification, Economic_Freedom_Summary_Index,	Rank,	Quartile,
Government_consumption,	 
Transfers_and_subsidies,	
CAST(Government_investment AS FLOAT64) as Government_investment,	 	
Top_marginal_income_tax_rate,	 	
Top_marginal_income_and_payroll_tax_rate,	 	
Top_marginal_tax_rate,	
State_ownership_of_Assets,	
Size_of_Government  
FROM `loyal-karma-456615-j3.econ_datawh.econwh_2022`;



create or replace table econ_datawh.econdata_Judiciaryandproperty  as 
SELECT Year, Countries, World_Bank_Region,	World_Bank_Current_Income_Classification, Economic_Freedom_Summary_Index,	Rank,	Quartile,
Judicial_independence,	
Impartial_courts,	
Protection_of_property_rights,	
Military_interference_in_rule_of_law_and_politics,	
Integrity_of_the_legal_system,	
Legal_enforcement_of_contracts,	
Regulatory_restrictions_on_the_sale_of_real_property,	
Reliability_of_police,	
Gender_Legal_Rights_Adjustment,	
Legal_System_and_Property_Rights_Without_Gender_Adjustment,	
Legal_System_and_Property_Rights_With_Gender_Adjustment  
FROM `loyal-karma-456615-j3.econ_datawh.econwh_2022`;




create or replace table econ_datawh.econdata_Soundmoney as 
SELECT Year, Countries,World_Bank_Region,	World_Bank_Current_Income_Classification, Economic_Freedom_Summary_Index,	Rank,	Quartile,
Money_growth,	 	
Standard_deviation_of_inflation,
Inflation_Most_recent_year,	 	
Freedom_to_own_foreign_currency_bank_accounts,	
Sound_Money FROM `loyal-karma-456615-j3.econ_datawh.econwh_2022`;






create or replace table econ_datawh.econdata_Globaltrade as 
SELECT Year, Countries,World_Bank_Region,	World_Bank_Current_Income_Classification, Economic_Freedom_Summary_Index,	Rank,	Quartile,
Revenue_from_trade_taxes,	 	
Mean_tariff_rate,	 
Standard_deviation_of_tariff_rates,	 	
Tariffs,	
Non_tariff_trade_barriers,	
Compliance_costs_of_importing_and_exporting,	
Regulatory_trade_barriers,	
Black_market_exchange_rates,	
Financial_openness,	
Capital_controls,	
Freedom_of_foreigners_to_visit,	
Protection_of_foreign_assets,	
Controls_of_the_movement_of_capital_and_people,	
Freedom_to_trade_internationally 
FROM `loyal-karma-456615-j3.econ_datawh.econwh_2022`;







create or replace table econ_datawh.econdata_MarketRegulation as 
SELECT Year, Countries, World_Bank_Region,	World_Bank_Current_Income_Classification,	Economic_Freedom_Summary_Index,	Rank,	Quartile,
Ownership_of_banks,	
Private_sector_credit,	
Interest_rate_controls,
Credit_market_regulations,	
Hiring_regulations_and_minimum_wage,
Hiring_and_firing_regulations,	
Centralized_collective_bargaining,	
Hours_Regulations,	
Mandated_cost_of_worker_dismissal,	
Conscription,	Foreign_Labor,	
Labor_market_regulations,	
Regulatory_Burden,	
Bureacracy_costs,	
Impartial_Public_Administration,	
Tax_compliance,	
Business_regulations,	
Market_openness,	
Business_Permits,	
Distorton_of_the_business_environment,	
Freedom_to_enter_markets_and_compete,	
Regulation 
FROM `loyal-karma-456615-j3.econ_datawh.econwh_2022`;





























