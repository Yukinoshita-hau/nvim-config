local jdtls = require('jdtls')

local mason_path = vim.fn.stdpath("data") .. "/mason"
local lombok_path = mason_path .. "/packages/jdtls/lombok.jar"

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-javaagent:' .. lombok_path,
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', vim.fn.glob(mason_path .. "/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    '-configuration', mason_path .. "/packages/jdtls/config_win",
    '-data', vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  },

  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml' }),

  init_options = {
    bundles = {},
    extendedClientCapabilities = {
      progressOnInitializationCreate = true,
    },
  },

  settings = {
    java = {
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      references = { includeDecompiledSources = true },

      format = {
        enabled = true,
        settings = {
          url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },

      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "C:\\Users\\Пользователь\\.jdks\\semeru-17.0.9",
            default = true,
          },
        }
      }
    }
  },

  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

jdtls.start_or_attach(config)
