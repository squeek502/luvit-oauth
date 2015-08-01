# luvit-oauth

Simple [OAuth2](http://en.wikipedia.org/wiki/OAuth2#OAuth_2.0) API for [luvit.io](http://luvit.io). It allows users to authenticate against providers and thus act as OAuth consumers. Tested against Github (http://github.com).

## Examples

To run examples clone this repo, create your application on Github (for [OAuth2](http://en.wikipedia.org/wiki/OAuth2#OAuth_2.0)), paste necessary keys and secrets into files and execute them like ``luvit examples/oauth2.lua``:

### OAuth2.0

```lua
local OAuth2 = require('oauth').OAuth2

local oauth2 = OAuth2:new({
	clientID = '{{YOUR CLIENT ID}}',
	clientSecret = '{{YOUR CLIENT SECRET}}',
	baseSite = 'https://github.com/login'
})

local opts = {redirect_uri = 'http://luvit.io/oauth'}

-- go to received URL and copy code
local authURL = oauth2:getAuthorizeUrl(opts)

oauth2:getOAuthAccessToken('{{YOUR CODE}}', opts, function (err, access_token, refresh_token, results)
	p(err, access_token, refresh_token, results)
end)
```

## API

### OAuth 2.0

##### Initialize

##### ``:new(options)``

Create instance of ``OAuth2`` class by calling ``:new(options)`` with ``options`` table as the only argument.

##### Options

- ``clientID`` - required client id
- ``clientSecret`` - required client secret
- ``baseSite`` - required base OAuth provider url
- ``authorizePath`` - optional, default ``'/oauth/authorize'``
- ``accessTokenPath`` - optional, default ``'/oauth/access_token'``
- ``customHeaders`` - optional table with http headers to be sent in the requests

##### ``:setAccessTokenName(name)``

Change ``access_token`` param name to different one if authorization server waits for another.

##### ``:setAuthMethod(method)``

Change authorization method that defaults to ``Bearer``.

##### ``:setUseAuthorizationHeaderForGET(useIt)``

If you use the ``OAuth2`` exposed ``:get()`` shortener method this will specify whether to use an ``'Authorization'`` header instead of passing the ``access_token`` as a query parameter.

##### ``:getAuthorizeUrl(params)``

Get an authorization url to proceed flow and receive ``code`` that will be used for getting ``access_token``.

##### ``:getOAuthAccessToken(code, params, callback)``

Get an access token from the authorization server.

##### ``:request(url, opts, callback)``

Allows to make OAuth2 signed requests to provided API ``url`` string.

##### Options

- ``method`` - http method that will be send, required (not necessary with [shorteners](https://github.com/luvitrocks/luvit-oauth#shorteners))
- ``access_token`` - required access token
- ``post_body`` - body that will be sent with ``POST`` or ``PUT``
- ``post_content_type`` - content type for ``POST`` or ``PUT`` requests, default ``application/x-www-form-urlencoded``
- ``headers`` - optional table with values that will be sent with request

### Shorteners

These methods allow to skip ``method`` field in request options for both ``OAuth`` and ``OAuth2`` implementations:

- **``:get(url, options, callback)``**
- **``:post(url, options, callback)``**
- **``:put(url, options, callback)``**
- **``:patch(url, options, callback)``**
- **``:delete(url, options, callback)``**

## License

MIT Licensed

Copyright (c) 2014 Dmitri Voronianski [dmitri.voronianski@gmail.com](mailto:dmitri.voronianski@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
