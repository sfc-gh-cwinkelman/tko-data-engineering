/*-----------------------------------------------------------------------------
Hands-On Lab: Data Engineering with Snowpark
Script:       11_teardown.sql
Author:       Jeremiah Hansen
Last Updated: 1/9/2023
-----------------------------------------------------------------------------*/


USE ROLE HOL_ROLE;

DROP DATABASE HOL_DB;
DROP WAREHOUSE HOL_WH;

USE ROLE ACCOUNTADMIN;
DROP ROLE HOL_ROLE;
DROP DATABASE FROSTBYTE_WEATHERSOURCE;
