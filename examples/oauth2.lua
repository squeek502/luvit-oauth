local OAuth2 = require('../init').OAuth2
local readline = require('readline')
local utils = require('utils')

local oauth2 = OAuth2:new({
	clientID = '{YOUR CLIENT ID}',
	clientSecret = '{YOUR CLIENT SECRET}',
	baseSite = 'https://github.com/login'
})

local opts = {redirect_uri = 'http://luvit.io/oauth'}

print('-----> Starting Github OAuth2')
local authURL = oauth2:getAuthorizeUrl(opts)
print('Go to this URL and paste code query param here:')
print(authURL)

readline.readLine('> ', {stdin = utils.stdin, stdout = utils.stdout}, function (err, line)
	if not line or line == "" then
		process:exit()
	end

	print('-----> Getting access tokens')

	oauth2:getOAuthAccessToken(line, opts, function (err, access_token, refresh_token, results)
		p(err, access_token, refresh_token, results)
	end)
end)
