local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node


ls.add_snippets("tex", {
    s("\\doc", {
        t("\\documentclass{"), c(1, { t("article"), t("report"), t("book") }), t("}"),
        t({ "", "\\usepackage[margin=1in]{geometry}", "" }),
        t({ "\\usepackage{amsmath}", "\\usepackage{amssymb}", "\\usepackage{parskip}", "" }),
        t({ "", "\\author{Caleb Fringer}", "" }),
        t("\\title{"), i(2, "Paper Title"), t({ "}", "", "" }),
        t({ "\\begin{document}", "\\maketitle", "", "" }),
        i(0),
        t({ "", "", "\\end{document}" }),
    }),
})
