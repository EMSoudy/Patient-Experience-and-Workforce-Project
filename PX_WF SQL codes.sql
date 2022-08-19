--Joined data frames w/Crosswalk, PX, and WF (including item label data frame)

select px.px_unit_type, px.px_unit, px.survey_id as px_survey_id, format(px.discharge_date, 'yyyyMMdd') px_discharge_date, px.survey_response_score as px_survey_response_score,
  wf.wf_unit, wf.survey_id as wf_survey_id, wf.wf_item_id, wf.survey_response_score as wf_survey_response_score, wfl.wf_item_label
  
from dbo.px_resp_data px

inner join dbo.crosswalk cr on px.px_unit = cr.px_unit
inner join dbo.wf_resp_data wf on wf.wf_unit = cr.wf_unit
inner join wf_item_labels wfl on wfl.wf_item_id = wf.wf_item_id

/*Duplicates should not be omitted unless authorized to do so. The duplicates were not omitted in this analysis.
- Duplicates may be caused by:
	- PX units belonging to multiple WF units
	- PX survey ID (patient) per WF survey ID (workforce worker)
	- PX survey ID per WF item ID (questions) answered by each WF survey ID, therefore "duplicates" of px unit and/or wf unit cannot simply be omitted */


--Wide data frame results

select cr.px_unit, cr.wf_unit,
wf.survey_id as wf_SurveyID, wf.survey_response_score as wf_SurveyResponseScore, 
(PERCENTILE_CONT(0.5) within group (order by cast(wf.survey_response_score as int)) over (partition by wf.wf_item_id, wf.wf_unit)) as wf_SurveyResponseScore_median,
px.survey_response_score as px_SurveyResponseScore, wf.wf_item_id, wfl.wf_item_label

from dbo.wf_resp_data wf
inner join dbo.crosswalk cr on wf.wf_unit = cr.wf_unit
inner join px_resp_data px on px.px_unit = cr.px_unit
inner join wf_item_labels wfl on wfl.wf_item_id = wf.wf_item_id
order by px.px_unit, wf.wf_unit  

