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

--This is a condition to make sure that autosnippets (and snippets) still are valid after an underscore, it solves annoying missing autocompletion on subscripts
local function after_sub_sup(line_to_cursor, matched_trigger)
  local preceding_char = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1))
  return preceding_char == "" or preceding_char:match("[%s%^_%b()]")
end
 

return{

s(
  {-- Snippet parameters called "context"
    trig="mb",
    dscr="Mathbb environment for common sets",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\mathbb{"),
    i(1),
    t("}"),
    }
),
s(
  {
    trig="mc",
    dscr="\\mathcal{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\mathcal{"),
    i(1),
    t("}"),
    }
),
s(
  {
    trig="ita",
    dscr="Italic text environment",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {t("\\textit{"),i(1),t("}"),i(2),}
),

s(
  {trig="itize",dscr="Itemize enviromnent",condition = after_sub_sup,
		snippetType="autosnippet", wordTrig=false},
  { t({"\\begin{itemize}", "\\item["}),
    i(1),
    t("]{"),
    i(2),
    t({"}","\\end{itemize}"}),
    }
  ),
s(
  {
    trig="item",
    dscr="\\item",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
      t("\\item["),
      i(1),
      t("]{"),
      i(2),
      t("}"),
  }
),
s(
  {
    trig="m",
    dscr="Inline math environment",
  },
  {
    t("\\("),
    i(1),
    t("\\)"),
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
    }
),
s(
  {
    trig="nlem",
    dscr="New lemma",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\begin{lemma}{"),
    i(1),
    t("}"),
    i(2),
    t("\\end{lemma}"),
    }
),
s(
  {
    trig="nsat",
    dscr="New satz",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\begin{satz}{"),
    i(1),
    t("}"),
    i(2),
    t("\\end{satz}"),
    }
),

s(
  {
    trig="nbew",
    dscr="New Beweis",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\beweis"),
  }
),
s(
  {
    trig="ff",
    dscr="fraction",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
    }
),
s(
  {
    trig="pmat",
    dscr="New parantheses matrix",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\begin{pmatrix}"),
    i(1),
    t("\\end{pmatrix}"),
    }
),

s(
  {
    trig="rar",
    dscr="\\rightarrow",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\rightarrow"),
  }
),

s(
  {
    trig="Rar",
    dscr="\\Rightarrow",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\Rightarrow"),
  }
),
s(
  {
    trig="bf",
    dscr="\\textbf{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\textbf{"),
    i(1),
    t("}"),
    }
),
s(
  {
    trig="veps",
    dscr="\\varepsilon",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\varepsilon"),
  }
),
s(
  {
    trig="d",
    dscr="\\delta",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\delta"),
  }
),
s(
  {
    trig="int",
    dscr="Integral snippet",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\int_{"),
    i(1),
    t("}^{"),
    i(2),
    t("}"),
    i(3),
    t("\\text{d}"),
    }
),
s(
  {
    trig="ndef",
    dscr="\\definition{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\begin{defi}{"),
    i(1),
    t("}"),
    i(2),
    t("\\end{defi}"),
    }
),
s(
  {
    trig="nprp",
    dscr="\\begin{property}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\begin{prop}{"),
    i(1),
    t("}"),
    i(2),
    t("\\end{prop}")
  }
),
s(
  {
    trig="nlaw",
    dscr="\\begin{law}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\begin{law}"),
    i(1),
    t("\\end{law}")
  }
),
s(
  {
    trig="mucol",
    dscr="Multicols environment",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\begin{multicols}{"),
    i(1),
    t({"}", ""}),
    i(2),
    t("\\end{multicols}"),
    }
),
s(
  {
    trig="txt",
    dscr="\\text{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\text{"),
    i(1),
    t("}"),
    }
),

s(
  {
    trig="vc",
    dscr="\\vec{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\vec{"),
    i(1),
    t("}"),
    }
),
s(
  {
    trig="IP",
    dscr="IP raum",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("Sei $(V,<\\cdot,\\cdot>)$ ein IP-Raum "),
  }
),

s(
  {
    trig="LRar",
    dscr="\\Longrightarrow",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\Longrightarrow"),
  }
),

