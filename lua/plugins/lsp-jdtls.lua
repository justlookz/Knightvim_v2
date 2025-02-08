return {
    "mfussenegger/nvim-jdtls",
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    ft = "java",
    config = function()
        local config = {
            cmd = { vim.fn.stdpath("data") .. '/mason/bin/jdtls' },
	settings = {
	    java = {
		project = {
		    referencedLibraries = { "lib/**/*.jar" } }
	    }
	},
            root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', "pom.xml", ".classpath" }, { upward = true })[1]),
        }
        require('jdtls').start_or_attach(config)
    end,
}
