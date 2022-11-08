local status_ok, bufferline = pcall(require, 'bufferline')

if not status_ok then
    return
end

bufferline.setup {
    options = {
        indicator = { icon = '' },
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        separator_style = 'thin',
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_buffer_icons = true,
        show_tab_indicators = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        },
    },
}
