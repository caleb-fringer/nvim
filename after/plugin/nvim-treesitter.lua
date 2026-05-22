local parsers = {
    'awk',
    'bash',
    'bibtex',
    'c',
    'clojure',
    'cmake',
    'css',
    'csv',
    'dockerfile',
    'elixir',
    'erlang',
    'gitignore',
    'go',
    'gomod',
    'gosum',
    'haskell',
    'heex',
    'html',
    'http',
    'java',
    'javadoc',
    'javascript',
    'jq',
    'json',
    'jsx',
    'latex',
    'lua',
    'make',
    'markdown',
    'proto',
    'python',
    'ruby',
    'rust',
    'scheme',
    'sql',
    'ssh_config',
    'supercollider',
    'svelte',
    'tsx',
    'typescript',
    'vue',
    'xml',
    'yaml',
    'zsh'
}

require('nvim-treesitter').install(parsers)

for _, lang in ipairs(parsers) do
    vim.api.nvim_create_autocmd('FileType', {
        pattern = { lang },
        callback = function(event)
            vim.treesitter.start(event.buf, lang)
        end,
    })
end
