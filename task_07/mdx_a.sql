WITH MEMBER Measures.[Previous Decade GDP] AS
    (Measures.[Gdp Per Capita], Time.Decade.CurrentMember.PrevMember)
MEMBER Measures.[Growth Pct] AS
    IIF(
        Time.Decade.CurrentMember.PrevMember IS NULL,
        NULL,
        (Measures.[Gdp Per Capita] - Measures.[Previous Decade GDP]) / Measures.[Previous Decade GDP]
    ),
    FORMAT_STRING = '0.0%'
SELECT
    {Measures.[Gdp Per Capita], Measures.[Growth Pct]} ON COLUMNS,
    {Time.Decade.[1900] : Time.Decade.[2020]} ON ROWS
FROM [Economy]
WHERE Country.Country.[Portugal]