local status_ok, barbecue = pcall(require, 'barbecue')

if not status_ok then
    return
end

barbecue.setup {
    ---whether to create winbar updater autocmd
    create_autocmd = true,

    ---filetypes not to enable winbar in
    exclude_filetypes = { "toggleterm" },
    kinds = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
    },
}
