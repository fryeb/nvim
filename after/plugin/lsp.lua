vim.g.build_dir = './build'
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
	"sumneko_lua",
	"clangd",
	"rust_analyzer",
	"omnisharp",
})
lsp.setup()
