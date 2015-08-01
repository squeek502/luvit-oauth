local exports = {}

-- some hosts *cough* google appear to close the connection early / send no content-length header
-- allow this behaviour
function exports.isAnEarlyCloseHost (hostName)
	return hostName and hostName:match('.*google(apis)?.com$')
end

return exports
