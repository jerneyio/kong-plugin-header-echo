return {
  no_consumer = true,
  fields      = {
    requestHeader = {
      type     = "string",
      required = false,
      default  = "X-Request-Echo"
    },
    responseHeader = {
      type     = "string",
      required = false,
      default  = "X-Response-Echo"
    }
  }
}