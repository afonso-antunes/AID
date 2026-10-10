# Historical events data dictionary

**Source file:** `project_data_sources_2627/historical_events.csv`  
**Staging table:** `staging_historical_events`  
**Rows:** 387 · **Entities:** 16 (15 countries and the European Union
aggregate) · **Observed year span:** 1900–2025 · **Distinct years with
events:** 110

## Columns

| Column | Staging type | Null? | Description / units |
|---|---|---:|---|
| `year` | `SMALLINT` | No | Year assigned to the event; no measurement unit. |
| `country_iso3` | `CHAR(3)` | No | Three-letter country or aggregate identifier. |
| `country_name` | `VARCHAR(20)` | No | Country or aggregate name. |
| `event` | `VARCHAR(150)` | No | Narrative description of the historical event. |
| `category` | `VARCHAR(50)` | No | Categorical event classification. |
| `economic_impact` | `VARCHAR(50)` | Yes | Qualitative text describing an economic impact; not a numeric measure. |

## Coverage

**Geographic coverage:** Belgium (BEL), Czechia (CZE), Estonia (EST), France
(FRA), Germany (DEU), Greece (GRC), Hungary (HUN), Ireland (IRL), Italy (ITA),
Latvia (LVA), Lithuania (LTU), Poland (POL), Portugal (PRT), Romania (ROU),
Spain (ESP), and the European Union aggregate (EUU).

## Missingness and notable patterns

After correcting the unquoted comma in the Ireland 1990 event description in the source CSV, all 387 records have the six fields declared by the header. No fields are empty and no duplicate (year, country_iso3, event) combinations were identified. Events occur in 110 distinct years within the 1900–2025 period. Since this is a curated collection of historical events rather than a complete annual time series, years without recorded events do not necessarily represent missing observations.

Event categories and economic impacts are qualitative descriptions rather than numerical measurements. Some categories combine multiple themes using `/`; neither field is a standardized numeric measure.
