local BasePlugin = require "kong.plugins.base_plugin"

local EchoHandler = BasePlugin:extend()
local cache = kong.cache


EchoHandler.PRIORITY = 2000
EchoHandler.VERSION = "0.1.0"

function EchoHandler:new()
  EchoHandler.super.new(self, "kong-plugin-header-echo")

  self.echo_string = ""

  kong.log("In EchoHandler:new(). self.echo_string is: " .. self.echo_string)
end

function EchoHandler:access(conf)
  EchoHandler.super.access(self)

  kong.log("In EchoHandler:accept(). self.echo_string is: " .. self.echo_string)

  self.echo_string = kong.request.get_header(conf.requestHeader)
end

function EchoHandler:header_filter(conf)
  EchoHandler.super.header_filter(self)

  kong.log("In EchoHandler:header_filter(). self.echo_string is: " .. self.echo_string)

  if self.echo_string ~= "" then
    kong.response.set_header(conf.responseHeader, self.echo_string)
  end
end

return EchoHandler