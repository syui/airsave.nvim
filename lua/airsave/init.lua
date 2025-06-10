-- airsave.nvim - Auto save plugin for Neovim
-- Converted from airsave.vim to Lua

local M = {}

-- Default configuration
M.config = {
  auto_write = false,
  no_silent = false,
  events = { 'TextChanged', 'CursorHold', 'InsertLeave' },
}

local augroup_id = nil

-- Start auto save
function M.start()
  if augroup_id then
    M.stop()
  end
  
  augroup_id = vim.api.nvim_create_augroup('AirSaveNvim', { clear = true })
  
  local events = M.config.events
  
  vim.api.nvim_create_autocmd(events, {
    group = augroup_id,
    pattern = '*',
    callback = function()
      -- Only save if buffer is modified, not special buffer type, and has a filename
      if vim.bo.modified and vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
        if M.config.no_silent then
          vim.cmd('update')
        else
          vim.cmd('silent! update')
        end
      end
    end,
  })
end

-- Stop auto save
function M.stop()
  if augroup_id then
    vim.api.nvim_del_augroup_by_id(augroup_id)
    augroup_id = nil
  end
end

-- Check if auto save is running
function M.is_running()
  return augroup_id ~= nil
end

-- Setup function for configuration
function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.config, opts or {})
  
  if M.config.auto_write then
    M.start()
  end
end

return M