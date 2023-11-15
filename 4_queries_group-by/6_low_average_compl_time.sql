SELECT students.name as student, 
  AVG(assignments.duration) as average_estimated_duration,
  AVG(assignment_submissions.duration) AS average_assignment_duration
FROM assignment_submissions
  JOIN students ON assignment_submissions.student_id = students.id
  JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignments.duration) > AVG(assignment_submissions.duration)
ORDER BY AVG(assignment_submissions.duration);