-- モジュールが存在しているかどうかの判定
local function isModuleAvailable(strModuleName)
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
Util =  {
  isModuleAvailable = isModuleAvailable,
}