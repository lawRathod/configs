local prettier = {
  -- prettier
  function()
    return {
      exe = "yarn run prettier --write",
      args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
      stdin = false
    }
  end
}

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    go = {
      -- gofmt 
      function()
        return {
          exe = "gofmt",
          stdin = true
        }
      end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
    cpp = {
      -- clang-format
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true,
          cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
        }
      end
    }
  }
})
