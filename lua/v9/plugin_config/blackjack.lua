local status_ok, blackjack = pcall(require, 'blackjack')
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }

blackjack.setup({
    card_style = 'mini', -- Can be 'mini' or 'large'.
    suit_style = 'black', -- Can be 'black' or 'white'.
    scores_path = '/home/foo/blackjack_scores.json', -- Default location to store the scores.json file.
})

vim.keymap.set('n', '<leader>bj', ':BlackJackNewGame<CR>', opts)
