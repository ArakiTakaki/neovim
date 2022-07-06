require('utils.isModuleAvailable')
local function command(command)
    vim.cmd(command)
end

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
  cmd = command,
}