return {
	cmd = { os.getenv( "HOME" ) .. "/.rbenv/shims/solargraph", 'stdio' },
	settings = {
		solargraph = {
			autoformat = false,
			formatting = true,
			completion = true,
			diagnostic = true,
			folding = true,
			references = true,
			rename = true,
			symbols = true
		}
	}
}
