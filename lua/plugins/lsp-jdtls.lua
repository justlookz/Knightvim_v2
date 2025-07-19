return {
    "mfussenegger/nvim-jdtls",
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    ft = "java",
    config = function()
        local data = vim.fn.stdpath("data")
        local workspace_path = data .. "/jdtls-workspace/"
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = workspace_path .. project_name
        local os_config = "linux"
        if vim.fn.has "mac" == 1 then
            os_config = "mac"
        end

        local config = {
            cmd = {
                "java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ALL",
                "-Xms1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens",
                "java.base/java.util=ALL-UNNAMED",
                "--add-opens",
                "java.base/java.lang=ALL-UNNAMED",
                "-javaagent:" .. data .. "/mason/packages/jdtls/lombok.jar",
                "-jar",
                vim.fn.glob(data .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
                "-configuration",
                data .. "/mason/packages/jdtls/config_" .. os_config,
                "-data",
                workspace_dir,
            },
            settings = {
                java = {
                    project = {
                        referencedLibraries = {
                            "**/libs/**/*.jar",
                            "**/lib/**/*.jar",
                            "**/build/libs/**/*.jar",
                            "**/target/**/*.jar",
                        }
                    }
                }
            },
            root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', 'mvnw', "pom.xml", ".classpath" },
                { upward = true })[1]),
        }
        require('jdtls').start_or_attach(config)
    end,
}
