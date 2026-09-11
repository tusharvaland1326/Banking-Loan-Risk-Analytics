SELECT
    "SK_ID_CURR",
    COUNT(*) AS duplicate_count
FROM staging.application_train
GROUP BY "SK_ID_CURR"
HAVING COUNT(*) > 1;