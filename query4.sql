SELECT *
FROM exposure.asset
WHERE exposure.asset.user_id = '1' 

UNION ALL

SELECT *
FROM exposure.asset
WHERE exposure.asset.user_id = '2' 