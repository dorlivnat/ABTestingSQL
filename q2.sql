--Q2: Reformat the Data
--Reformat the final_assignments_qa to look like the final_assignments table
--filling in any missing values with a placeholder of the appropriate data type.

-- CREATE TABLE final_assignments_qa2 AS (

SELECT
  item_id,
  test_a                AS test_assignment,
  'item_test_a'         AS test_number,
  '2013-01-05 00:00:00' AS test_start_date
FROM
  dsv1069.final_assignments_qa
UNION
SELECT
  item_id,
  test_b                AS test_assignment,
  'item_test_b'         AS test_number,
  '2013-01-05 00:00:00' AS test_start_date
FROM
  dsv1069.final_assignments_qa
UNION
SELECT
  item_id,
  test_c                AS test_assignment,
  'item_test_c'         AS test_number,
  '2013-01-05 00:00:00' AS test_start_date
FROM
  dsv1069.final_assignments_qa
UNION
SELECT
  item_id,
  test_d                AS test_assignment,
  'item_test_d'         AS test_number,
  '2013-01-05 00:00:00' AS test_start_date
FROM
  dsv1069.final_assignments_qa
UNION
SELECT
  item_id,
  test_e                AS test_assignment,
  'item_test_e'         AS test_number,
  '2013-01-05 00:00:00' AS test_start_date
FROM
  dsv1069.final_assignments_qa
UNION
SELECT
  item_id,
  test_f                AS test_assignment,
  'item_test_f'         AS test_number,
  '2013-01-05 00:00:00' AS test_start_date
FROM
  dsv1069.final_assignments_qa

-- )
