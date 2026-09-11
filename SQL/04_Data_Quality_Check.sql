SELECT
    "TARGET",
    COUNT(*) AS total_customers
FROM staging.application_train
GROUP BY "TARGET"
ORDER BY "TARGET";



SELECT
    "CODE_GENDER",
    COUNT(*) AS total_customers
FROM staging.application_train
GROUP BY "CODE_GENDER"
ORDER BY total_customers DESC;



SELECT
    "NAME_CONTRACT_TYPE",
    COUNT(*) AS total_loans
FROM staging.application_train
GROUP BY "NAME_CONTRACT_TYPE";



SELECT
    COUNT(*) AS negative_income_records
FROM staging.application_train
WHERE CAST("AMT_INCOME_TOTAL" AS NUMERIC) < 0;



SELECT
    COUNT(*) AS invalid_credit_amount
FROM staging.application_train
WHERE CAST("AMT_CREDIT" AS NUMERIC) <= 0;



SELECT
    COUNT(*) AS invalid_goods_price
FROM staging.application_train
WHERE CAST("AMT_GOODS_PRICE" AS NUMERIC) <= 0;




SELECT
    MAX(CAST("CNT_CHILDREN" AS NUMERIC)) AS maximum_children,
    MIN(CAST("CNT_CHILDREN" AS NUMERIC)) AS minimum_children
FROM staging.application_train;




SELECT
    MAX(CAST("CNT_FAM_MEMBERS" AS NUMERIC)) AS maximum_family_members,
    MIN(CAST("CNT_FAM_MEMBERS" AS NUMERIC)) AS minimum_family_members
FROM staging.application_train;




SELECT
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaulted_applications,

    SUM(
        CASE
            WHEN "TARGET" = '0' THEN 1
            ELSE 0
        END
    ) AS non_defaulted_applications,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train;




SELECT
    "CODE_GENDER" AS gender,
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY "CODE_GENDER"

ORDER BY default_rate_percent DESC;




SELECT
    "NAME_CONTRACT_TYPE" AS contract_type,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent
FROM staging.application_train
GROUP BY "NAME_CONTRACT_TYPE"
ORDER BY default_rate_percent DESC;




SELECT
    "FLAG_OWN_CAR" AS own_car,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent
FROM staging.application_train
GROUP BY "FLAG_OWN_CAR"
ORDER BY default_rate_percent DESC;




SELECT
    "FLAG_OWN_REALTY" AS own_property,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent
FROM staging.application_train
GROUP BY "FLAG_OWN_REALTY"
ORDER BY default_rate_percent DESC;



SELECT
    "NAME_INCOME_TYPE" AS income_type,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent
FROM staging.application_train
GROUP BY "NAME_INCOME_TYPE"
ORDER BY default_rate_percent DESC;




SELECT
    "NAME_EDUCATION_TYPE" AS education_type,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent
FROM staging.application_train
GROUP BY "NAME_EDUCATION_TYPE"
ORDER BY default_rate_percent DESC;




SELECT
    "NAME_FAMILY_STATUS" AS family_status,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent
FROM staging.application_train
GROUP BY "NAME_FAMILY_STATUS"
ORDER BY default_rate_percent DESC;





SELECT
    "NAME_HOUSING_TYPE" AS housing_type,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent
FROM staging.application_train
GROUP BY "NAME_HOUSING_TYPE"
ORDER BY default_rate_percent DESC;




SELECT
    "OCCUPATION_TYPE" AS occupation_type,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent
FROM staging.application_train
WHERE "OCCUPATION_TYPE" IS NOT NULL
GROUP BY "OCCUPATION_TYPE"
ORDER BY default_rate_percent DESC;



SELECT
    "NAME_INCOME_TYPE" AS income_type,
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY "NAME_INCOME_TYPE"

ORDER BY default_rate_percent DESC;




SELECT
    "NAME_EDUCATION_TYPE" AS education_type,
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY "NAME_EDUCATION_TYPE"

ORDER BY default_rate_percent DESC;





SELECT
    "NAME_FAMILY_STATUS" AS family_status,
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY "NAME_FAMILY_STATUS"

ORDER BY default_rate_percent DESC;




SELECT
    "NAME_HOUSING_TYPE" AS housing_type,
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY "NAME_HOUSING_TYPE"

