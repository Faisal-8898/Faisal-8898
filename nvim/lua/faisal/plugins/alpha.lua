return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {

    "                        ",
   "   /$$$$$$$$ /$$                       /$$$$$$$         /$$$$$$ $$      /$$ /$$$$$$$$  ",
   "  |__  $$__/| $$                      | $$__  $$       |_ $$_/| $$$    /$$$| $$_____/  ",
   "     | $$   | $$$$$$$   /$$$$$$       | $$  \\ $$ /$$$$$$ |$$  | $$$$  /$$$$| $$       ",
   "     | $$   | $$__  $$ /$$__  $$      | $$$$$$$//$$__  $$|$$  | $$ $$/$$ $$| $$$$$    ",
   "     | $$   | $$  \\ $$| $$$$$$$$      | $$____/| $$  \\__/|$$  | $$  $$$| $$| $$__/    ",
   "     | $$   | $$  | $$| $$_____/      | $$     | $$      |$$  | $$\\  $ | $$| $$       ",
   "     | $$   | $$  | $$|  $$$$$$$      | $$     | $$     $$$$$$| $$ \\/  | $$| $$$$$$$$ ",
   "     |__/   |__/  |__/ \\_______/      |__/     |__/    |______/__/     |__/|________/ ",
                                                                                          
  "                        ",
  "                        ",
  "                        ",
  "                        ",
  "                               [ @github/Faisal-8898 ]                         ",
                               }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
    }

     -- Set layout
    dashboard.config.layout = {
      { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      dashboard.section.header,
      { type = "padding", val = 5 },
      dashboard.section.buttons,
      { type = "padding", val = 3 },
      dashboard.section.footer,
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
