SELECT dt.Year, e.event_description, e.category, e.economic_impact, dc.country_name 
FROM portugal_dw.EVENTS e
JOIN portugal_dw.DIM_COUNTRY dc ON e.country_key  = dc.country_key
JOIN portugal_dw.DIM_TIME dt ON e.time_key  = dt.time_key
WHERE dc.iso3_code in ('PRT', 'DEU', 'ESP')
ORDER BY dt.Year;


SELECT dc.country_name,
       dc.country_group,
       dt.year,
       fe.gdp_per_capita,
       fs.gni_per_capita,
       COALESCE(fs.life_expectancy, 'NA')
FROM portugal_dw.FACT_ECONOMY fe
JOIN portugal_dw.DIM_COUNTRY dc ON dc.country_key = fe.country_key
JOIN portugal_dw.DIM_TIME dt ON fe.time_key = dt.time_key
LEFT JOIN portugal_dw.FACT_SOCIETY fs ON fe.country_key = fs.country_key AND fe.time_key = fs.time_key
WHERE dc.country_name IN ('Portugal', 'Spain', 'Germany')
AND dt.year % 10 = 0
ORDER BY dc.country_name desc, dt.year