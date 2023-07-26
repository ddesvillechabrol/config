-- check if a work exist for cmp tab --
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local lsp = require("lspconfig")
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  completion = {
    autocomplete = false
  },
  performance = {
    max_view_entry = 200,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path'},
  })
})

local function config(_config)
  return vim.tbl_deep_extend("force", {
    on_attach = function()
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
      vim.keymap.set("n", "<leader>vco", function() vim.lsp.buf.code_action({
        filter = function(code_action)
          if not code_action or not code_action.data then
            return false
          end

          local data = code_action.data.id
          return string.sub(data, #data - 1, #data) == ":0"
        end,
        apply = true
      }) end)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
    end,
  }, _config or {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.ruff_lsp.setup(config())

lsp.pyright.setup(config({
  settings = {
    python = {
      analysis = {
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = "basic",
          reportOptionalMemberAccess = "none",
          reportOptionalSubscript = "none",
          reportPrivateImportUsage = "none",
        },
      }
    }
  }
}))

lsp.tsserver.setup(config())

lsp.eslint.setup(config())

lsp.html.setup(config({capabilities= capabilities}))

lsp.cssls.setup(config({capabilities= capabilities}))

lsp.tailwindcss.setup(config())

lsp.bashls.setup(config())

lsp.rust_analyzer.setup(config())

local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics

require("null-ls").setup {
  sources = {
    formatting.prettierd,
    formatting.black.with({ extra_args = { "--line-length", "120" } }),
    formatting.rustfmt,
    formatting.ruff,
    diagnostics.jsonlint,
  },
}
