return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({
      { "<leader>?", function() wk.show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },

      -- Insert
      { "jj", "<Esc>", mode = "i", desc = "Выйти из режима вставки" },

      -- Buffers
      { "<leader>w", "<cmd>w<cr>", desc = "Сохранить файл" },
      { "<leader>q", "<cmd>q<cr>", desc = "Выйти из текущего окна" },
      { "<leader>wq", "<cmd>wq<cr>", desc = "Сохранить и выйти" },

      -- Navigation
      { "<C-k>", "<cmd>wincmd k<cr>", desc = "Фокус на окно сверху" },
      { "<C-j>", "<cmd>wincmd j<cr>", desc = "Фокус на окно снизу" },
      { "<C-h>", "<cmd>wincmd h<cr>", desc = "Фокус на окно слева" },
      { "<C-l>", "<cmd>wincmd l<cr>", desc = "Фокус на окно справа" },

      -- Splits
      { "|", "<cmd>vsplit<cr>", desc = "Вертикальный сплит" },
      { "\\", "<cmd>split<cr>", desc = "Горизонтальный сплит" },

      -- Find / search
      { "<leader>no", "<cmd>noh<cr>", desc = "Сбросить подсветку поиска" },

      -- NeoTree
      { "<leader>1", "<cmd>Neotree left reveal toggle<cr>", desc = "Neotree слева" },
      { "<leader>2", "<cmd>Neotree close<cr>", desc = "Закрыть Neotree" },

      -- BufferLine / Tabs
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Следующий буфер" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Предыдущий буфер" },
      { "<leader>x", "<cmd>BufferLinePickClose<cr>", desc = "Закрыть выбранный буфер" },
      { "<leader><S-x>", "<cmd>BufferLineCloseOthers<cr>", desc = "Закрыть остальные буферы" },

      -- Spring Boot (глобальные)
      { "<leader>sr", "<cmd>!mvn spring-boot:run<cr>", desc = "Spring Boot: запуск" },
      { "<leader>sb", "<cmd>!mvn clean package<cr>", desc = "Spring Boot: билд" },
      { "<leader>st", "<cmd>!mvn test<cr>", desc = "Spring Boot: тесты" },
      { "<leader>sd", "<cmd>!mvn clean package dockerfile:build<cr>", desc = "Spring Boot: Docker образ" },

      -- Telescope
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
      { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },

      -- Trouble
      { "<leader>qq", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>qQ", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP (Trouble)" },
      { "<leader>qL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>qF", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },

      -- LSP
      { "gd", function() vim.lsp.buf.definition() end, desc = "LSP: перейти к определению" },
      { "K", function() vim.lsp.buf.hover() end, desc = "LSP: подсказка по символу" },
      { "gi", function() vim.lsp.buf.implementation() end, desc = "LSP: реализации" },
      { "gr", function() vim.lsp.buf.references() end, desc = "LSP: ссылки" },
      { "<leader>rn", function() vim.lsp.buf.rename() end, desc = "LSP: переименовать" },
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "LSP: code action" },
      { "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, desc = "LSP: форматирование" },

      -- ToggleTerm (terminal mode)
      { "<Esc>", [[<C-\><C-n>]], mode = "t", desc = "Выйти из терминала (Esc)" },
      { "jj", [[<C-\><C-n>]], mode = "t", desc = "Выйти из терминала (jj)" },
      { "<C-h>", [[<Cmd>wincmd h<CR>]], mode = "t", desc = "Терминал: окно слева" },
      { "<C-j>", [[<Cmd>wincmd j<CR>]], mode = "t", desc = "Терминал: окно снизу" },
      { "<C-k>", [[<Cmd>wincmd k<CR>]], mode = "t", desc = "Терминал: окно сверху" },
      { "<C-l>", [[<Cmd>wincmd l<CR>]], mode = "t", desc = "Терминал: окно справа" },
      { "<C-w>", [[<C-\><C-n><C-w>]], mode = "t", desc = "Терминал: управление окнами" },
    })

    -- Java/Spring Boot buffer-local описания
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function(event)
        wk.add({
          { "<leader>sr", "<cmd>!mvn spring-boot:run<cr>", desc = "Spring Boot: запуск", buffer = event.buf },
          { "<leader>cf", function() vim.lsp.buf.format() end, desc = "Spring: форматирование", buffer = event.buf },
          { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Spring: code action", buffer = event.buf },
        })
      end,
    })
  end,
}
