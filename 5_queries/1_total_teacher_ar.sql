SELECT COUNT(assistance_requests.id) AS total_assistances,
  teachers.name AS name
FROM assistance_requests
  JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;