# kong-plugin-header-echo

A simple Kong plugin that echos a header

## How to run it

This assumes you already have configured a service called `mock-service` with a `host` of mockbin.org and a route for that service called `mock`

1. Add `kong-plugin-header-echo` to your `plugins` in your `kong.conf` file (e.g., `plugins = bundled, kong-plugin-header-echo`)
2. Make sure Kong can see the files
3. Start kong, pointing to your modified conf file: `$ kong start -c /path/to/your/kong.conf`
4. Add the plugin to the service:
```shell
$ curl -X POST \
    --url "http://localhost:8001/services/mock-service/plugins" \
    --data "name=kong-plugin-header-echo" \
    | python -mjson.tool
```
5. Call the service:
```shell
$ curl -i http://localhost:8000/mock/request -H 'Host: mockbin.org' -H 'X-Request-Echo: Hello, world'
```
It should return the following:
```
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
Content-Length: 1009
Connection: keep-alive
Date: Sun, 16 Sep 2018 15:48:34 GMT
Set-Cookie: __cfduid=d2d0ff0b9656e57ef63109e921dd5f3dc1537112914; expires=Mon, 16-Sep-19 15:48:34 GMT; path=/; domain=.mockbin.org; HttpOnly
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET
Access-Control-Allow-Headers: host,connection,accept-encoding,x-forwarded-for,cf-ray,x-forwarded-proto,cf-visitor,x-forwarded-host,x-forwarded-port,user-agent,accept,x-request-echo,cf-connecting-ip,x-request-id,via,connect-time,x-request-start,total-route-time
Access-Control-Allow-Credentials: true
X-Powered-By: mockbin
Vary: Accept, Accept-Encoding
Etag: W/"3f1-9UHYTnZeYVTcqAj0kbxUcw"
Via: kong/0.14.1
Server: cloudflare
CF-RAY: REDACTED
X-Response-Echo: Hello, World
X-Kong-Upstream-Latency: 291
X-Kong-Proxy-Latency: 123

{
  "startedDateTime": "2018-09-16T15:48:34.431Z",
  "clientIPAddress": "127.0.0.1",
  "method": "GET",
  "url": "http://mockbin.org/request",
  "httpVersion": "HTTP/1.1",
  "cookies": {},
  "headers": {
    "host": "mockbin.org",
    "connection": "close",
    "accept-encoding": "gzip",
    "x-forwarded-for": "127.0.0.1,71.205.210.45, 172.68.34.33",
    "cf-ray": "45b47a61f6ac4ff9-DEN",
    "x-forwarded-proto": "http",
    "cf-visitor": "{\"scheme\":\"http\"}",
    "x-forwarded-host": "mockbin.org",
    "x-forwarded-port": "80",
    "user-agent": "curl/7.58.0",
    "accept": "*/*",
    "x-request-echo": "Hello, World",
    "cf-connecting-ip": "71.205.210.45",
    "x-request-id": "3518ad66-5124-4dd8-b44d-945668eebf3d",
    "via": "1.1 vegur",
    "connect-time": "1",
    "x-request-start": "1537112914425",
    "total-route-time": "0"
  },
  "queryString": {},
  "postData": {
    "mimeType": "application/octet-stream",
    "text": "",
    "params": []
  },
  "headersSize": 536,
  "bodySize": 0
}
```
