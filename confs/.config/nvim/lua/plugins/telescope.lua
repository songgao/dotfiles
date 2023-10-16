return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>/", false },
    { "<leader>fF", false },
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Find Files" },
  },
}
