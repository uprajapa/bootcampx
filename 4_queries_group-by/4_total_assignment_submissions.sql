SELECT cohorts.name as cohort, COUNT(assignment_submissions.id) as total_assignments
FROM assignment_submissions
JOIN students ON student_id = students.id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY COUNT(assignment_submissions.id) DESC;