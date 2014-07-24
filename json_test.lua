--[[
JSON4Lua example script.
Demonstrates the simple functionality of the json module.
]]--
-- json.lua在本目录下
json = require('json')

-- Object to JSON encode
test = {
  one='first', two='second', three={2,3,5}
}

jsonTest = json.encode(test)
print('JSON encoded test is: ' .. jsonTest)
-- JSON encoded test is: {"one":"first","three":[2,3,5],"two":"second"}

-- Now JSON decode the json string
result = json.decode(jsonTest)

print ("The decoded table result:")
table.foreach(result,print)
print ("The decoded table result.three")
table.foreach(result.three, print)

-- 测试直接的json字符串, 不按字串中的顺序输出排列.
json_str = '{"A":1, "B":2, "C":3, "D":4}'
result = json.decode(json_str)

for k,v in pairs(result) do
    print(k..":"..v)
end
