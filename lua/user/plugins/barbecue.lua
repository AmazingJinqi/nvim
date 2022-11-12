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
        File = "",
        Package = "",
        Module = "",
        Namespace = "",
        Macro = "",
        Class = "",
        Constructor = "",
        Field = "",
        Property = "",
        Method = "",
        Struct = "",
        Event = "",
        Interface = "",
        Enum = "",
        EnumMember = "",
        Constant = "",
        Function = "",
        TypeParameter = "",
        Variable = "",
        Operator = "",
        Null = "",
        Boolean = "",
        Number = "",
        String = "",
        Key = "",
        Array = "",
        Object = "",
    },
}
