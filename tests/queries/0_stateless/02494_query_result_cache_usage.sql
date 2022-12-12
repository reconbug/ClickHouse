-- { echoOn }

SYSTEM DROP QUERY RESULT CACHE;

-- don't write query result into cache
SELECT 1 SETTINGS experimental_query_result_cache_active_usage = false;
SELECT count(*) FROM system.queryresult_cache;

-- try to retrieve from cache (which is empty)
SELECT 1 SETTINGS experimental_query_result_cache_passive_usage = true;

-- put query result into cache
SELECT 1 SETTINGS experimental_query_result_cache_active_usage = true;
SELECT count(*) FROM system.queryresult_cache;

-- put query result in cache and access it in further queries
SELECT 1 SETTINGS experimental_query_result_cache_passive_usage = true;

SYSTEM DROP QUERY RESULT CACHE;

-- { echoOff }