DROP DATABASE IF EXISTS portugal_dw;
CREATE DATABASE portugal_dw;
USE portugal_dw;

CREATE TABLE DIM_COUNTRY (
    country_key      INT AUTO_INCREMENT,
    iso3_code       CHAR(3),
    country_name    VARCHAR(20),
    country_group   VARCHAR(30),
    PRIMARY KEY (country_key),
    UNIQUE (iso3_code)
);


CREATE TABLE DIM_TIME (
    time_key         INT AUTO_INCREMENT,
    year            INT,
    decade          INT,
    PRIMARY KEY (time_key),
    UNIQUE (year)
);


CREATE TABLE DIM_SECTOR (
    sector_key       INT AUTO_INCREMENT,
    sector_name      VARCHAR(20),
    broad_sector     VARCHAR(10),
    PRIMARY KEY (sector_key),
    UNIQUE (sector_name)
);


CREATE TABLE FACT_ECONOMY (
    country_key        INT,
    time_key           INT,
    gdp_per_capita    DOUBLE,   -- Maddison
    gdp               DOUBLE,   -- Maddison
    gdp_growth_pct    DOUBLE,   -- WDI
    exports_pct_gdp   DOUBLE,   -- WDI
    imports_pct_gdp   DOUBLE,   -- WDI
    UNIQUE (country_key, time_key),
    FOREIGN KEY (country_key) REFERENCES DIM_COUNTRY (country_key),
    FOREIGN KEY (time_key)    REFERENCES DIM_TIME (time_key)
);


CREATE TABLE FACT_SOCIETY (
    country_key        INT,
    time_key           INT,
    population        DOUBLE,   -- Maddison
    gni_per_capita    DOUBLE,   -- WDI
    life_expectancy   DOUBLE,   -- WDI
    urban_pop_pct     DOUBLE,   -- WDI
    UNIQUE (country_key, time_key),
    FOREIGN KEY (country_key) REFERENCES DIM_COUNTRY (country_key),
    FOREIGN KEY (time_key)    REFERENCES DIM_TIME (time_key)
);


CREATE TABLE FACT_SECTOR (
    country_key             INT,
    time_key                INT,
    sector_key              INT,
    value_added_pct_gdp     DOUBLE,
    value_added_usd        DOUBLE,
    employment_pct        DOUBLE,
    UNIQUE (country_key, time_key, sector_key),
    FOREIGN KEY (country_key) REFERENCES DIM_COUNTRY (country_key),
    FOREIGN KEY (time_key)    REFERENCES DIM_TIME (time_key),
    FOREIGN KEY (sector_key)  REFERENCES DIM_SECTOR (sector_key)
);


CREATE TABLE EVENTS (
    event_key            INT AUTO_INCREMENT,
    country_key          INT,
    time_key             INT,
    event_description    VARCHAR(150),
    category            VARCHAR(50),
    economic_impact      VARCHAR(50),
    PRIMARY KEY (event_key),
    FOREIGN KEY (country_key) REFERENCES DIM_COUNTRY (country_key),
    FOREIGN KEY (time_key)    REFERENCES DIM_TIME (time_key)
    
    
);