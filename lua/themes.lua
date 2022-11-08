-- Nightfox
local status_ok, nightfox = pcall(require, 'nightfox')

if not status_ok then
    return
end

nightfox.setup({
  options = {
    styles = {
      comments = 'italic',
      keywords = 'bold',
      types = 'bold,italic',
    }
  }
})

vim.cmd('colorscheme nightfox')
