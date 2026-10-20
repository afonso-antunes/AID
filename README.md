# Portugal's Economic and Human Development: A Century of Transformation

Data Analysis and Integration (AID) project, 2026/2027.
Authors: Afonso Antunes (106242), Ana Cláudia Vilela (105835).

A data warehouse built from the Maddison Project, World Bank WDI and a historical events dataset, used to analyse Portugal's economic and social development against other European countries.

**Stack:** MySQL · Apache Hop (ETL) · Mondrian/OLAP cubes (MDX) · Pentaho Report Designer

## Structure

| Folder | Content |
|--------|---------|
| `task_01` | Staging database (`create_staging.sql`), CSV load pipeline (`load_staging.hpl`), data dictionaries and exploratory queries |
| `task_02` | Country name/ISO3 matching and grouping (`country_mapping.csv`, `country_matching.hpl`) |
| `task_03` | Data warehouse schema (`create_dw.sql`), diagram and design justification |
| `task_04` | ETL pipelines for dimensions (`DIM_COUNTRY`, `DIM_TIME`, `DIM_SECTOR`), facts (`FACT_ECONOMY`, `FACT_SOCIETY`, `FACT_SECTOR`) and `EVENTS` |
| `task_05` | OLAP schema (`schema.xml`, cubes *Economy*, *Society*, *Sector*) and Excel analyses |
| `task_06` | MDX queries over the cubes |
| `task_07` | Additional MDX queries (a–d) with explanation |
| `task_08` | Final report (`report.prpt`, PDF preview) and Part B discussion |

`slides_03.pdf` contains the project presentation.

## Running

1. Run `task_01/create_staging.sql` and load the source data with `task_01/load_staging.hpl`.
2. Run `task_02/country_matching.hpl` to build the country mapping.
3. Run `task_03/create_dw.sql` to create the warehouse.
4. Run the `task_04` pipelines (dimensions first, then facts and events).
5. Publish `task_05/schema.xml` to the OLAP server and run the MDX queries in `task_06`/`task_07`.
