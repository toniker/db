SELECT exposure.asset.id
FROM exposure.asset
LEFT JOIN exposure.collection_has_asset ON exposure.asset.id = exposure.collection_has_asset.asset_id 
WHERE exposure.collection_has_asset.asset_id IS NULL 