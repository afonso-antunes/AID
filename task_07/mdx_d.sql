WITH 
MEMBER Measures.[PT vs PL] AS 
    (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Poland]), 
    FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs CZ] AS 
    (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Czechia]), 
    FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs HU] AS 
    (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Hungary]), 
    FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs RO] AS 
    (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Romania]), 
    FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs EST] AS 
    (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Estonia]), 
    FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs LV] AS 
    (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Latvia]), 
    FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs LT] AS 
    (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Lithuania]), 
    FORMAT_STRING='0.0%'
SELECT
    {Measures.[PT vs PL], Measures.[PT vs CZ], Measures.[PT vs HU], Measures.[PT vs RO],
     Measures.[PT vs EST], Measures.[PT vs LV], Measures.[PT vs LT]} ON COLUMNS,
    {Time.Decade.[1990] : Time.Decade.[2020]} ON ROWS
FROM [Economy]