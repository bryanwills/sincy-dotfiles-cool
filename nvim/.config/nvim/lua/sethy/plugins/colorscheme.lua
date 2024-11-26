return {
	-- NOTE: Rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				disable_background = true,
			-- 	disable_nc_background = false,
			-- 	disable_float_background = false,
				extend_background_behind_borders = false,
            	styles = {
            		bold = true,
            		italic = false,
            		transparency = true,
            	},
            	highlight_groups = {
            		ColorColumn = { bg = "#1C1C21" },
                    Normal = { bg = "none" }, -- Main background remains transparent
                    Pmenu = { bg = "#26233a", fg = "#e0def4" }, -- Completion menu background
                    PmenuSel = { bg = "#eb6f92", fg = "#1f1d2e" }, -- Highlighted completion item
                    PmenuSbar = { bg = "#191724" }, -- Scrollbar background
                    PmenuThumb = { bg = "#9ccfd8" }, -- Scrollbar thumb
            	},
            	enable = {
            		terminal = false,
            		legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
            		migrations = true, -- Handle deprecated options automatically
            	},
			})

			-- HACK: set this on the color you want to be persistent
			-- when quit and reopening nvim
			vim.cmd("colorscheme rose-pine")
		end,
	},
	-- NOTE: gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		-- priority = 1000 ,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					folds = false,
					operators = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})
		end,
	},
	-- NOTE : tokyonight
	{
		"folke/tokyonight.nvim",
		name = "folkeTokyonight",
		-- priority = 1000,
		config = function()
			local transparent = true
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,

				styles = {
                    comments = { italic = false },
					keywords = { italic = false },
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
				on_colors = function(colors)
					colors.bg = transparent and colors.none or bg
					colors.bg_dark = transparent and colors.none or bg_dark
					colors.bg_float = transparent and colors.none or bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = transparent and colors.none or bg_dark
					colors.bg_statusline = transparent and colors.none or bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})
             -- vim.cmd("colorscheme tokyonight")
             -- NOTE: Auto switch to tokyonight for markdown files only
             -- vim.api.nvim_create_autocmd("FileType", {
             --     pattern = { "markdown" },
             --     callback = function()
             --         -- Ensure the theme switch only happens once for a buffer
             --         local buffer = vim.api.nvim_get_current_buf()
             --         if not vim.b[buffer].tokyonight_applied then
             --             if vim.fn.expand("%:t") ~= "" and vim.api.nvim_buf_get_option(0, "buftype") ~= "nofile" then
             --                 vim.cmd("colorscheme tokyonight")
             --             end
             --             vim.b[buffer].tokyonight_applied = true
             --         end
             --     end,
             -- })
		end,
	},
}
