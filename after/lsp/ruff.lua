return {
    cmd = { 'ruff', '-s', 'server' },
    filetypes = { 'python' },
    root_markers = { ""},
    settings = {
        lineLength = 78,
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        logFile = "/dev/null",
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    }
}
