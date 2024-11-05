return {
	"epwalsh/obsidian.nvim",
  version = "*",
	lazy = false, -- Default is true but that sucks ass
  -- ft = "markdown",
	-- event = {
	-- 	"BufReadPre " .. vim.fn.expand("~") .. "/Documents/brunobsidian/**.md",
	-- 	"BufNewFile " .. vim.fn.expand("~") .. "/Documents/brunobsidian/**.md",
	-- 	-- "BufReadPre " .. vim.fn.expand("~") .. "/Documents/bruno/**.md",
	-- 	-- "BufNewFile " .. vim.fn.expand("~") .. "/Documents/bruno/**.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
	},
  config = function ()
    vim.opt.conceallevel = 2

    require("obsidian").setup({
      -- github.com/epwalsh/obsidian.nvim/pull/406
      wiki_link_func = function(opts)
        if opts.label ~= opts.path then
          return string.format( "[[%s|%s]]", opts.path, opts.label )
        else
          return string.format( "[[%s]]", opts.path )
        end
      end,
      workspaces = {
        {
          name = "main",
          path = vim.fn.expand("~") .. "/Documents/bruno",
        },
        {
          name = "dev",
          path = vim.fn.expand("~") .. "/Documents/brunobsidian",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
        -- Deprecated
        -- new_notes_location = "current_dir",
        -- prepend_note_path = true,
      },
      mappings = {
        ["gf"] = {
          action = function ()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>ch"] = {
          action = function ()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
      new_notes_location = "current_dir",
      -- notes_subdir = "notes",
      log_level = vim.log.levels.INFO,
      daily_notes = {
        folder = "/dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
      },
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {
          from_buffer = function()
            -- This is surely wrong, no?
            -- b/c this function will only be called while the template is being inserted into the current buffer?
            -- which defeats the purpose?
            return vim.api.nvim_buf_get_name(0)
          end,
        },
      },
      -- Deprecated
      -- backlinks = {
      --   height = 10,
      --   wrap = true,
      -- },

      use_advanced_uri = true, -- Set to false if not using corresponding Obsidian plugin
      open_app_foreground = false,

      sort_by = "modified", -- "[modified|path|accessed|created]"
      sort_reversed = true,

      open_notes_in = "hsplit", -- "[current|vsplit|hsplit]"

      ui = {
        enable = true,
        update_debounce = 200,
      },

      attachments = {
        img_folder = "attach",
        img_text_func = function(client, path)
          local link_path
          local vault_relative_path = client:vault_relative_path(path)
          if vault_relative_path ~= nil then
            link_path = vault_relative_path
          else
            link_path = tostring(path)
          end
          local display_name = vim.fs.basename(link_path)
          return string.format("![%s](%s)", display_name, link_path)
        end,
      },

      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          -- if title is given, transform it into a valid file name
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            -- If title is nil, generate 4 random A-Z chars and append to suffix
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      note_frontmatter_func = function(note)
        local out = {
          id = note.id,
          alias = note.alias,
          tags = note.tags,
          lastmod = note.lastmod,
          priority = note.priority
        }
        if note.metadata ~= nil and not vim.tbl_isempty( note.metadata ) then
          for k, v in pairs( note.metadata ) do
            out[k] = v
          end
        end
        return out
      end,

      follow_url_func = function(url)
        vim.fn.jobstart({ "xdg-open", url })
      end,
    })
    -- Additional mappings using whichkey
    local wk = require("which-key")

    -- TODO: add 'brain dump' mapping to create a new obsidian note (in a float window, maybe) to capture quick thoughts
    -- TODO: configure daily notes as a table of contents for all notes created that day
    wk.add({
      { "<leader>o", group = "Obsidian.nvim" },
      { "<leader>oa", "<cmd>ObsidianOpen<CR>", desc = "Open current note in the Obsidian [a]pp" },
      { "<leader>oc", group = "Modify `vim.opt.conceallevel`" },
      { "<leader>ocj", "<cmd>lua vim.opt.conceallevel = 0<CR>", desc = "Set `vim.opt.conceallevel = 0`" },
      { "<leader>ock", "<cmd>lua vim.opt.conceallevel = 1<CR>", desc = "Set `vim.opt.conceallevel = 1`" },
      { "<leader>ocl", "<cmd>lua vim.opt.conceallevel = 2<CR>", desc = "Set `vim.opt.conceallevel = 2` [Default]" },
      { "<leader>of", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Obsidian Link" },
      { "<leader>og", "<cmd>ObsidianFollowLink vsplit<CR>", desc = "Follow Obsidian Link (vsplit)" },
      { "<leader>oi", function() -- Custom Quick Note from Template
          -- Get info about current buffer before doing Obsidian actions
          local buf_path = vim.api.nvim_buf_get_name(0)

          -- Prompt user for note name
          local filename_prompt = vim.fn.input("Enter note name: ")

          -- Open Obsidian Workspace picker
          vim.cmd( { cmd = "ObsidianWorkspace" } )

          -- Create new note with name
          vim.cmd( { cmd = "ObsidianNew", args = { filename_prompt } } )

          -- Insert `quickie.md` template
          vim.cmd( { cmd = "ObsidianTemplate", args = { "quickie.md" } } )
        end, desc = "Custom quick note from template"
      },
      { "<leader>ol", group = "Make [l]ink" },
      { "<leader>olb", "<cmd>ObsidianBacklinks<CR>", desc = "List [B]acklinks to current note/buffer" },
      { "<leader>oll", "<cmd>ObsidianLink<CR>", desc = "[L]ink inline selection to existing note" },
      { "<leader>oln", "<cmd>ObsidianLinkNew<CR>", desc = "[N]ew note linked to inline selection" },
      { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Open Obsidian New" },
      { "<leader>oo", "<cmd>ObsidianToday<CR>", desc = "Open Obsidian Today" },
      { "<leader>op", "<cmd>ObsidianPasteImg<CR>", desc = "[P]aste image from clipboard to current note" },
      { "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Open Obsidian Quick Switch" },
      { "<leader>ot", "<cmd>ObsidianTemplate<CR>", desc = "Insert Obsidian [T]emplate" },
      { "<leader>ov", "<cmd>ObsidianFollowLink hsplit<CR>", desc = "Follow Obsidian Link (hsplit)" },
      { "<leader>ow", "<cmd>ObsidianWorkspace<CR>", desc = "Open Obsidian [W]orkspace picker" },
    })

  end
}
