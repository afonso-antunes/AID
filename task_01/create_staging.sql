CREATE DATABASE IF NOT EXISTS staging;
USE staging;

DROP TABLE IF EXISTS staging_maddison;
CREATE TABLE staging_maddison (
    country_iso3	CHAR(3)	NOT NULL,
    country_name	VARCHAR(20)	NOT NULL,
    indicator_code	VARCHAR(20)	NOT NULL,
    indicator_name  VARCHAR(100)	NOT NULL,
    year            SMALLINT	NOT NULL,
    value			DOUBLE	NULL
);

DROP TABLE IF EXISTS staging_wdi;
CREATE TABLE staging_wdi (
    country_iso3    CHAR(3)         NOT NULL,
    country_name    VARCHAR(20)    NOT NULL,
    indicator_code  VARCHAR(20)     NOT NULL,
    indicator_name  VARCHAR(100)    NOT NULL,
    year            SMALLINT        NOT NULL,
    value            DOUBLE         NULL
);

DROP TABLE IF EXISTS staging_historical_events;
CREATE TABLE staging_historical_events (
    year              SMALLINT      NOT NULL,
    country_iso3      CHAR(3)       NOT NULL,
    country_name      VARCHAR(20)  NOT NULL,
    event             VARCHAR(150)  NOT NULL,
    category          VARCHAR(50)   NOT NULL,
    economic_impact   VARCHAR(50)   NULL
);

-- para a task2
-- Central/Eastern Europe -> maior com 22 caracteres
DROP TABLE IF EXISTS staging_country_mapping;
CREATE TABLE staging_country_mapping (
    iso3_code       CHAR(3)         NOT NULL PRIMARY KEY,
    country_name    VARCHAR(20)    NOT NULL,
    country_group   VARCHAR(30)     NOT NULL
);