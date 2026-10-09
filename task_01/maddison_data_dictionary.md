# Maddison indicators data dictionary

**Source file:** `project_data_sources_2627/maddison_indicators.csv`  
**Staging table:** `staging_maddison`  
**Rows:** 4,349 · **Entities:** 15 countries · **Observed year span:** 1900–2022

## Columns

| Column | Staging type | Null? | Description / units |
|---|---|---:|---|
| `country_iso3` | `CHAR(3)` | No | Three-letter country identifier. |
| `country_name` | `VARCHAR(20)` | No | Country name. |
| `indicator_code` | `VARCHAR(20)` | No | Measure code: `gdp`, `gdppc`, or `pop`. |
| `indicator_name` | `VARCHAR(100)` | No | Human-readable measure name. |
| `year` | `SMALLINT` | No | Observation year. |
| `value` | `DOUBLE` | Yes | Numeric measure; units depend on the indicator below. |

## Measures and coverage

| Code | Measure and unit | Rows | Countries | Observed year span | Absent country-year rows* |
|---|---|---:|---:|---:|---:|
| `gdp` | GDP (2011 international dollars) | 1,444 | 15 | 1900–2022 | 401 |
| `gdppc` | GDP per capita (2011 international dollars) | 1,461 | 15 | 1900–2022 | 384 |
| `pop` | Population (thousands) | 1,444 | 15 | 1900–2022 | 401 |

**Geographic coverage:** Belgium (BEL), Czechia (CZE), Estonia (EST), France
(FRA), Germany (DEU), Greece (GRC), Hungary (HUN), Ireland (IRL), Italy (ITA),
Latvia (LVA), Lithuania (LTU), Poland (POL), Portugal (PRT), Romania (ROU), and
Spain (ESP). The file has no European Union aggregate.

## Missingness and notable patterns

No explicit missing values or duplicate (country_iso3, indicator_code, year) combinations were identified in the source records. However, the dataset does not constitute a complete annual panel, as some country–indicator–year combinations are absent.

For each indicator, the number of absent country-year observations is calculated as (number of countries × number of years in the observed min–max interval) − observed rows. These gaps are quantified by indicator in the table above and represent missing combinations relative to a complete 15-country annual grid for 1900–2022, rather than NULL values in existing records.

Temporal coverage also varies geographically. Belgium, Germany, Spain, France, Greece, Hungary, Italy, Poland, Portugal, and Romania have observations from 1900; Ireland starts in 1913; Czechia starts in 1970; and Estonia, Latvia, and Lithuania start in 1973. All 15 countries have observations through 2022.

The calculated gaps do not imply that every country-year observation was expected to be available in the original source.