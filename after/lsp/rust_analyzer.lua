---@type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },

  filetypes = { "rust" },

  root_markers = {
    "rust-project.json",
    "Cargo.toml",
  },

  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },

      procMacro = {
        enable = true,
      },

      inlayHints = {
        bindingModeHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
        },
        closureCaptureHints = {
          enable = true,
        },
        closureReturnTypeHints = {
          enable = "always",
        },
        parameterHints = {
          enable = true,
        },
        typeHints = {
          enable = true,
        },
      },
    },
  },
}

