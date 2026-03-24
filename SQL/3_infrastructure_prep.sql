/* =============================================================================
Phase 4a: Master Data Consolidation
Description: Creating a highly performant VIEW to combine all relevant data 
points from 4 separate tables into a single source of truth for routing.
=============================================================================
*/

CREATE VIEW combined_analysis_table AS
SELECT
    water_source.type_of_water_source AS source_type,
    location.town_name,
    location.province_name,
    location.location_type,
    water_source.number_of_people_served AS people_served,
    visits.time_in_queue,
    well_pollution.results
FROM visits
LEFT JOIN well_pollution 
    ON well_pollution.source_id = visits.source_id
INNER JOIN location 
    ON location.location_id = visits.location_id
INNER JOIN water_source 
    ON water_source.source_id = visits.source_id
WHERE visits.visit_count = 1;