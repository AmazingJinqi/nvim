local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

null_ls.setup {
    debug = false,
    sources = {
        -- Git
        actions.gitsigns,

        -- Python
        -- Pylint is a Python static code analysis tool.
        diagnostics.pylint,
        -- flake8 is a python tool that glues together pycodestyle, pyflakes, mccabe, and third-party plugins to check the style and quality of Python code.
        diagnostics.flake8,
        -- Vulture finds unused code in Python programs.
        diagnostics.vulture,
        -- Python utility / library to sort imports alphabetically and automatically separate them into sections and by type.
        formatting.isort,
        -- The uncompromising Python code formatter.
        formatting.black,
        -- Tool for automatically reordering python imports. Similar to isort but uses static analysis more.
        formatting.reorder_python_imports,

        -- Golang
        -- A Go linter aggregator.
        -- diagnostics.golangci_lint,
        -- Formats go programs.
        -- formatting.gofmt,
        formatting.gofumpt,
        -- Updates your Go import lines, adding missing ones and removing unreferenced ones.
        formatting.goimports,
        -- Tool for Golang to sort goimports by 3 groups: std, general and project dependencies.
        formatting.goimports_reviser,
        -- -- Applies a base formatter (eg. goimports or gofmt), then shortens long lines of code.
        -- formatting.golines,
    },
}
