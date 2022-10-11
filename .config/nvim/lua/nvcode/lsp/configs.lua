local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notify "LSP not found."
	return
end

local servers = {
	"clangd",
	"cssls",
	"html",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"svelte",
	"texlab",
	"tsserver"
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("nvcode.lsp.handlers").on_attach,
		capabilities = require("nvcode.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "nvcode.lsp.settings" .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
