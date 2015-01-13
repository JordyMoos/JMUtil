
JMUtil = {}

---
-- @param obj
-- @param seen
--
function JMUtil.copyTable(obj, seen)
    -- Handle non-tables and previously-seen tables.
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end

    -- New table; mark it as seen an copy recursively.
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[JMUtil.copyTable(k, s)] = JMUtil.copyTable(v, s) end
    return res
end
