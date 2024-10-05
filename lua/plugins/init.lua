return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- LSP Management
      -- https://github.com/williamboman/mason.nvim
      { "williamboman/mason.nvim" },
      -- https://github.com/williamboman/mason-lspconfig.nvim
      { "williamboman/mason-lspconfig.nvim" },

      -- Auto-Install LSPs, linters, formatters, debuggers
      -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },

      -- Useful status updates for LSP
      -- https://github.com/j-hui/fidget.nvim
      { "j-hui/fidget.nvim", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      -- https://github.com/folke/neodev.nvim
      { "folke/neodev.nvim" },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "onsails/lspkind-nvim"
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		highlight = {
        enable = true,
      },
      indent = { enable = true },
      auto_install = true, -- automatically install syntax support when entering new file type buffer
      ensure_installed = {
        "python",
        "java",
        "cpp",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    config = function(_, opts)
      local configs = require("nvim-treesitter.configs")
      require("nvim-treesitter.install").compilers = { "clang" }
      configs.setup(opts)
    end,  
  },
  {
    -- https://github.com/mfussenegger/nvim-lint
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      -- Define a table of linters for each filetype (not extension).
      -- Additional linters can be found here: https://github.com/mfussenegger/nvim-lint#available-linters
      require("lint").linters_by_ft = {
        python = {
          -- Uncomment whichever linters you prefer
          "flake8",
          --"mypy",
          --"pylint",
        },
      }

      -- Automatically run linters after saving.  Use "InsertLeave" for more aggressive linting.
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        -- Only run linter for the following extensions. Remove this to always run.
        pattern = { "*.py" },
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    ft = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      modes = { "n", "i", "no", "c" },
      hybrid_modes = { "i" },
      filetypes = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
      buf_ignore = {},
      max_length = 99999,
      restore_conceallevel = true,
      restore_concealcursor = false,
      headings = {},
      code_blocks = {
        enable = true,

        style = "language",
        hl = "dark",

        position = "overlay",

        min_width = 60,
        pad_amount = 3,

        language_names = {
          { "py", "python" },
          { "cpp", "C++" },
        },
        language_direction = "right",

        sign = true,
        sign_hl = nil,
      },
      inline_code = {},

      block_quote = {
        enable = true,
        default = {},
        callouts = {},
      },

      horizontal_rule = {},

      hyperlink = {},
      image = {},

      table = {

        table_hls = { "rainbow1" },
        use_virt_lines = false,
      },
      list_item = {
        marker_plus = {
          add_padding = false,
          marker = "•",
          marker_hl = "rainbow2",
        },
        marker_minus = {
          add_padding = false,
          marker = "•",
          marker_hl = "rainbow2",
        },
        marker_star = {
          add_padding = false,

          marker = "•",
          marker_hl = "rainbow2",
        },
      },
      checkbox = {},
      -- This is nice to have
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2
          vim.wo[win].concealcursor = "nc"
        end,
      },
      html = {
        enable = true,

        tags = {},
        entities = {},
      },
    }
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Facultad",
          path = "C:\\Users\\jmrod\\Documentos\\Mis_Docs\\EstudioProductividad\\Obsidian",
        },
      },
      notes_subdir = "Inbox",
      new_notes_location = "notes_subdir",
      attachments = {
        img_folder = "Images",
      },
      templates = {
        subdir = "Templates",
        date_format = "%d-%m-%Y",
        time_format = "%H:%M:",
        tags = "",
      },

      mappings = {
        -- "Obsidian follow"
        ["<leader>of"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes "obsidian done"
        ["<leader>od"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- Create a new newsletter issue
        ["<leader>onn"] = {
          action = function()
            return require("obsidian").commands.new_note("Newsletter-Issue")
          end,
          opts = { buffer = true },
        },
        ["<leader>ont"] = {
          action = function()
            return require("obsidian").util.insert_template("Newsletter-Issue")
          end,
          opts = { buffer = true },
        },
      },
      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      ui = {
        -- Disable some things below here because I set these manually for all Markdown files using treesitter
        checkboxes = {},
        bullets = {},
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "openai",
      openai = {
        temperature = 0,
        model = "gpt-4o",
      } 
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
  }

}
