# SQL_project_hospital

## Phase 2 

Start the project:

1. `source ./startPostgreSQL.sh`
2. `source ./createPostgreDB.sh`
3. `cp data/*.txt /tmp/$USER/myDB/data/`
4. `psql -h localhost -p $PGPORT $USER"_DB" < phase2.sql`
5. `psql -h localhost -p $PGPORT $USER"_DB" < phase2_database.sql`

End the project:
`source ./stopPostgreDB.sh`
