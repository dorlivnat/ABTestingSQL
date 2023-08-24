-- Q3: Compute Order Binary
-- Use this table to 
-- compute order_binary for the 30 day window after the test_start_date
-- for the test named item_test_2

SELECT
  item_id,
  test_assignment,
  test_start_date,
  created_at,
  MAX(
    CASE
      WHEN DATE_PART('day', created_at - test_start_date) <= 30 THEN 1
      ELSE 0
    END
  ) AS order_binary
FROM
  (
    SELECT
      final_assignments.*,
      orders.created_at
    FROM
      dsv1069.final_assignments
      LEFT JOIN dsv1069.orders ON final_assignments.item_id = orders.item_id
      AND final_assignments.test_start_date < orders.created_at
    WHERE
      final_assignments.test_number = 'item_test_2'
  ) order_binary
GROUP BY
  item_id,
  test_assignment,
  test_start_date,
  created_at
