SELECT COUNT(*) AS total_records
FROM staging.application_train;


SELECT *
FROM staging.application_train
LIMIT 5;


DELETE FROM staging.application_train
WHERE "SK_ID_CURR" = 'SK_ID_CURR';


SELECT COUNT(*) AS total_records
FROM staging.application_train;