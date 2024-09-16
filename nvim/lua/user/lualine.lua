local M = {
  "nvim-lualine/lualine.nvim",
  commit = "7533b0ead663d80452210c0c089e5105089697e5",
}

function M.config()
  -- local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
  -- vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = sl_hl.background })
  local icons = require("user.icons")
  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  -- local copilot = function()
  --     local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
  --     if #buf_clients == 0 then
  --         return "LSP Inactive"
  --     end
  --
  --     local buf_client_names = {}
  --     local copilot_active = false
  --
  --     for _, client in pairs(buf_clients) do
  --         if client.name ~= "null-ls" and client.name ~= "copilot" then
  --             table.insert(buf_client_names, client.name)
  --         end
  --
  --         if client.name == "copilot" then
  --             copilot_active = true
  --         end
  --     end
  --
  --     if copilot_active then
  --         return "%#Copilot#" .. icons.git.Octoface .. "%*"
  --     end
  --     return ""
  -- end

  -- added this from default nvim-basic-ide / launch.nvim
  local filename = {
    "filename",
    file_status = true, -- Displays file status (readonly status, modified status)
    newfile_status = false, -- Display new file status (new file means no write after created)
    path = 1, -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path
    -- 3: Absolute path, with tilde as the home directory

    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    -- for other components. (terrible name, any suggestions?)
    symbols = {
      modified = "[+]", -- Text to show when the file is modified.
      readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
      unnamed = "[No Name]", -- Text to show for unnamed buffers.
      newfile = "[New]", -- Text to show for newly created file before first write
    },
  }

  require("lualine").setup({
    options = {
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },
      disabled_filetypes = { "alpha", "dashboard", "NVimTree" },
    },
    sections = {
      -- lualine_a = { {"branch", icon =""} },
      -- lualine_b = { diff },
      -- lualine_c = { "diagnostics" },
      -- lualine_x = { copilot },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "progress" },
      -- lualine_a = { "mode" },
      -- lualine_b = { "branch" },
      -- lualine_c = { diff },
      -- lualine_x = { "diagnostics", copilot },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "progress" },
      -- tweaked this from default nvim-basic-ide / launch.nvim
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { filename },
      lualine_x = { "spaces", "encoding" },
      lualine_y = { "location" },
      lualine_z = { "progress" },
    },
    -- extensions = { "quickfix", "man", "fugitive" },
    extensions = { "quickfix" },
  })
end

return M
