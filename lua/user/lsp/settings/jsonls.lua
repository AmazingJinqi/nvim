-- Find more schemas here: https://www.schemastore.org/json/
local schemas = {
    -- {
    --     description = "TypeScript compiler configuration file",
    --     fileMatch = {
    --         "tsconfig.json",
    --         "tsconfig.*.json",
    --     },
    --     url = "https://json.schemastore.org/tsconfig.json",
    -- },
}

local extended_schemas = extend(schemas, default_schemas)

local opts = {
  settings = {
    json = {
      schemas = schemas,
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

return opts
