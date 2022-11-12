local alpha_status_ok, alpha = pcall(require, "alpha")

if not alpha_status_ok then
    return
end

local telescope_status_ok, _ = pcall(require, "telescope")

if not telescope_status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", "<cmd> Telescope find_files <CR>"),
    dashboard.button("e", "  New file", "<cmd> ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project",
        "<cmd> lua require'telescope'.extensions.project.project{ display_type = 'full' } <CR>"),
    dashboard.button("r", "  Recently used files", "<cmd> Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", "<cmd> Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", "<cmd> e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit Neovim", "<cmd> qa <CR>"),
}

local function footer()
    return "Jinqi Liu"
end

dashboard.section.footer.val = footer()

alpha.setup(dashboard.opts)