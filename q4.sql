-- Q4: Compute View Item Metric
-- Use this table to 
-- compute view_binary for the 30 day window after the test_start_date
-- for the test named item_test_2

SELECT
  view_test.item_id,
  view_test.test_assignment,
  view_test.test_number,
  MAX(
    CASE
      WHEN (
        view_date > test_start_date
        AND DATE_PART('day', view_date - test_start_date) <= 30
      ) THEN 1
      ELSE 0
    END
  ) AS view_binary
FROM
  (
    SELECT
      final_assignments.*,
      DATE(EVENTS.event_time) AS view_date
    FROM
      dsv1069.final_assignments AS final_assignments
      LEFT JOIN (
        SELECT
          event_time,
          CASE
            WHEN parameter_name = 'item_id' THEN CAST(parameter_value AS NUMERIC)
            ELSE NULL
          END AS item_id
        FROM
          dsv1069.events
        WHERE
          event_name = 'view_item'
      ) AS EVENTS ON final_assignments.item_id = EVENTS.item_id
    WHERE
      test_number = 'item_test_2'
  ) AS view_test
GROUP BY
  view_test.item_id,
  view_test.test_assignment,
  view_test.test_number
