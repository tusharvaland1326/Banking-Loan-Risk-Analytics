SELECT
    COUNT(*) AS total_rows,

    COUNT(*) - COUNT("TARGET") AS target_null,

    COUNT(*) - COUNT("NAME_CONTRACT_TYPE") AS contract_type_null,

    COUNT(*) - COUNT("CODE_GENDER") AS gender_null,

    COUNT(*) - COUNT("FLAG_OWN_CAR") AS own_car_null,

    COUNT(*) - COUNT("FLAG_OWN_REALTY") AS own_realty_null,

    COUNT(*) - COUNT("CNT_CHILDREN") AS children_null,

    COUNT(*) - COUNT("AMT_INCOME_TOTAL") AS income_null,

    COUNT(*) - COUNT("AMT_CREDIT") AS credit_null,

    COUNT(*) - COUNT("AMT_ANNUITY") AS annuity_null,

    COUNT(*) - COUNT("AMT_GOODS_PRICE") AS goods_price_null

FROM staging.application_train;



