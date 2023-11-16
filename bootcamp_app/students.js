const { Pool } = require('pg');

const pool = new Pool({
  user: 'urvish',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const limit = process.argv[3];

const queryString = `
SELECT students.id, students.name as student, cohorts.name
FROM students
  JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

const values = [`%${cohortName}%`, limit];

pool.query(queryString, values)
.then(res => {
  console.log(res.rows.forEach(user => {
    console.log(`${user.student} has an id of ${user.id} and was in the ${user.name} cohort`);
  }));
})
.catch(err => console.error('query error', err.stack))
.finally(pool.end());