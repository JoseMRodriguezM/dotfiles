-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
  -- Install these LSPs automatically
  ensure_installed = {
    "lua_ls",
    "jsonls",
    "marksman",
    "quick_lint_js",
    "pyright",
  },
})

require("mason-tool-installer").setup({
  -- Install these linters, formatters, debuggers automatically
  ensure_installed = {},
})

-- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
vim.api.nvim_command("MasonToolsInstall")

local lsp_attach = function(client, bufnr)
  -- Create your keybindings here...
end

-- Call setup on each LSP server
require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
      handlers = {
        -- Add borders to LSP popups
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      },
    })
  end,
})

-- Lua LSP settings
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    },
  },
})
require("lspkind").init({
  -- DEPRECATED (use mode instead): enables text annotations
  --
  -- default: true
  -- with_text = true,

  -- defines how annotations are shown
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = "symbol_text",

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = "codicons",

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
  },
  })
