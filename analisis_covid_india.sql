/* ============================================================
   ANÁLISIS DE COVID-19 EN INDIA (2020-2022)
   Autor: Sebastián Sánchez Cortés
   Motor: SQLite
   Dataset: COVID-19 India Dataset - InDoML 2021 (Kaggle)

   NOTA: Estas consultas fueron desarrolladas en SQLite.
   Funciones específicas como strftime() varían levemente
   en otros motores (ej. FORMAT/CONVERT en SQL Server,
   EXTRACT en PostgreSQL y BigQuery), pero la lógica de
   las consultas (SELECT, WHERE, GROUP BY, JOIN, etc.)
   es la misma en cualquier motor SQL.
   ============================================================ */


/* ------------------------------------------------------------
   SECCIÓN 1 — FALLECIMIENTOS Y CASOS POSITIVOS
   ------------------------------------------------------------ */

-- 1.1 Máximo, mínimo y promedio de fallecimientos por año
SELECT STRFTIME('%Y', date) 'Año',
       MAX(deaths) 'Máximo de fallecimientos',
       MIN(deaths) 'Mínimo de fallecimientos',
       ROUND(AVG(deaths), 0) 'Promedio de fallecidos'
FROM DL_case_info
WHERE deaths > 0
GROUP BY STRFTIME('%Y', date)
ORDER BY Año DESC;

-- 1.2 Promedio de la tasa de positividad en todo el período
SELECT ROUND(AVG(positivity_rate), 2) 'Promedio de tasa de positividad'
FROM DL_case_info
WHERE positivity_rate IS NOT NULL;

-- 1.3 Los 10 días con más casos positivos confirmados
SELECT date 'Fecha',
       cases_positive 'Casos positivos',
       deaths 'Fallecimientos'
FROM DL_case_info
WHERE cases_positive IS NOT NULL
ORDER BY cases_positive DESC
LIMIT 10;


/* ------------------------------------------------------------
   SECCIÓN 2 — HOSPITALIZACIONES
   ------------------------------------------------------------ */

-- 2.1 Promedio de pacientes asintomáticos, moderados y severos por año
SELECT STRFTIME('%Y', date) 'Año',
       ROUND(AVG(asymptomatic_patients), 0) 'Promedio de asintomáticos',
       ROUND(AVG(moderate_patients), 0) 'Promedio de pacientes moderados',
       ROUND(AVG(severe_patients), 0) 'Promedio de pacientes en estado severo'
FROM DL_hospitalizations
GROUP BY STRFTIME('%Y', date)
ORDER BY Año DESC;

-- 2.2 Porcentaje que representan los pacientes severos del total hospitalizado, por mes
SELECT STRFTIME('%Y', date) || '-' || STRFTIME('%m', date) 'Fecha',
       SUM(patients_in_hospital) 'Total de pacientes',
       SUM(severe_patients) 'Total de pacientes severos',
       ROUND(SUM(severe_patients) * 1.0 / SUM(patients_in_hospital) * 100, 2) || '%' 'Porcentaje de pacientes severos'
FROM DL_hospitalizations
GROUP BY STRFTIME('%m', date)
ORDER BY Fecha DESC;


/* ------------------------------------------------------------
   SECCIÓN 3 — VACUNACIÓN
   ------------------------------------------------------------ */

-- 3.1 Total de vacunas aplicadas por año
SELECT STRFTIME('%Y', date) 'Año',
       SUM(vax_total_24h) 'Total de vacunas'
FROM DL_vaccination
GROUP BY STRFTIME('%Y', date);

-- 3.2 Día con mayor cantidad de vacunaciones en 24 horas
SELECT date 'Fecha',
       MAX(vax_total_24h) 'Vacunas aplicadas'
FROM DL_vaccination;

-- 3.3 Evolución del acumulado de primeras dosis, mes a mes
SELECT STRFTIME('%m', date) 'Mes',
       SUM(vax_cumulative_first_dose) 'Acumulación de primera dosis'
FROM DL_vaccination
GROUP BY Mes
ORDER BY Mes DESC;

-- 3.4 Proporción entre primera y segunda dosis aplicada, por año
SELECT STRFTIME('%Y', date) 'Año',
       SUM(vax_cumulative_first_dose) 'Primera dosis',
       SUM(vax_cumulative_sec_dose) 'Segunda dosis'
FROM DL_vaccination
GROUP BY STRFTIME('%Y', date);


/* ------------------------------------------------------------
   SECCIÓN 4 — TESTING (PCR Y ANTÍGENO)
   ------------------------------------------------------------ */

-- 4.1 Mes con mayor cantidad de tests PCR realizados
SELECT STRFTIME('%Y', date) || '-' || STRFTIME('%m', date) 'Fecha',
       SUM(rtpcr_test_24h) 'Total de PCRs'
FROM DL_testing_status
GROUP BY STRFTIME('%m', date)
ORDER BY SUM(rtpcr_test_24h) DESC
LIMIT 1;

-- 4.2 Proporción entre tests PCR y tests de antígeno por año (% del total)
SELECT STRFTIME('%Y', date) 'Año',
       SUM(rtpcr_test_24h) 'Total de test PCR',
       SUM(antigen_test_24h) 'Total de test antígeno',
       SUM(rtpcr_test_24h) + SUM(antigen_test_24h) 'Total de test',
       CAST(ROUND(SUM(rtpcr_test_24h) * 1.0 / (SUM(rtpcr_test_24h) + SUM(antigen_test_24h)) * 100) AS INT) || '%' 'Porcentaje PCR'
FROM DL_testing_status
GROUP BY Año
ORDER BY Año DESC;


/* ------------------------------------------------------------
   SECCIÓN 5 — CONSULTAS CON JOIN (cruce entre tablas)
   ------------------------------------------------------------ */

-- 5.1 Relación entre tests realizados y casos positivos, por año
SELECT STRFTIME('%Y', dts.date) 'Año',
       SUM(dts.total_tests) 'Total de test',
       SUM(dli.cases_positive) 'Total de casos positivos'
FROM DL_testing_status dts
JOIN DL_case_info dli ON dts.date = dli.date
GROUP BY Año
ORDER BY Año DESC;

-- 5.2 Cantidad de tests necesarios para encontrar un caso positivo, por mes
SELECT STRFTIME('%Y', dts.date) || '-' || STRFTIME('%m', dts.date) 'Fecha',
       SUM(dts.total_tests) 'Total de test realizados',
       SUM(dli.cases_positive) 'Total de casos positivos',
       ROUND(SUM(dts.total_tests) / SUM(dli.cases_positive), 0) 'Test realizados por cada positivo'
FROM DL_testing_status dts
JOIN DL_case_info dli ON dts.date = dli.date
GROUP BY STRFTIME('%m', dts.date)
ORDER BY STRFTIME('%Y', dts.date) DESC;

-- 5.3 Vacunas aplicadas vs. casos nuevos detectados, por mes
SELECT STRFTIME('%Y', dlv.date) || '-' || STRFTIME('%m', dlv.date) 'Fecha',
       SUM(dlv.vax_total_24h) 'Total de vacunas',
       SUM(dci.cases_positive) 'Casos positivos'
FROM DL_vaccination dlv
JOIN DL_case_info dci ON dlv.date = dci.date
GROUP BY STRFTIME('%m', dlv.date)
ORDER BY SUM(dci.cases_positive) DESC;