ORDER BY default_rate_percent DESC;




SELECT
    "OCCUPATION_TYPE" AS occupation_type,
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

WHERE "OCCUPATION_TYPE" IS NOT NULL

GROUP BY "OCCUPATION_TYPE"

ORDER BY default_rate_percent DESC;




SELECT
    "CODE_GENDER" AS gender,
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY "CODE_GENDER"

ORDER BY default_rate_percent DESC;






SELECT
    CASE
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 25 THEN 'Under 25'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 35 THEN '25-34'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 45 THEN '35-44'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 25 THEN 'Under 25'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 35 THEN '25-34'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 45 THEN '35-44'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 55 THEN '45-54'
        ELSE '55+'
    END

ORDER BY default_rate_percent DESC;



SELECT
    CASE
        WHEN "AMT_INCOME_TOTAL"::numeric < 50000 THEN 'Below 50K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 100000 THEN '50K-100K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 300000 THEN '200K-300K'
        ELSE '300K+'
    END AS income_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_INCOME_TOTAL"::numeric < 50000 THEN 'Below 50K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 100000 THEN '50K-100K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 300000 THEN '200K-300K'
        ELSE '300K+'
    END

ORDER BY default_rate_percent DESC;




SELECT
    CASE
        WHEN "AMT_CREDIT"::numeric < 100000 THEN 'Below 100K'
        WHEN "AMT_CREDIT"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_CREDIT"::numeric < 300000 THEN '200K-300K'
        WHEN "AMT_CREDIT"::numeric < 500000 THEN '300K-500K'
        ELSE '500K+'
    END AS credit_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_CREDIT"::numeric < 100000 THEN 'Below 100K'
        WHEN "AMT_CREDIT"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_CREDIT"::numeric < 300000 THEN '200K-300K'
        WHEN "AMT_CREDIT"::numeric < 500000 THEN '300K-500K'
        ELSE '500K+'
    END

ORDER BY default_rate_percent DESC;





SELECT
    CASE
        WHEN "AMT_ANNUITY"::numeric < 20000 THEN 'Below 20K'
        WHEN "AMT_ANNUITY"::numeric < 40000 THEN '20K-40K'
        WHEN "AMT_ANNUITY"::numeric < 60000 THEN '40K-60K'
        WHEN "AMT_ANNUITY"::numeric < 100000 THEN '60K-100K'
        ELSE '100K+'
    END AS annuity_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_ANNUITY"::numeric < 20000 THEN 'Below 20K'
        WHEN "AMT_ANNUITY"::numeric < 40000 THEN '20K-40K'
        WHEN "AMT_ANNUITY"::numeric < 60000 THEN '40K-60K'
        WHEN "AMT_ANNUITY"::numeric < 100000 THEN '60K-100K'
        ELSE '100K+'
    END

ORDER BY default_rate_percent DESC;




SELECT
    CASE
        WHEN "AMT_GOODS_PRICE"::numeric < 100000 THEN 'Below 100K'
        WHEN "AMT_GOODS_PRICE"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_GOODS_PRICE"::numeric < 300000 THEN '200K-300K'
        WHEN "AMT_GOODS_PRICE"::numeric < 500000 THEN '300K-500K'
        ELSE '500K+'
    END AS goods_price_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_GOODS_PRICE"::numeric < 100000 THEN 'Below 100K'
        WHEN "AMT_GOODS_PRICE"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_GOODS_PRICE"::numeric < 300000 THEN '200K-300K'
        WHEN "AMT_GOODS_PRICE"::numeric < 500000 THEN '300K-500K'
        ELSE '500K+'
    END

ORDER BY default_rate_percent DESC;





SELECT
    CASE
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0)) < 1
            THEN 'Below 1'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0)) < 2
            THEN '1-2'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0)) < 3
            THEN '2-3'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0)) < 4
            THEN '3-4'
        ELSE '4+'
    END AS credit_income_ratio_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0)) < 1
            THEN 'Below 1'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0)) < 2
            THEN '1-2'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0)) < 3
            THEN '2-3'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0)) < 4
            THEN '3-4'
        ELSE '4+'
    END

ORDER BY default_rate_percent DESC;





