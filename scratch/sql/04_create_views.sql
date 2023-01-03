/*-----------------------------------------------------------------------------
Hands-On Lab: Data Engineering with Snowpark
Script:       04_create_views.sql
Author:       Jeremiah Hansen
Last Updated: 1/2/2023
-----------------------------------------------------------------------------*/

USE ROLE HOL_ROLE;
USE WAREHOUSE HOL_WH;
USE SCHEMA HOL_DB.HARMONIZED;


-- ----------------------------------------------------------------------------
-- Step #1: Create some helper views
-- ----------------------------------------------------------------------------

CREATE OR REPLACE VIEW ORDERS_V
AS
SELECT 
    OH.ORDER_ID,
    OH.TRUCK_ID,
    OH.ORDER_TS,
    OD.ORDER_DETAIL_ID,
    OD.LINE_NUMBER,
    M.TRUCK_BRAND_NAME,
    M.MENU_TYPE,
    T.PRIMARY_CITY,
    T.REGION,
    T.COUNTRY,
    T.FRANCHISE_FLAG,
    T.FRANCHISE_ID,
    F.FIRST_NAME AS FRANCHISEE_FIRST_NAME,
    F.LAST_NAME AS FRANCHISEE_LAST_NAME,
    L.LOCATION_ID,
--    CPG.PLACEKEY,
--    CPG.LOCATION_NAME,
--    CPG.TOP_CATEGORY,
--    CPG.SUB_CATEGORY,
--    CPG.LATITUDE,
--    CPG.LONGITUDE,
--    CL.CUSTOMER_ID,
--    CL.FIRST_NAME,
--    CL.LAST_NAME,
--    CL.E_MAIL,
--    CL.PHONE_NUMBER,
--    CL.CHILDREN_COUNT,
--    CL.GENDER,
--    CL.MARITAL_STATUS,
    OD.MENU_ITEM_ID,
    M.MENU_ITEM_NAME,
    OD.QUANTITY,
    OD.UNIT_PRICE,
    OD.PRICE,
    OH.ORDER_AMOUNT,
    OH.ORDER_TAX_AMOUNT,
    OH.ORDER_DISCOUNT_AMOUNT,
    OH.ORDER_TOTAL
FROM RAW_POS.ORDER_DETAIL OD
JOIN RAW_POS.ORDER_HEADER OH
    ON OD.ORDER_ID = OH.ORDER_ID
JOIN RAW_POS.TRUCK T
    ON OH.TRUCK_ID = T.TRUCK_ID
JOIN RAW_POS.MENU M
    ON OD.MENU_ITEM_ID = M.MENU_ITEM_ID
JOIN RAW_POS.FRANCHISE F
    ON T.FRANCHISE_ID = F.FRANCHISE_ID
JOIN RAW_POS.LOCATION L
    ON OH.LOCATION_ID = L.LOCATION_ID
--JOIN RAW_SAFEGRAPH.CORE_POI_GEOMETRY CPG
--    ON CPG.PLACEKEY = L.PLACEKEY
--LEFT JOIN RAW_CUSTOMER.CUSTOMER_LOYALTY CL
--    ON OH.CUSTOMER_ID = CL.CUSTOMER_ID
;

-- Debug: SELECT * FROM ORDERS_V WHERE DATE_PART(YEAR, ORDER_TS) = 2021 LIMIT 100;
