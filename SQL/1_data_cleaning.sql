/* =============================================================================
Phase 1 & 2: Data Exploration & Quality Control
Description: Standardizing employee data, stripping hidden whitespace from 
location records, and handling null values for mathematical integrity.
=============================================================================
*/

-- 1. Standardize employee email addresses 
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')), '@ndogowater.gov');

-- 2. Trim hidden spaces from physical addresses
UPDATE location
SET address = TRIM(address);

-- 3. Handle NULL queue times (replace with 0 to prevent math errors)
UPDATE visits
SET time_in_queue = 0
WHERE time_in_queue IS NULL;