print("--> Hello LUA, qiushui_007 test!")

-- 上传的数据参数值
value = 32.08

http = require("socket.http")
local ltn12 = require "ltn12"

-- lewei50
local reqbody = "[{\"Name\":\"T1\", \"Value\":\"" .. tostring(value) .. "\"}]"
local respbody = {}
local body, code, headers, status = http.request {
    method = "POST",
    url = "http://www.lewei50.com/api/V1/gateway/UpdateSensors/01",
    source = ltn12.source.string(reqbody),
    headers = {
      ["userkey"] = "36be8ff22f794f1e8a0bee3336eef237",
      ["Content-Type"] = "application/x-www-form-urlencoded",
      ["content-length"] = string.len(reqbody),
      ["Connection"] = "Close"
    },
    sink = ltn12.sink.table(respbody)
}

print("lewei50: " .. "reqbody = " .. reqbody)
print('body:' .. tostring(body))
print('code:' .. tostring(code))
print('status:' .. tostring(status))


-- yeelink
local reqbody = "{\"value\":" .. tostring(value) .. "}"
local respbody = {}
local body, code, headers, status = http.request {
    method = "POST",
    url = "http://api.yeelink.net/v1.0/device/4420/sensor/9089/datapoints",
    source = ltn12.source.string(reqbody),
    headers = {
      ["U-ApiKey"] = "729d1ba15b26b6a48f4807ef3f2f4df4",
      ["Content-Type"] = "application/x-www-form-urlencoded",
      ["content-length"] = string.len(reqbody),
      ["Connection"] = "Close"
    },
    sink = ltn12.sink.table(respbody)
}

print("yeelink: " .. "reqbody = " .. reqbody)
print('body:' .. tostring(body))
print('code:' .. tostring(code))
print('status:' .. tostring(status))
