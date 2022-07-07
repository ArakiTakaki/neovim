local util = {}

-- モジュールが存在しているかどうかの判定
util.isModuleAvailable = function (strModuleName)
  if package.loaded[strModuleName] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(strModuleName)
      if type(loader) == 'function' then
        package.preload[strModuleName] = loader
        return true
      end
    end
    return false
  end
end

util.map = function(func, seq)
  local result = {}
  for _, v in ipairs(seq) do
    table.insert(result, func(v))
  end

  return result
end

return util
