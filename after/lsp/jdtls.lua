local handlers = require 'vim.lsp.handlers'

local env = {
    HOME = vim.uv.os_homedir(),
    XDG_CACHE_HOME = os.getenv 'XDG_CACHE_HOME',
    JDTLS_JVM_ARGS = os.getenv 'JDTLS_JVM_ARGS',
}

local function get_cache_dir()
    return env.XDG_CACHE_HOME and env.XDG_CACHE_HOME or env.HOME .. '/.cache'
end

local function get_jdtls_cache_dir()
    return get_cache_dir() .. '/jdtls'
end

local function get_jdtls_config_dir()
    return get_jdtls_cache_dir() .. '/config'
end

local function get_jdtls_workspace_dir()
    return get_jdtls_cache_dir() .. '/workspace'
end

local function get_jdtls_jvm_args()
    local args = {}
    for a in string.gmatch((env.JDTLS_JVM_ARGS or ''), '%S+') do
        local arg = string.format('--jvm-arg=%s', a)
        table.insert(args, arg)
    end
    return unpack(args)
end

local function fix_zero_version(workspace_edit)
    if workspace_edit and workspace_edit.documentChanges then
        for _, change in pairs(workspace_edit.documentChanges) do
            local text_document = change.textDocument
            if text_document and text_document.version and text_document.version == 0 then
                text_document.version = nil
            end
        end
    end
    return workspace_edit
end

local function on_textdocument_codeaction(err, actions, ctx)
    for _, action in ipairs(actions) do
        -- TODO: (steelsojka) Handle more than one edit?
        if action.command == 'java.apply.workspaceEdit' then                                                 -- 'action' is Command in java format
            action.edit = fix_zero_version(action.edit or action.arguments[1])
        elseif type(action.command) == 'table' and action.command.command == 'java.apply.workspaceEdit' then -- 'action' is CodeAction in java format
            action.edit = fix_zero_version(action.edit or action.command.arguments[1])
        end
    end

    handlers[ctx.method](err, actions, ctx)
end

local function on_textdocument_rename(err, workspace_edit, ctx)
    handlers[ctx.method](err, fix_zero_version(workspace_edit), ctx)
end

local function on_workspace_applyedit(err, workspace_edit, ctx)
    handlers[ctx.method](err, fix_zero_version(workspace_edit), ctx)
end

-- Non-standard notification that can be used to display progress
local function on_language_status(_, result)
    local command = vim.api.nvim_command
    command 'echohl ModeMsg'
    command(string.format('echo "%s"', result.message))
    command 'echohl None'
end

local data = vim.fn.stdpath("data")
local workspace_path = data .. "/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name
local os_config = "linux"
if vim.fn.has "mac" == 1 then
    os_config = "mac"
elseif vim.fn.has "win32" == 1 then
    os_config = "win"
end

return {
    filetypes = { "java" },
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
    single_file_support = true,
    settings = {
        java = {
            format = { enable = true },
            inlayHint = { enable = true },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
            project = {
                referencedLibraries = {
                    "**/libs/**/*.jar",
                    "**/lib/**/*.jar",
                    "**/build/libs/**/*.jar",
                    "**/target/**/*.jar",
                    "*.jar",
                }
            }
        }
    },
    root_markers = { 'gradlew', 'mvnw', "pom.xml", ".classpath" },
    init_options = {
        workspace = get_jdtls_workspace_dir(),
        jvm_args = {},
        os_config = nil,
    },
    handlers = {
        -- Due to an invalid protocol implementation in the jdtls we have to conform these to be spec compliant.
        -- https://github.com/eclipse/eclipse.jdt.ls/issues/376
        ['textDocument/codeAction'] = on_textdocument_codeaction,
        ['textDocument/rename'] = on_textdocument_rename,
        ['workspace/applyEdit'] = on_workspace_applyedit,
        ['language/status'] = vim.schedule_wrap(on_language_status),
    },
}
