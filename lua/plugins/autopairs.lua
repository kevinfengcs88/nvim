return {
    {
        'windwp/nvim-autopairs',
        event = { 'InsertEnter' },
        config = function()
            local npairs_status_ok, npairs = pcall(require, 'nvim-autopairs')
            local rule_status_ok, rule = pcall(require, 'nvim-autopairs.rule')
            local cond_status_ok, cond = pcall(require, 'nvim-autopairs.conds')

            if not npairs_status_ok then
                return
            end

            if not rule_status_ok then
                return
            end

            if not cond_status_ok then
                return
            end

            npairs.setup({
                check_ts = true,
                fast_wrap = {
                    map = '<M-q>',
                    chars = { '{', '[', '(', '"', "'" },
                    pattern = [=[[%'%"%>%]%)%}%,]]=],
                    end_key = '$',
                    keys = 'qwertyuiopzxcvbnmasdfghjkl',
                    check_comma = true,
                    manual_position = false,
                    highlight = 'PmenuSel',
                    highlight_grey='LineNr'
                },
            })

            npairs.add_rules({
                rule("'", "'", 'python'):with_pair(cond.before_text('f')),
                rule("{", "}", 'python'):with_pair(cond.is_inside_quote()),
            })
        end
    },
    {
        'windwp/nvim-ts-autotag',
        event = { 'InsertEnter' },

        config = function()
            local autotag_status_ok, autotag = pcall(require, 'nvim-ts-autotag')

            if not autotag_status_ok then
                return
            end

            autotag.setup({})
        end
    }
}
