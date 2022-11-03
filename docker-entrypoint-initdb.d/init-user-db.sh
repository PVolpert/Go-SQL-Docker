#!/bin/bash
set -e

source /run/secrets/db-script-env

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE $webapp_dbname;
	
	CREATE USER $write_name WITH PASSWORD '$write_pw';
	GRANT ALL PRIVILEGES ON DATABASE $webapp_dbname TO $write_name;

    CREATE USER $read_name WITH PASSWORD '$read_pw';
EOSQL


psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$webapp_dbname"<<-EOSQL
	CREATE TABLE distributors (
    did     integer PRIMARY KEY,
    name    varchar(40)
    );

	GRANT SELECT ON TABLE distributors TO $read_name;
	INSERT INTO distributors VALUES 
	(1,'Steve'),
	(2,'Harvey');
EOSQL