SELECT
    CASE
        WHEN ("AMT_ANNUITY"::numeric / NULLIF("AMT_CREDIT"::numeric, 0)) < 0.10
            THEN 'Below 10%'
        WHEN ("AMT_ANNUITY"::numeric / NULLIF("AMT_CREDIT"::numeric, 0)) < 0.20
            THEN '10%-20%'
        WHEN ("AMT_ANNUITY"::numeric / NULLIF("AMT_CREDIT"::numeric, 0)) < 0.30
            THEN '20%-30%'
        WHEN ("AMT_ANNUITY"::numeric / NULLIF("AMT_CREDIT"::numeric, 0)) < 0.40
            THEN '30%-40%'
        ELSE '40%+'
    END AS annuity_credit_ratio_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN ("AMT_ANNUITY"::numeric / NULLIF("AMT_CREDIT"::numeric, 0)) < 0.10
            THEN 'Below 10%'
        WHEN ("AMT_ANNUITY"::numeric / NULLIF("AMT_CREDIT"::numeric, 0)) < 0.20
            THEN '10%-20%'
        WHEN ("AMT_ANNUITY"::numeric / NULLIF("AMT_CREDIT"::numeric, 0)) < 0.30
            THEN '20%-30%'
        WHEN ("AMT_ANNUITY"::numeric / NULLIF("AMT_CREDIT"::numeric, 0)) < 0.40
            THEN '30%-40%'
        ELSE '40%+'
    END

ORDER BY default_rate_percent DESC;




SELECT
    CASE
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_GOODS_PRICE"::numeric, 0)) < 0.75
            THEN 'Below 75%'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_GOODS_PRICE"::numeric, 0)) < 1.00
            THEN '75%-100%'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_GOODS_PRICE"::numeric, 0)) < 1.25
            THEN '100%-125%'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_GOODS_PRICE"::numeric, 0)) < 1.50
            THEN '125%-150%'
        ELSE '150%+'
    END AS credit_goods_ratio_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_GOODS_PRICE"::numeric, 0)) < 0.75
            THEN 'Below 75%'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_GOODS_PRICE"::numeric, 0)) < 1.00
            THEN '75%-100%'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_GOODS_PRICE"::numeric, 0)) < 1.25
            THEN '100%-125%'
        WHEN ("AMT_CREDIT"::numeric / NULLIF("AMT_GOODS_PRICE"::numeric, 0)) < 1.50
            THEN '125%-150%'
        ELSE '150%+'
    END

ORDER BY default_rate_percent DESC;



SELECT
    CASE
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0) < 1 THEN 'Below 1'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0) < 2 THEN '1-2'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0) < 3 THEN '2-3'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0) < 4 THEN '3-4'
        ELSE '4+'
    END AS credit_income_ratio_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0) < 1 THEN 'Below 1'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0) < 2 THEN '1-2'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0) < 3 THEN '2-3'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_INCOME_TOTAL"::numeric, 0) < 4 THEN '3-4'
        ELSE '4+'
    END

ORDER BY default_rate_percent DESC;



SELECT
    CASE
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 25 THEN 'Under 25'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 35 THEN '25-34'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 45 THEN '35-44'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 25 THEN 'Under 25'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 35 THEN '25-34'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 45 THEN '35-44'
        WHEN "DAYS_BIRTH"::numeric / -365.25 < 55 THEN '45-54'
        ELSE '55+'
    END

ORDER BY default_rate_percent DESC;




SELECT
    CASE
        WHEN "AMT_INCOME_TOTAL"::numeric < 50000 THEN 'Below 50K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 100000 THEN '50K-100K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 300000 THEN '200K-300K'
        ELSE '300K+'
    END AS income_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_INCOME_TOTAL"::numeric < 50000 THEN 'Below 50K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 100000 THEN '50K-100K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_INCOME_TOTAL"::numeric < 300000 THEN '200K-300K'
        ELSE '300K+'
    END

ORDER BY default_rate_percent DESC;




SELECT
    CASE
        WHEN "AMT_CREDIT"::numeric < 100000 THEN 'Below 100K'
        WHEN "AMT_CREDIT"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_CREDIT"::numeric < 300000 THEN '200K-300K'
        WHEN "AMT_CREDIT"::numeric < 500000 THEN '300K-500K'
        ELSE '500K+'
    END AS credit_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_CREDIT"::numeric < 100000 THEN 'Below 100K'
        WHEN "AMT_CREDIT"::numeric < 200000 THEN '100K-200K'
        WHEN "AMT_CREDIT"::numeric < 300000 THEN '200K-300K'
        WHEN "AMT_CREDIT"::numeric < 500000 THEN '300K-500K'
        ELSE '500K+'
    END

