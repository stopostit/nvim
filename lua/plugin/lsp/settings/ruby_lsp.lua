return {
	cmd = { "ruby-lsp", 'stdio' },
	settings = {
		rubyLsp = {
			enableRails = true,
			enabledFeatures = {
				{
					"diagnostics",
					"document_symbol",
					"formating"
				}
			}
		}
	}
}
