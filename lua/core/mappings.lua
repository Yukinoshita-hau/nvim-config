-- Leader
vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<Esc>", { desc = "Выйти из режима вставки" })

-- Buffers
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Сохранить файл" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Выйти из текущего окна" })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Сохранить и выйти" })

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Фокус на окно сверху" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Фокус на окно снизу" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Фокус на окно слева" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Фокус на окно справа" })

-- Splits
vim.keymap.set("n", "|", ":vsplit<CR>", { desc = "Вертикальный сплит" })
vim.keymap.set("n", "\\", ":split<CR>", { desc = "Горизонтальный сплит" })

-- Find
vim.keymap.set("n", "<leader>no", ":noh<CR>", { desc = "Сбросить подсветку поиска" })

-- NeoTree
vim.keymap.set("n", "<leader>1", ":Neotree left reveal toggle<CR>", { desc = "Neotree слева" })
vim.keymap.set("n", "<leader>2", ":Neotree close<CR>", { desc = "Закрыть Neotree" })

-- Tabs
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Следующий буфер" })
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Предыдущий буфер" })
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>", { desc = "Закрыть выбранный буфер" })
vim.keymap.set("n", "<leader><s-x>", ":BufferLineCloseOthers<CR>", { desc = "Закрыть остальные буферы" })

-- Spring Boot команды

vim.keymap.set('n', '<leader>sr', ':!mvn spring-boot:run<CR>', { noremap = true, desc = 'Spring Boot: запуск' })
vim.keymap.set('n', '<leader>sb', ':!mvn clean package<CR>', { noremap = true, desc = 'Spring Boot: билд' })                -- Билд
vim.keymap.set('n', '<leader>st', ':!mvn test<CR>', { noremap = true, desc = 'Spring Boot: тесты' })                         -- Тесты
vim.keymap.set('n', '<leader>sd', ':!mvn clean package dockerfile:build<CR>', { noremap = true, desc = 'Spring Boot: Docker образ' })  -- Docker образ (если есть)
