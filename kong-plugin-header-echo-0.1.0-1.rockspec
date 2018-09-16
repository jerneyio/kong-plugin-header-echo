package = "kong-plugin-header-echo"
version = "0.1.0-1"
source = {
   url = "git//github.com/JoshTheGoldfish/kong-plugin-header-echo.git"
}
description = {
   homepage = "https://github.com/JoshTheGoldfish/kong-plugin-header-echo",
   license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "kong >= 0.14"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.kong-plugin-header-echo.handler"] = "kong/plugins/kong-plugin-header-echo/handler.lua",
      ["kong.plugins.kong-plugin-header-echo.schema"] = "kong/plugins/kong-plugin-header-echo/schema.lua"
   }
}