ORDER BY default_rate_percent DESC;





SELECT
    CASE
        WHEN "AMT_ANNUITY"::numeric < 20000 THEN 'Below 20K'
        WHEN "AMT_ANNUITY"::numeric < 40000 THEN '20K-40K'
        WHEN "AMT_ANNUITY"::numeric < 60000 THEN '40K-60K'
        WHEN "AMT_ANNUITY"::numeric < 100000 THEN '60K-100K'
        ELSE '100K+'
    END AS annuity_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_ANNUITY"::numeric < 20000 THEN 'Below 20K'
        WHEN "AMT_ANNUITY"::numeric < 40000 THEN '20K-40K'
        WHEN "AMT_ANNUITY"::numeric < 60000 THEN '40K-60K'
        WHEN "AMT_ANNUITY"::numeric < 100000 THEN '60K-100K'
        ELSE '100K+'
    END

ORDER BY default_rate_percent DESC;




SELECT
    CASE
        WHEN "AMT_ANNUITY"::numeric < 20000 THEN 'Below 20K'
        WHEN "AMT_ANNUITY"::numeric < 40000 THEN '20K-40K'
        WHEN "AMT_ANNUITY"::numeric < 60000 THEN '40K-60K'
        WHEN "AMT_ANNUITY"::numeric < 100000 THEN '60K-100K'
        ELSE '100K+'
    END AS annuity_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "AMT_ANNUITY"::numeric < 20000 THEN 'Below 20K'
        WHEN "AMT_ANNUITY"::numeric < 40000 THEN '20K-40K'
        WHEN "AMT_ANNUITY"::numeric < 60000 THEN '40K-60K'
        WHEN "AMT_ANNUITY"::numeric < 100000 THEN '60K-100K'
        ELSE '100K+'
    END

ORDER BY default_rate_percent DESC;




SELECT
    CASE
        WHEN "DAYS_EMPLOYED"::numeric < 2 * 365 THEN 'Below 2 Years'
        WHEN "DAYS_EMPLOYED"::numeric < 5 * 365 THEN '2-5 Years'
        WHEN "DAYS_EMPLOYED"::numeric < 10 * 365 THEN '5-10 Years'
        WHEN "DAYS_EMPLOYED"::numeric < 20 * 365 THEN '10-20 Years'
        ELSE '20+ Years'
    END AS employment_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

GROUP BY
    CASE
        WHEN "DAYS_EMPLOYED"::numeric < 2 * 365 THEN 'Below 2 Years'
        WHEN "DAYS_EMPLOYED"::numeric < 5 * 365 THEN '2-5 Years'
        WHEN "DAYS_EMPLOYED"::numeric < 10 * 365 THEN '5-10 Years'
        WHEN "DAYS_EMPLOYED"::numeric < 20 * 365 THEN '10-20 Years'
        ELSE '20+ Years'
    END

ORDER BY default_rate_percent DESC;




SELECT
    CASE
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_ANNUITY"::numeric, 0) < 24 THEN 'Below 2 Years'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_ANNUITY"::numeric, 0) < 48 THEN '2-4 Years'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_ANNUITY"::numeric, 0) < 72 THEN '4-6 Years'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_ANNUITY"::numeric, 0) < 120 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS loan_term_group,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percent

FROM staging.application_train

WHERE "AMT_ANNUITY"::numeric > 0

GROUP BY
    CASE
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_ANNUITY"::numeric, 0) < 24 THEN 'Below 2 Years'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_ANNUITY"::numeric, 0) < 48 THEN '2-4 Years'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_ANNUITY"::numeric, 0) < 72 THEN '4-6 Years'
        WHEN "AMT_CREDIT"::numeric / NULLIF("AMT_ANNUITY"::numeric, 0) < 120 THEN '6-10 Years'
        ELSE '10+ Years'
    END

ORDER BY default_rate_percent DESC;



SELECT
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS total_defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS overall_default_rate_percent

FROM staging.application_train;




SELECT
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN "TARGET" = '1' THEN 1
            ELSE 0
        END
    ) AS total_defaults,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "TARGET" = '1' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS overall_default_rate_percent

FROM staging.application_train;