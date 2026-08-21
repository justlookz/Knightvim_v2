local set = vim.opt

set.shell = "powershell"
set.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
set.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
set.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
