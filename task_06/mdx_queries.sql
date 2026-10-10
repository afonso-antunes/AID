-- query1
WITH MEMBER Measures.[Portugal vs Spain Ratio] AS
    (Measures.[Gdp Per Capita], Country.[Country].[Portugal]) /
    (Measures.[Gdp Per Capita], Country.[Country].[Spain])
SELECT
    Measures.[Portugal vs Spain Ratio] ON COLUMNS,
    {Time.Decade.[1960] : Time.Decade.[2020]} ON ROWS
FROM [Economy]

-- query2
SELECT
    {Time.Year.[1995], Time.Year.[2020]} ON COLUMNS,
    GENERATE(
        {Sector.[Broad Sector].Members},
        DESCENDANTS(Sector.CurrentMember, Sector.[Sector], SELF_AND_BEFORE)
    ) ON ROWS
FROM [Sector]
WHERE (Measures.[Value Added Pct Gdp], Country.Country.[Portugal])