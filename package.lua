return {
	name = "squeek502/oauth",
	version = "0.2.2",
	description = "OAuth wrapper for Luvit",
	keywords = {"oauth", "oauth2"},
	homepage = "https://github.com/squeek502/luvit-oauth",
	license = "MIT",
	author = {
		name = "Dmitri Voronianski",
		email = "dmitri.voronianski@gmail.com"
	},
	contributors = {
		"Ryan Liptak",
	},
	dependencies = {
		"luvit/luvit@2.4.0",
		"luvit/http@1.2.1",
	},
	files = {
		"!tests",
		"**.lua"
	}
}
