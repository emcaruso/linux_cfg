return {
  "voldikss/vim-floaterm",
  keys = {
    {
      "<C-e>",
      ":FloatermToggle<CR><C-\\><C-n>:FloatermUpdate --width=0.9 --height=0.9<CR>",
      silent = true,
      mode = { "n" },
    },
    { "<C-e>", "<C-\\><C-n>:FloatermToggle<CR>", silent = true, mode = { "t" } },
    {
      "<C-Down>",
      "<C-\\><C-n>:FloatermKill<CR>:FloatermToggle<CR><C-\\><C-n>:FloatermUpdate --width=0.9 --height=0.9<CR>",
      silent = true,
      mode = { "t" },
    },
    { "<C-Up>", "<C-\\><C-n>:FloatermNew --width=0.9 --height=0.9<CR>", silent = true, mode = { "t" } },
    { "<C-Right>", "<C-\\><C-n>:FloatermNext<CR>", silent = true, mode = { "t" } },
    { "<C-Left>", "<C-\\><C-n>:FloatermPrev<CR>", silent = true, mode = { "t" } },
  },
}
