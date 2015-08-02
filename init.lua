local qs = require("querystring")

-- compat with luvit versions that don't have stringify
if not qs.stringify then

	-- ensure that spaces get encoded as %20 instead of +
	function qs.urlencode(str)
		if str then
			str = string.gsub(str, '\n', '\r\n')
			str = string.gsub(str, '([^%w])', function(c)
				return string.format('%%%02X', string.byte(c))
			end)
		end
		return str
	end

	local function stringifyPrimitive(v)
		return tostring(v)
	end

	function qs.stringify(params, sep, eq)
		if not sep then sep = '&' end
		if not eq then eq = '=' end
		if type(params) == "table" then
			local fields = {}
			for key,value in pairs(params) do
				local keyString = qs.urlencode(stringifyPrimitive(key)) .. eq
				if type(value) == "table" then
					for _, v in ipairs(value) do
						table.insert(fields, keyString .. qs.urlencode(stringifyPrimitive(v)))
					end
				else
					table.insert(fields, keyString .. qs.urlencode(stringifyPrimitive(value)))
				end
			end
			return table.concat(fields, sep)
		end
		return ''
	end

end

return {
	OAuth = nil,
	OAuth2 = require('./libs/oauth2')
}
