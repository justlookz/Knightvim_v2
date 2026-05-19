if vim.g.neovide then
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0.01
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_scroll_animation_far_lines = 0
    vim.g.neovide_scroll_animation_length = 0.00

    vim.opt.guifont = "GoMono Nerd Font Propo,Cascadia Mono:h10"

    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_corner_radius = 0.5

    vim.g.neovide_opacity = 0.9
    vim.g.neovide_normal_opacity = 0.9

    vim.g.neovide_cursor_antialiasing = false

    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
end
