--https://ejmastnak.com/tutorials/vim-latex/luasnip/
--is a great guide for this kind of stuff

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
 

return{

s(
  {-- Snippet parameters called "context"
    trig="mb",
    dscr="Mathbb environment for common sets",
    snippetType="autosnippet"
  },
  {
    t("\\mathbb{"),
    i(1),
    t("}"),
    i(2),
  }
),

s(
  {
    trig="ita",
    dscr="Italic text environment",
    snippetType="autosnippet",
  },
  {t("\\textit{"),i(1),t("}"),i(2),}
),

s(
  {trig="itize",dscr="Itemize enviromnent",snippetType="autosnippet"},
  { t({"\\begin{itemize}", "\\item["}),
    i(1),
    t("]{"),
    i(2),
    t({"}","\\end{itemize}"}),
    }
  ),

s(
  {
    trig="m",
    dscr="Inline math environment",
  },
  {
    t("$"),
    i(1),
    t("$"),
    i(2),
  }
),

s(
  {
    trig="M",
    dscr="Unmarked equation",
  },
  {
    t("\\["),
    i(1),
    t("\\]"),
    i(2),
  }
),
s(
  {
    trig="nlem",
    dscr="New lemma",
    snippetType="autosnippet",
  },
  {
    t("\\lemma{"),
    i(1),
    t("}"),
    i(2),
  }
),
s(
  {
    trig="nsat",
    dscr="New satz",
    snippetType="autosnippet",
  },
  {
    t("\\satz{"),
    i(1),
    t("}"),
    i(2),
  }
),

s(
  {
    trig="nbew",
    dscr="New Beweis",
    snippetType="autosnippet",
  },
  {
    t("\\beweis"),
  }
),
s(
  {
    trig="ff",
    dscr="fraction",
    snippetType="autosnippet",
  },
  {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
    i(3),
  }
),
s(
  {
    trig="pmat",
    dscr="New parantheses matrix",
    snippetType="autosnippet",
  },
  {
    t("\\begin{pmatrix}"),
    i(1),
    t("\\end{pmatrix}"),
    i(2),
  }
),

s(
  {
    trig="rar",
    dscr="\\rightarrow",
    snippetType="autosnippet",
  },
  {
    t("\\rightarrow"),
  }
),

s(
  {
    trig="Rar",
    dscr="\\Rightarrow",
    snippetType="autosnippet",
  },
  {
    t("\\Rightarrow"),
  }
),
s(
  {
    trig="bf",
    dscr="\\textbf{}",
    snippetType="autosnippet",
  },
  {
    t("\\textbf{"),
    i(1),
    t("}"),
    i(2),
  }
),
s(
  {
    trig="veps",
    dscr="\\varepsilon",
    snippetType="autosnippet",
  },
  {
    t("\\varepsilon"),
  }
),
s(
  {
    trig="d",
    dscr="\\delta",
    snippetType="snippet",
  },
  {
    t("\\delta"),
  }
),
s(
  {
    trig="int",
    dscr="Integral snippet",
    snippetType="snippet",
  },
  {
    t("\\int^{"),
    i(1),
    t("}_{"),
    i(2),
    t("}"),
    i(3),
    t("\\text{d}"),
    i(4),
  }
),
s(
  {
    trig="mcol",
    dscr="Multicols environment",
    snippetType="autosnippet",
  },
  {
    t("\\begin{multicols}{"),
    i(1),
    t({"}", ""}),
    i(2),
    t("\\end{multicols}"),
    i(3),
  }
),
s(
  {
    trig="txt",
    dscr="\\text{}",
    snippetType="autosnippet",
  },
  {
    t("\\text{"),
    i(1),
    t("}"),
    i(2),
  }
),
} 
