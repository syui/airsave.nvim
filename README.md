# airsave.nvim

Auto save plugin for Neovim, converted from the original airsave.vim to modern Lua.

## Features

- Auto save on `TextChanged`, `CursorHold`, and `InsertLeave` events
- Configurable events and options
- Silent or verbose saving modes
- Easy toggle commands
- Modern Lua implementation for Neovim

## Installation

### Using vim-plug

```vim
Plug 'your-username/airsave.nvim'
```

### Using packer.nvim

```lua
use 'your-username/airsave.nvim'
```

### Using lazy.nvim

```lua
{
  'your-username/airsave.nvim',
  config = function()
    require('airsave').setup({
      auto_write = true,  -- Enable auto save on startup
    })
  end
}
```

## Configuration

```lua
require('airsave').setup({
  auto_write = false,  -- Enable auto save on startup (default: false)
  no_silent = false,   -- Show save messages (default: false)
  events = { 'TextChanged', 'CursorHold', 'InsertLeave' },  -- Auto save events
})
```

## Commands

- `:AirSaveStart` - Start auto save
- `:AirSaveStop` - Stop auto save  
- `:AirSaveToggle` - Toggle auto save

## Key Mappings

The plugin provides `<Plug>` mappings for customization:

- `<Plug>(AirSaveStart)` - Start auto save
- `<Plug>(AirSaveStop)` - Stop auto save
- `<Plug>(AirSaveToggle)` - Toggle auto save

Example custom mappings:

```lua
vim.keymap.set('n', '<leader>as', '<Plug>(AirSaveStart)')
vim.keymap.set('n', '<leader>aS', '<Plug>(AirSaveStop)')
vim.keymap.set('n', '<leader>at', '<Plug>(AirSaveToggle)')
```

## Usage

### Basic Usage

```lua
-- Start auto save
require('airsave').start()

-- Stop auto save
require('airsave').stop()

-- Check if running
if require('airsave').is_running() then
  print('Auto save is active')
end
```

### With Configuration

```lua
require('airsave').setup({
  auto_write = true,    -- Start automatically
  no_silent = false,    -- Silent saves
  events = { 'TextChanged', 'InsertLeave' },  -- Custom events
})
```

## Credits

Based on the original [airsave.vim](https://github.com/syui/airsave.vim)

## License

MIT License
