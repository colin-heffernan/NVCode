local status_ok, todo = pcall(require, "todo-comments")
if not status_ok then
	vim.notify "Todo-comments not found."
	return
end

todo.setup {
	signs = false
}
