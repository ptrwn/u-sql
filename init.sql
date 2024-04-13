DROP DATABASE IF EXISTS udb;
DO
$do$
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'udb') THEN

      RAISE NOTICE 'Role "udb" already exists. Skipping.';
   ELSE
      create user udb with encrypted password '123';
   END IF;
END
$do$;
CREATE DATABASE udb OWNER udb;