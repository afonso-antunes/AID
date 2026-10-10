# World Development Indicators (WDI) data dictionary

**Source file:** `project_data_sources_2627/wdi_indicators.csv`
**Staging table:** `staging_wdi`
**Rows:** 11,371 · **Entities:** 16 (15 countries and the European Union
aggregate) · **Observed year span:** 1960–2025

## Columns

| Column | Staging type | Null? | Description / units |
|---|---|---:|---|
| `country_iso3` | `CHAR(3)` | No | Three-letter country or aggregate identifier. |
| `country_name` | `VARCHAR(20)` | No | Country or aggregate name. |
| `indicator_code` | `VARCHAR(20)` | No | World Development Indicators measure code. |
| `indicator_name` | `VARCHAR(100)` | No | Human-readable measure name. |
| `year` | `SMALLINT` | No | Observation year. |
| `value` | `DOUBLE` | Yes | Numeric measure; units depend on the indicator below. |

## Measures and coverage

| Code | Measure and unit | Rows | Entities | Observed year span | Absent entity-year rows* |
|---|---|---:|---:|---:|---:|
| `NE.EXP.GNFS.ZS` | Exports of goods and services (% of GDP) | 757 | 16 | 1960–2025 | 299 |
| `NE.IMP.GNFS.ZS` | Imports of goods and services (% of GDP) | 757 | 16 | 1960–2025 | 299 |
| `NV.AGR.TOTL.CD` | Agriculture, forestry, and fishing value added (current US$) | 547 | 16 | 1960–2025 | 509 |
| `NV.AGR.TOTL.ZS` | Agriculture, forestry, and fishing value added (% of GDP) | 547 | 16 | 1960–2025 | 509 |
| `NV.IND.MANF.CD` | Manufacturing value added (current US$) | 550 | 16 | 1960–2025 | 506 |
| `NV.IND.MANF.ZS` | Manufacturing value added (% of GDP) | 550 | 16 | 1960–2025 | 506 |
| `NV.IND.TOTL.CD` | Industry (including construction) value added (current US$) | 551 | 16 | 1960–2025 | 505 |
| `NV.IND.TOTL.ZS` | Industry (including construction) value added (% of GDP) | 551 | 16 | 1960–2025 | 505 |
| `NV.SRV.TOTL.CD` | Services value added (current US$) | 551 | 16 | 1960–2025 | 505 |
| `NV.SRV.TOTL.ZS` | Services value added (% of GDP) | 551 | 16 | 1960–2025 | 505 |
| `NY.GDP.MKTP.KD.ZG` | GDP growth (annual %) | 860 | 16 | 1961–2025 | 180 |
| `NY.GNP.PCAP.CD` | GNI per capita, Atlas method (current US$) | 823 | 16 | 1962–2025 | 201 |
| `SL.AGR.EMPL.ZS` | Employment in agriculture (% of total employment; modeled ILO estimate) | 560 | 16 | 1991–2025 | 0 |
| `SL.IND.EMPL.ZS` | Employment in industry (% of total employment; modeled ILO estimate) | 560 | 16 | 1991–2025 | 0 |
| `SL.SRV.EMPL.ZS` | Employment in services (% of total employment; modeled ILO estimate) | 560 | 16 | 1991–2025 | 0 |
| `SP.DYN.LE00.IN` | Life expectancy at birth, total (years) | 1,040 | 16 | 1960–2024 | 0 |
| `SP.URB.TOTL.IN.ZS` | Urban population (% of total population) | 1,056 | 16 | 1960–2025 | 0 |

**Geographic coverage:** Belgium (BEL), Czechia (CZE), Estonia (EST), France
(FRA), Germany (DEU), Greece (GRC), Hungary (HUN), Ireland (IRL), Italy (ITA),
Latvia (LVA), Lithuania (LTU), Poland (POL), Portugal (PRT), Romania (ROU),
Spain (ESP), and the European Union aggregate (EUU).

## Missingness and notable patterns

No explicit missing values or duplicate (country_iso3, indicator_code, year) combinations were identified in the source records. However, temporal coverage varies considerably across indicators, and some entity–indicator–year combinations are absent.

For each indicator, the number of absent entity-year observations is calculated as (number of entities × number of years in the indicator's observed min–max interval) − observed rows. These gaps are quantified in the table above and represent missing combinations relative to a complete annual grid, rather than NULL values in existing records.

Indicators have different starting years: employment indicators begin in 1991, GNI per capita in 1962, and GDP growth in 1961. Some indicators provide complete coverage within their respective observed periods, while others contain substantial gaps.

Five indicators have a complete annual panel across all 16 entities within their observed min–max periods: all three employment measures (1991–2025), life expectancy (1960–2024), and urban population share (1960–2025). Other indicators have absent entity-year combinations, as quantified in the table.

The dataset includes indicators expressed in different units, such as percentages, current US dollars, and years. These differences should be considered when comparing indicators or integrating multiple data sources.
