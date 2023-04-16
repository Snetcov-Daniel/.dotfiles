local function concat_tables(...)
  result = {}

  for _, dictionary in ipairs({...}) do
    for key, value in pairs(dictionary) do
      result[key] = value
    end
  end

  return result
end

return concat_tables
