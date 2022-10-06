local status_ok, mason = pcall(require, "mason")
if not status_ok then
	vim.notify "Mason not found."
	return
end

mason.setup {
}
