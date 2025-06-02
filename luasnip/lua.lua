--This file is to make the writing of snippets easier

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
    {
      trig="ns",
      dscr="Add a new snippet",
    },
    {
      t({ "s(", "  {", '    trig="' }),
      i(1),
      t({'",', '    dscr="'}),
      i(2),
      t({'",','    snippetType="'}),
      i(3),
      t({'snippet",','    wordTrig='}),
      i(4),
      t({',','  },', '  {','    t('}),
      i(5),
      t({'),', '  }', '),'}),
    }
  ),
}
