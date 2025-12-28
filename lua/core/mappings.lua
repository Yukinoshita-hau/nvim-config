-- Leader
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- ========== ESCAPE ==========
keymap("i", "jj", "<Esc>", { desc = "Выйти из режима вставки" })

-- ========== BUFFERS ==========
keymap("n", "<leader>w", ":w<CR>", { desc = "Сохранить файл" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Выйти из текущего окна" })
keymap("n", "<leader>wq", ":wq<CR>", { desc = "Сохранить и выйти" })

-- ========== NAVIGATION ==========
keymap("n", "<c-k>", ":wincmd k<CR>", { desc = "Фокус на окно сверху" })
keymap("n", "<c-j>", ":wincmd j<CR>", { desc = "Фокус на окно снизу" })
keymap("n", "<c-h>", ":wincmd h<CR>", { desc = "Фокус на окно слева" })
keymap("n", "<c-l>", ":wincmd l<CR>", { desc = "Фокус на окно справа" })

-- ========== SPLITS ==========
keymap("n", "|", ":vsplit<CR>", { desc = "Вертикальный сплит" })
keymap("n", "\\", ":split<CR>", { desc = "Горизонтальный сплит" })

-- ========== FIND ==========
keymap("n", "<leader>no", ":noh<CR>", { desc = "Сбросить подсветку поиска" })

-- ========== NEOTREE ==========
keymap("n", "<leader>1", ":Neotree left reveal toggle<CR>", { desc = "Neotree слева" })
keymap("n", "<leader>2", ":Neotree close<CR>", { desc = "Закрыть Neotree" })

-- ========== TABS / BUFFERS ==========
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Следующий буфер" })
keymap("n", "<s-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Предыдущий буфер" })
keymap("n", "<leader>x", ":BufferLinePickClose<CR>", { desc = "Закрыть выбранный буфер" })
keymap("n", "<leader><s-x>", ":BufferLineCloseOthers<CR>", { desc = "Закрыть остальные буферы" })

-- ========== SPRING BOOT ==========
keymap("n", "<leader>sr", ":!mvn spring-boot:run<CR>", { desc = "Spring Boot: запуск" })
keymap("n", "<leader>sb", ":!mvn clean package<CR>", { desc = "Spring Boot: билд" })
keymap("n", "<leader>st", ":!mvn test<CR>", { desc = "Spring Boot: тесты" })
keymap("n", "<leader>sd", ":!mvn clean package dockerfile:build<CR>", { desc = "Spring Boot: Docker образ" })

-- ========== GIT (FUGITIVE + FLOG) ==========
keymap("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
keymap("n", "<leader>ga", ":Git add %<CR>", { desc = "Git add current file" })
keymap("n", "<leader>gA", ":Git add .<CR>", { desc = "Git add all" })
keymap("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
keymap("n", "<leader>gp", ":Git push origin HEAD<CR>", { desc = "Git push origin HEAD" })
keymap("n", "<leader>gP", ":Git pull<CR>", { desc = "Git pull" })
keymap("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })
keymap("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
keymap("n", "<leader>gl", ":Flogsplit<CR>", { desc = "Flog (git log)" })
keymap("n", "<leader>gch", ":Git checkout ", { desc = "Git checkout" })
keymap("n", "<leader>grv", ":Git revert<CR>", { desc = "Git revert" })
keymap("n", "<leader>grs", ":Git reset --soft HEAD~1<CR>", { desc = "Git reset soft" })
keymap("n", "<leader>gz", ":Git stash<CR>", { desc = "Git stash" })
keymap("n", "<leader>gzp", ":Git stash pop<CR>", { desc = "Git stash pop" })
keymap("n", "<leader>go", ":GBrowse<CR>", { desc = "Open on GitHub" })
