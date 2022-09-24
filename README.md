# Patient-Experience-and-Workforce-Project
Survey response score analysis based on workforce and patient experience.

Analyzing how patient care team working conditions impact their patients’ experience of care during an inpatient stay

Includes:
	- PowerPoint Presentation
	- SQL Query
	- Visualizations (Tableau workbook)
	
Data manipulated and cleansed using Excel and Tableau (Filtering dates and creating a threshold for scores)

Contains 4 data frames that were joined together using subqueries in Microsoft SQL Management Server

	- px_resp_data: patient survey responses to the patient experience (PX) outcome of "Likelihood to Recommend Services"
	- wf_resp_data: contains workforce experience (WF) survey responses within a year
	- Crosswalk: px_unit and wf_unit ID field mapping
		- px_unit - the unit the patient visited
		- wf_unit - WF team/unit
	- Wf_item_labels: contains wf_item_id column and the item's as a character (wf_item_label), which are the questions answered by the workforce
	
Tableau was used to create visualizations of data with a variety of graphs and tables
	
Outcome
	- In some cases, workforce experience results had an effect on patient experience.
	- Some departments showed to perform better than others via the results 

 
