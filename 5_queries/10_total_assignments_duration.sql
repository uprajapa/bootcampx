SELECT day,
  COUNT(assignments.id) AS number_of_assignments,
  SUM(duration) AS duration
FROM assignments
GROUP By day
ORDER BY day;