# Maji Ndogo Data Dictionary

This dictionary defines the core tables and columns used in the raw SQL database before transformation.

### `location` Table
* `location_id` (VARCHAR): Unique identifier for a specific geographic location.
* `province_name` (VARCHAR): The broader province.
* `town_name` (VARCHAR): The specific town or city.
* `address` (VARCHAR): The physical address or rural marker.
* `location_type` (VARCHAR): Categorized as either 'Urban' or 'Rural'.

### `water_source` Table
* `source_id` (VARCHAR): Unique identifier for the water source.
* `type_of_water_source` (VARCHAR): Categories include 'river', 'well', 'shared_tap', 'tap_in_home', 'tap_in_home_broken'.
* `number_of_people_served` (INT): Population relying on this specific source.

### `visits` Table
* `record_id` (INT): Unique identifier for the field worker's visit.
* `location_id` (VARCHAR): Foreign key linking to the location table.
* `source_id` (VARCHAR): Foreign key linking to the water source.
* `assigned_employee_id` (VARCHAR): Foreign key linking to the employee who conducted the visit.
* `time_in_queue` (INT): The wait time for water in minutes.
* `visit_count` (INT): Indicates if this is the first (1) or subsequent visit to the site.

### `well_pollution` Table
* `source_id` (VARCHAR): Foreign key linking to the specific well.
* `results` (VARCHAR): 'Clean', 'Contaminated: Biological', or 'Contaminated: Chemical'.
* `biological` (VARCHAR): Specific biological contaminant concentration.
* `pollutant` (VARCHAR): Specific chemical pollutant concentration.