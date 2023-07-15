return {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' } },
    keys = {
        { '<leader>ps', function() require('persistence').load() end, desc = 'Restore Session' },
        { '<leader>pl', function() require('persistence').load({ last = true }) end, desc = 'Restore Last Session' },
        { '<leader>pd', function() require('persistence').stop() end, desc = "Don't Save Current Session" },
    },
}
