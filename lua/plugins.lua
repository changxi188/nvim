-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    paccker_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
        install_path,
    })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end

packer.startup({
    function(use)
        -- Packer 可以升级自己
        use("wbthomason/packer.nvim")
        -- theme
        use("Mofiqul/vscode.nvim")
        -------------------------- plugins -------------------------------------------
        -- nvim-tree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -- bufferline
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
        -- lualine
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        -- telescope
        use({ 'nvim-telescope/telescope.nvim', tag = "0.1.4",requires = { "nvim-lua/plenary.nvim" } })
        -- telescope extensions
        use("LinArcX/telescope-env.nvim")
        -- Comment
        use("numToStr/Comment.nvim")
        -- treesitter
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        -- indent-blankline
        use("lukas-reineke/indent-blankline.nvim")
        -- auto completion
        use("hrsh7th/nvim-cmp")
        use("hrsh7th/vim-vsnip") -- Snippet 引擎
        use("hrsh7th/cmp-vsnip") -- 补全源
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
        use("rafamadriz/friendly-snippets") -- 常见编程语言代码段
        -- code formattion
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        -- use("mhartington/formatter.nvim")

        -------------------------- mason -------------------------------------------
        use {"williamboman/mason.nvim", run = ":MasonUpdate"} -- :MasonUpdate updates registry contents
        -- lsp 
        use {"williamboman/mason-lspconfig.nvim"}
        use {"neovim/nvim-lspconfig"}

        -------------------------- debug -------------------------------------------
        -- vimspector
        use("puremourning/vimspector")

        -- dashboard-nvim
        -- use {'glepnir/dashboard-nvim', requires = {"kyazdani42/nvim-web-devicons"}}

        -- project manager
        -- use("ahmedkhalf/project.nvim")

        if paccker_bootstrap then
            packer.sync()
        end
    end,

})