s(
  {
    trig="Lar",
    dscr="\\Leftarrow",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\Leftarrow"),
  }
),
s(
  {
    trig="larr",
    dscr="\\leftarro3",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\leftarrow"),
  }
),
s(
  {
    trig="LeRar",
    dscr="",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\Leftrightarrow"),
  }
),
s(
  {
    trig="limfty",
    dscr="",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\lim_{"),
    i(1),
    t("\\rightarrow\\infty}"),
    }
),
s(
  {
    trig="lim",
    dscr="\\lim_{\\rightarrow}",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
      t("\\lim_{"),
      i(1),
      t("}"),
      i(2),

  }
),
s(
  {
    trig="sum",
    dscr="\\sum",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\sum_{"),
    i(1),
    t("}^{"),
    i(2),
    t("}"),
    }
),
s(
  {
    trig="fral",
    dscr="\\forall",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\forall"),
  }
),
s(
  {
    trig="inf",
    dscr="\\infty",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\infty"),
  }
),

s(
  {
    trig="cd",
    dscr="\\cdot",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\cdot"),
  }
),
s(
  {
    trig="cds",
    dscr="\\cdots",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\cdots"),
  }
),
s(
  {
    trig="circ",
    dscr="\\circ",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\circ"),
  }
),
s(
  {
    trig="nmat",
    dscr="New matrix",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\begin{matrix}"),
    i(1),
    t("\\end{matrix}"),
    }
),
s(
  {
    trig="sin",
    dscr="\\sin",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\sin\\left("),
    i(1),
    t("\\right)"),
    }
),
s(
  {
    trig="cos",
    dscr="\\cos",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\cos\\left("),
    i(1),
    t("\\right)"),
    }
),
s(
  {
    trig="sbs",
    dscr="",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\subset"),
  }
),
s(
  {
    trig="sps",
    dscr="",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\supset"),
  }
),
s(
  {
    trig="lbd",
    dscr="\\lambda",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\lambda"),
  }
),
s(
  {
    trig="exs",
    dscr="\\exists",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\exists"),
  }
),
s(
  {
    trig="tet",
    dscr="\\theta",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\theta"),
  }
),
s(
  {
    trig="mc",
    dscr="\\mathcal{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\mathcal{"),
    i(1),
    t("}"),
    }
),
s(
  {
    trig="brcs",
    dscr="\\left\\lbrace ... \\right \\rbrace",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\left\\lbrace "),
    i(1),
    t("\\right\\rbrace"),
    }
),
s(
  {
    trig="ga",
    dscr="\\gamma",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\gamma"),
  }
),
s(
  {
    trig="seimat",
    dscr="M_{n\\times n}(K)",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("M_{"),
    i(1),
    t("\\times"),
    i(2),
    t("}("),
    i(3),
    t(")"),
    }
),
s(
  {
    trig="tld",
    dscr="\\tilde{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\tilde{"),
    i(1),
    t("}"),
    }
),
s(
  {
    trig="D",
    dscr="\\Delta",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\Delta"),
  }
),
s(
  {
    trig="B",
    dscr="\\Beta",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\Beta"),
  }
),
s(
  {
    trig="nbem",
    dscr="\\bemerkung",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\bemerkung{"),
    i(1),
    t("}"),
    }
),
s(
  {
    trig="nbes",
    dscr="\\beispiel{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\beispiel{"),
    i(1),
    t("}"),
    }
),
s(
  {
    trig="Lrar",
    dscr="\\Leftrightarrow",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\Leftrightarrow"),
  }
),
s(
  {
    trig="b",
    dscr="Brackets environment for easy access out of the bracket",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
    trigEngine= "ecma",
  },
  {
      t("{"),
      i(1),
      t("}"),
      }
),
s(
  {
    trig="nkor",
    dscr="\\korollar{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
      t("\\begin{korr}{"),
      i(1),
      t("}"),
      i(2),
      t("\\end{korr}"),
}
),
s(
  {
    trig="pti",
    dscr="\\partial",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\partial"),
  }
),
s(
  {
    trig="£",
    dscr="Brackets for quick tabulation outside",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("{"),
    i(1),
    t("}"),
    }
),s(
  {
    trig="RN",
      dscr="\\mathbb{R}^n",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
      t("\\mathbb{R}^n"),
  }
),
s(
  {
    trig="lrd",
    dscr="\\left_ \\right_",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\left"), 
    i(1),
    t("\\right"),
    }
),

s(
  {
    trig="alp",
    dscr="\\alpha",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\alpha"),
  }
),
s(
  {
    trig="bet",
    dscr="\\beta",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\beta"),
  }
),
  s(
    {
      trig="vphi",
      dscr="\\varphi",
      condition = after_sub_sup,
		snippetType="autosnippet",
    },
    {
      t("\\varphi"),
    }
  ),
s(
  {
    trig="phi",
    dscr="\\phi",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\phi"),
  }
),
s(
  {
    trig="eta",
    dscr="\\eta",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\eta"),
  }
),
s(
  {
    trig="uset",
    dscr="\\underset and \\underbrace environment",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\underset{"),
    i(1),
    t("}{\\underbrace{"),
    i(2),
    t("}}"),
    }
),
s(
  {
    trig="psi",
    dscr="\\psi",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\psi"),
  }
),
s(
  {
    trig="oline",
    dscr="\\overline{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\overline{"),
    i(1),
    t("}"),
  }
),
s(
  {
    trig="bsy",
    dscr="\\boldsymbol",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\boldsymbol{"),
    i(1),
    t("}"),
  }
),
s(
  {
    trig="nrm",
    dscr="\\norm",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\norm{"),
    i(1),
    t("}")
  }
),
s(
  {
    trig="tms",
    dscr=" \\times",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\times"),
  }
),
s(
  {
    trig="pi",
    dscr="\\pi",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\pi"),
  }
),
s(
  {
    trig="qsbs",
    dscr="\\sqsubset",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\sqsubset"),
  }
),
s(
  {
    trig="sqrt",
    dscr="\\sqrt{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\sqrt{"),
    i(1),
    t("}"),
  }
),
s(
  {
    trig="Phi",
    dscr="\\Phi",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\Phi"),
  }
),
s(
  {
    trig="sigma",
    dscr="\\sigma",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\sigma"),
  }
),
s(
  {
    trig="oline",
    dscr="\\overline",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\overline{"),
    i(1),
    t("}"),
  }
),
s(
  {
    trig="uline",
    dscr="\\underline",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\underline{"),
    i(1),
    t("}"),
  }
),
s(
  {
    trig="bcup",
    dscr="\\bigcup",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\bigcup_{"),
    i(1),
    t("}^{"),
    i(2),
    t("}"),
  }
),
s(
  {
    trig="bcap",
    dscr="\\bigcap",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\bigcap_{"),
    i(1),
    t("}^{"),
    i(2),
    t("}"),
  }
),
s(
  {
    trig="mf",
    dscr="\\mathbf{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
      t("\\mathbf{"),
      i(1),
      t("}"),
  }
),
s(
  {
    trig="flsh",
    dscr="\\begin{flashcard}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
      t({"\\begin{flashcard}["}),
      i(1),
      t({"]",""}),
      i(2),
      t({"","\\end{flashcard}"}),
  }
),
s(
  {
    trig="omega",
    dscr="\\omega",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\omega"),
  }
),
s(
  {
    trig="ht",
    dscr="\\hat{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\hat{"),
    i(1),
    t("}"),
  }
),
s(
  {
    trig="xi",
    dscr="\\xi",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\xi"),
  }
),
s(
  {
    trig="rho",
    dscr="\\rho",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\rho"),
  }
),
s(
  {
    trig="i",
    dscr="inline display math environment",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("$"),
    i(1),
    t("$"),
  }
),
s(
  {
    trig="{",
    dscr="Brackets",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("{"),
    i(1),
    t("}")
  }
),
s(
  {
    trig="(",
    dscr="Brackets",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("("),
    i(1),
    t(")")
  }
),
s(
  {
    trig="[",
    dscr="Brackets",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("["),
    i(1),
    t("]")
  }
),
s(
  {
    trig="dt",
    dscr="dot",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
      t("\\dot{"),
      i(1),
  t("}"),
  }
),
s(
  {
    trig="ddt",
    dscr="dot",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
      t("\\ddot{"),
      i(1),
  t("}"),
  }
),
s(
  {
    trig="Omega",
    dscr="Omega",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\Omega"),
  }
),
s(
  {
    trig="zeta",
    dscr="\\zeta",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\zeta"),
  }
),
s(
  {
    trig="bra",
    dscr="<bra|",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\left<"),
    i(1),
    t("\\right|"),
  }
),
s(
  {
    trig="ket",
    dscr="|ket>",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\left|"),
    i(1),
    t("\\right>"),
  }
),
s(
  {
    trig="brkt",
    dscr="<bra|ket>",
    condition = after_sub_sup,
		snippetType="snippet",
    wordTrig=false,
  },
  {
    t("\\left<"),
    i(1),
    t("|"),
    i(2),
    t("\\right>"),
  }
),
s(
  {
    trig="suub",
      dscr="\\subsubsection*{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\subsubsection*{"),
    i(1),
    t("}"),
  }
),
s(
  {
    trig="bksl",
    dscr="\\backslash",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\backslash"),
  }
),
s(
  {
    trig="fsh",
      dscr="\\fsh{}",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\fsh{"),
    i(1),
    t("}"),
  }
),
s(
  {
    trig="chi",
    dscr="\\chi",
    condition = after_sub_sup,
		snippetType="autosnippet",
    wordTrig=false,
  },
  {
    t("\\chi"),
  }
),
}
