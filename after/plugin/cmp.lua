local luasnip = require("luasnip")
local cmp = require("cmp")
-- Require the compare module to load the default sorting behaviors
local compare = require("cmp.config.compare")

cmp.setup({
    -- 1. Keep this to prevent the suggestion from auto-highlighting
    preselect = cmp.PreselectMode.None,

    -- 2. Add custom sorting to force the suggestion to Index 1
    sorting = {
        priority_weight = 2,
        comparators = {
            -- Custom comparator: checks if the LSP flagged an item as 'preselect'
            function(entry1, entry2)
                local preselect1 = entry1:get_completion_item().preselect or false
                local preselect2 = entry2:get_completion_item().preselect or false
                if preselect1 and not preselect2 then return true end
                if not preselect1 and preselect2 then return false end
                -- If neither or both are preselected, fall through to default sorting
                return nil
            end,
            -- Standard nvim-cmp default comparators
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.locality,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    if luasnip.expandable() then
                        luasnip.expand()
                    else
                        cmp.confirm({
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = false,
                        })
                    end
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                print('fuck')
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
})

cmp.setup.filetype({ 'lisp' }, {
    sources = {
        { name = 'nvlime' },
        { name = 'buffer' },
    }
})

cmp.setup.filetype('tex', {
    sources = {
        { name = 'vimtex' },
        { name = 'buffer' },
    }
})
