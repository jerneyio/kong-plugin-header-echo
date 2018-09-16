package = "kong-plugin-header-echo"
version = "0.1.0-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.kong-plugin-header-echo.handler"] = "kong/plugins/kong-plugin-header-echo/handler.lua",
      ["kong.plugins.kong-plugin-header-echo.schema"] = "kong/plugins/kong-plugin-header-echo/schema.lua"
   }
}
