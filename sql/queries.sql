USE DiabetesDB;

USE DiabetesDB;

SELECT
    CASE WHEN Outcome = 1 THEN 'Diabetic'
         ELSE 'Healthy' END AS patient_type,
    COUNT(*) AS total_patients,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes), 1) AS percentage
FROM diabetes
GROUP BY Outcome;

USE DiabetesDB;

SELECT
    CASE WHEN Outcome = 1 THEN 'Diabetic'
         ELSE 'Healthy' END AS patient_type,
    ROUND(AVG(Glucose), 1)       AS avg_glucose,
    ROUND(AVG(BMI), 1)           AS avg_bmi,
    ROUND(AVG(Age), 1)           AS avg_age,
    ROUND(AVG(BloodPressure), 1) AS avg_blood_pressure
FROM diabetes
GROUP BY Outcome;

USE DiabetesDB;

SELECT
    COUNT(*) AS high_risk_patients,
    ROUND(AVG(Age), 1)     AS average_age,
    ROUND(AVG(Glucose), 1) AS average_glucose,
    ROUND(AVG(BMI), 1)     AS average_bmi
FROM diabetes
WHERE Glucose > 140
  AND BMI > 30
  AND Outcome = 1;

  USE DiabetesDB;

SELECT
    CASE
        WHEN Age < 30 THEN 'Young (under 30)'
        WHEN Age BETWEEN 30 AND 45 THEN 'Middle Age (30-45)'
        WHEN Age BETWEEN 45 AND 60 THEN 'Senior (45-60)'
        ELSE 'Elderly (60+)'
    END AS age_group,
    COUNT(*) AS total_patients,
    SUM(Outcome) AS diabetic_count,
    ROUND(SUM(Outcome) * 100.0 / COUNT(*), 1) AS diabetes_rate_percent
FROM diabetes
GROUP BY
    CASE
        WHEN Age < 30 THEN 'Young (under 30)'
        WHEN Age BETWEEN 30 AND 45 THEN 'Middle Age (30-45)'
        WHEN Age BETWEEN 45 AND 60 THEN 'Senior (45-60)'
        ELSE 'Elderly (60+)'
    END
ORDER BY diabetes_rate_percent DESC;