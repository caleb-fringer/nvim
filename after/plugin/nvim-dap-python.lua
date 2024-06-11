--[[ 
-- Set the path to Python to the venv installed by Mason
-- ~/.local/share/nvim/mason/packages/debugpy/venv/bin/python
-- Not sure if this is also picks up the local virtual enviroment of the
-- opened repository
--]]

local python_path = table.concat({ vim.fn.stdpath('data'),  'mason', 'packages', 'debugpy', 'venv', 'bin', 'python'}, '/'):gsub('//+', '/')
require('dap-python').setup(python_path)
