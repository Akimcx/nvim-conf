return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  config = function()
    require("nvim-tree").setup {}
  end,
}
