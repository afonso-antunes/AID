select * from staging_historical_events she limit 10;
select * from staging_maddison sm limit 10;

-- 1) exploratory SQL queries to list distinct countries per source
select DISTINCT sm.country_name, sm.country_iso3 from staging_maddison sm;
select DISTINCT sw.country_name, sw.country_iso3 from staging_wdi sw;
select DISTINCT she.country_name, she.country_iso3 from staging_historical_events she ;

SELECT
    (SELECT COUNT(DISTINCT country_iso3) FROM staging_maddison) AS num_cntry_maddison,
    (SELECT COUNT(DISTINCT country_iso3) FROM staging_wdi) AS num_cntry_wdi,
    (SELECT COUNT(DISTINCT country_iso3) FROM staging_historical_events) AS num_cntry_hist_events;


-- 2) inspect year ranges
SELECT 'maddison' as source, MIN(year) AS min_year, MAX(year) AS max_year FROM staging_maddison
union all
SELECT 'wdi' as source, MIN(year) AS min_year, MAX(year) AS max_year FROM staging_wdi
union all
SELECT 'hist_events' as source, MIN(year) AS min_year, MAX(year) AS max_year FROM staging_historical_events;

SELECT indicator_code, indicator_name, MIN(year) AS min_year, MAX(year) AS max_year
FROM staging_wdi
GROUP BY indicator_code, indicator_name
ORDER BY min_year;


-- 3) verify data integrity
SELECT country_iso3, indicator_code, year, COUNT(*) AS n
FROM staging_wdi
GROUP BY country_iso3, indicator_code, year
HAVING COUNT(*) > 1;

SELECT country_iso3, indicator_code, year, COUNT(*) AS n
FROM staging_maddison
GROUP BY country_iso3, indicator_code, year
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS null_values FROM staging_wdi WHERE value IS NULL;
SELECT COUNT(*) AS null_values FROM staging_maddison WHERE value IS NULL;

-- ver se ha country_names diferentes para o mesm ocodigo
SELECT 
	m.country_iso3,
	m.country_name AS name_maddison, 
	w.country_name AS name_wdi
FROM (
	SELECT DISTINCT country_iso3, country_name 
	FROM staging_maddison
) m
LEFT JOIN (
	SELECT DISTINCT country_iso3, country_name 
	FROM staging_wdi
) w
  ON m.country_iso3 = w.country_iso3
WHERE m.country_name <> w.country_name;


-- 4) support the temporal and geographic coverage analysis
SELECT country_iso3, country_name, MIN(year) AS min_year, MAX(year) AS max_year
FROM staging_wdi
GROUP BY country_iso3, country_name
ORDER BY country_name;

SELECT country_iso3, country_name, MIN(year) AS min_year, MAX(year) AS max_year
FROM staging_maddison sm 
GROUP BY country_iso3, country_name
ORDER BY country_name;

SELECT country_iso3, country_name, MIN(year) AS min_year, MAX(year) AS max_year
FROM staging_wdi
GROUP BY country_iso3, country_name
ORDER BY country_name;

SELECT 'maddison' as source, country_iso3, country_name, MIN(year) AS min_year, MAX(year) AS max_year
FROM staging_maddison sm 
where sm.country_iso3 = 'PRT'
GROUP BY country_iso3, country_name
union all
SELECT 'wdi' as source, country_iso3, country_name, MIN(year) AS min_year, MAX(year) AS max_year
FROM staging_wdi
where country_iso3 = 'PRT'
GROUP BY country_iso3, country_name
union all
SELECT 'historical' as source, country_iso3, country_name, MIN(year) AS min_year, MAX(year) AS max_year
from staging_historical_events she
where she.country_iso3 = 'PRT'
GROUP BY country_iso3, country_name;




