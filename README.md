# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins.

## work in progress...

- retroactive: removed messages from noice again (errors are just too annoying)
- prevent comments from automatically generating on newline (lua?)
- figure out if there is a way to have flash search and regular vim search both available
- fix this
```

Error executing vim.schedule lua callback: /usr/local/share/nvim/runtime/lua/vim/treesitter/query.lua:259: query: invalid structure at position 3272 for language lua
stack traceback:
        [C]: in function '_ts_parse_query'
        /usr/local/share/nvim/runtime/lua/vim/treesitter/query.lua:259: in function 'get'
        ...l/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:114: in function 'new'
        /usr/local/share/nvim/runtime/lua/vim/treesitter.lua:61: in function '_create_parser'
        /usr/local/share/nvim/runtime/lua/vim/treesitter.lua:131: in function 'get_parser'
        /usr/local/share/nvim/runtime/lua/vim/treesitter.lua:460: in function 'ts_highlighter'
        ...m/lazy/telescope.nvim/lua/telescope/previewers/utils.lua:152: in function 'highlighter'
        ...scope.nvim/lua/telescope/previewers/buffer_previewer.lua:234: in function ''
        vim/_editor.lua: in function <vim/_editor.lua:0>


```

## Uninstalling

I build Neovim from source. To uninstall just run:

```
rm -f $(which nvim)
```
