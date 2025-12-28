return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    math.randomseed(os.time())

    local palette = {
      dark_blue = "#0a1428",      
      medium_blue = "#1a2a4a",    
      light_blue = "#4db8ff",     
      bright_blue = "#66d9ff",  
      edge_neon = "#00ffff",     
      steel_gray = "#4a5568",   
    }

    local quotes = {
      "🎸 \"Громче, быстрее, дальше!\"",
      "🎸 \"Код это музыка, коммиты это энкоры.\"",
      "⚡ \"Отладка в ритме металла.\"",
      "🔊 \"Turn it up to eleven!\"",
      "🎤 \"Каждый баг - это незавершённый соло.\"",
      "🎸 \"На сцене интернета, мы боги кода.\"",
      "⚡ \"Питон, Джава, Джаваскрипт - готовая гитарная партия.\"",
      "🔊 \"Компилируй громче, думай смелее.\"",
    }

    local function get_random_quote()
      return quotes[math.random(#quotes)]
    end

    local function get_time_display()
      local day = os.date("%A")
      local date = os.date("%d.%m.%Y")
      local time = os.date("%H:%M:%S")
      
      local days_ru = {
        Sunday = "Воскресенье",
        Monday = "Понедельник",
        Tuesday = "Вторник",
        Wednesday = "Среда",
        Thursday = "Четверг",
        Friday = "Пятница",
        Saturday = "Суббота",
      }
      
      day = days_ru[day] or day
      
      return string.format("🎙 %s  ⏰ %s  📅 %s", time, day, date)
    end

    local shortcuts = {
      {
        desc = "🎸  NEW TRACK · Начать новый файл",
        group = "DashboardShortcut",
        action = "ene | startinsert",
        key = "n",
      },
      {
        desc = "🎤  FIND RIFF · Найти файл в проекте",
        group = "DashboardShortcut",
        action = "Telescope find_files",
        key = "f",
      },
      {
        desc = "🔍  LIVE SEARCH · Поиск по коду (grep)",
        group = "DashboardShortcut",
        action = "Telescope live_grep",
        key = "g",
      },
      {
        desc = "📁  PROJECTS · Недавние проекты",
        group = "DashboardShortcut",
        action = "Telescope projects",
        key = "p",
      },
      {
        desc = "⚙️   TUNE UP · Синхронизация плагинов (Lazy)",
        group = "DashboardShortcut",
        action = "Lazy sync",
        key = "u",
      },
      {
        desc = "📝  RECENT · Последние файлы",
        group = "DashboardShortcut",
        action = "Telescope oldfiles",
        key = "r",
      },
    }

    vim.api.nvim_set_hl(0, "DashboardHeader", {
      fg = palette.bright_blue,
      bg = palette.dark_blue,
      bold = true,
    })
    vim.api.nvim_set_hl(0, "DashboardShortcut", {
      fg = palette.light_blue,
      bg = palette.medium_blue,
      bold = true,
    })
    vim.api.nvim_set_hl(0, "DashboardFooter", {
      fg = palette.edge_neon,
      bg = palette.dark_blue,
      italic = true,
    })
    vim.api.nvim_set_hl(0, "DashboardCenter", {
      fg = palette.light_blue,
    })
    vim.api.nvim_set_hl(0, "DashboardProjectTitle", {
      fg = palette.bright_blue,
      bold = true,
    })
    vim.api.nvim_set_hl(0, "DashboardMruTitle", {
      fg = palette.bright_blue,
      bold = true,
    })

    require("dashboard").setup({
      theme = "hyper",
      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },
      config = {
        header = header,
        week_header = {
          enable = true,
          concat = get_time_display(),
        },
        shortcut = shortcuts,
        mru = {
          limit = 8,
          label = "  🔥 ПОСЛЕДНИЕ ДЖЕМЫ (недавние файлы)",
          cwd_only = false,
        },
        project = {
          enable = true,
          limit = 7,
          icon = "🚀 ",
          label = "⚡ АКТИВНЫЕ ПРОЕКТЫ",
          action = "Telescope find_files cwd=",
        },
        footer = {
          "",
          "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
          get_time_display(),
          get_random_quote(),
          "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
        },
      },
    })

    vim.api.nvim_set_hl(0, "Normal", { bg = palette.dark_blue })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = palette.dark_blue })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

