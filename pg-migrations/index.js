const fs = require('fs');
const path = require('path');
const { Client } = require('pg');

console.log('Connecting to the database with the following credentials:');
console.log('Host:', 'localhost');
console.log('Port:', 5432);
console.log('User:', process.env.PG_USER);
console.log('Database:', 'postgres');

const client = new Client({
  host: 'timescale',
  port: 5432,
  user: process.env.PG_USER || 'postgres',
  password: process.env.PG_PASSWORD || 'maxstore', 
  database: 'postgres',
});

async function main() {
  try {
    console.log('Attempting to connect to the database...');
    await client.connect();
    console.log('Successfully connected to the database.');
  } catch (err) {
    console.error('Failed to connect to the database:', err);
    process.exit(1);
  }

  const files = fs.readdirSync('./pg-sql-migrations').sort(); 
  console.log('Found the following migration files:', files);

  for (const file of files) {
    if (path.extname(file) === '.sql') {
      console.log(`Executing script ${file}`);
      try {
        const sql = fs.readFileSync(path.join('./pg-sql-migrations', file), 'utf-8'); 
        console.log(`Executing the following SQL: ${sql}`);
        await client.query(sql);
        console.log(`Successfully executed script ${file}`);
      } catch (err) {
        console.error(`Failed to execute script ${file}:`, err);
        process.exit(1);
      }
    }
  }

  console.log('Finished executing all scripts. Closing the database connection...');
  try {
    await client.end();
    console.log('Successfully closed the database connection.');
  } catch (err) {
    console.error('Failed to close the database connection:', err);
  }

  console.log('Migrations finished, exiting...');
}

main().catch(console.error);