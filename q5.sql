-- Q5: Compute lift and p-value
--Use the https://thumbtack.github.io/abba/demo/abba.html to compute the lifts in metrics and the p-values for the binary metrics 
-- ( 30 day order binary and 30 day view binary) using a interval 95% confidence. 
-- Test1 Results: Views: control: 0/1112 & treatment 0/1086 lift N/A p-value 1.00 || Orders: 0/1112 & treatment 0/1086 lift N/A p-value 1.00 - Non Significant
-- Test2 Results: Views: control: 925/1130 & treatment 894/1068 lift 2.3% p-value 0.25 || Orders: 399/1130 & treatment 381/1068 lift 1% p-value 0.86 - Non Significant
-- Test3 Results: Views: control: 951/1075 & treatment 991/1123 lift -0.25% p-value 0.87 || Orders: 428/1075 & treatment 417/1123 lift -6.7% p-value 0.2 - Non Significant

SELECT
  test_assignment,
  test_number,
  COUNT(DISTINCT item_id) AS number_of_items,
  SUM(order_binary_30d) AS order_binary_30d
FROM
  (
    SELECT
      item_id,
      test_assignment,
      test_number,
      test_start_date,
      created_at,
      MAX(
        CASE
          WHEN DATE_PART('day', created_at - test_start_date) <= 30 THEN 1
          ELSE 0
        END
      ) AS order_binary_30d
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
          final_assignments.test_number = 'item_test_3'
      ) order_binary
    GROUP BY
      item_id,
      test_assignment,
      test_number,
      test_start_date,
      created_at
  ) orders_test
GROUP BY
  test_assignment,
  test_number
