WITH 
MEMBER Measures.[PT vs ES] AS (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Spain]), FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs FR] AS (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[France]), FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs DE] AS (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Germany]), FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs BE] AS (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Belgium]), FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs IT] AS (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Italy]), FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs IE] AS 
    IIF(IsEmpty((Measures.[Gdp Per Capita], Country.[Country].[Ireland])), NULL,
        (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Ireland])), 
    FORMAT_STRING='0.0%'
MEMBER Measures.[PT vs GR] AS (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) / (Measures.[Gdp Per Capita], Country.[Country].[Greece]), FORMAT_STRING='0.0%'
SELECT
    {Measures.[PT vs ES], Measures.[PT vs FR], Measures.[PT vs DE], Measures.[PT vs BE], 
     Measures.[PT vs IT], Measures.[PT vs IE], Measures.[PT vs GR]} ON COLUMNS,
    {Time.Decade.[1900] : Time.Decade.[2020]} ON ROWS
FROM [Economy]