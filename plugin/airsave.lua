-- airsave.nvim plugin initialization

-- Commands
vim.api.nvim_create_user_command('AirSaveStart', function()
  require('airsave').start()
  print('Auto save started')
end, { desc = 'Start auto save' })

vim.api.nvim_create_user_command('AirSaveStop', function()
  require('airsave').stop()
  print('Auto save stopped')
end, { desc = 'Stop auto save' })

vim.api.nvim_create_user_command('AirSaveToggle', function()
  local airsave = require('airsave')
  if airsave.is_running() then
    airsave.stop()
    print('Auto save stopped')
  else
    airsave.start()
    print('Auto save started')
  end
end, { desc = 'Toggle auto save' })

-- Key mappings (using <Plug> mappings for customization)
vim.keymap.set('n', '<Plug>(AirSaveStart)', '<cmd>AirSaveStart<cr>', { desc = 'Start auto save' })
vim.keymap.set('n', '<Plug>(AirSaveStop)', '<cmd>AirSaveStop<cr>', { desc = 'Stop auto save' })
vim.keymap.set('n', '<Plug>(AirSaveToggle)', '<cmd>AirSaveToggle<cr>', { desc = 'Toggle auto save' })