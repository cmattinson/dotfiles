local M = {}

local C = {
  bg = "#2a1a15",
  bg2 = "#33231d",
  bg3 = "#3d2d26",
  fg = "#eeeeee",
  orange = "#EC5B2B",
  orange2 = "#EE7948",
  orange3 = "#FFF7F1",
  blue = "#6ba1e6",
  teal = "#56b6c2",
  red = "#e06c75",
  gold = "#e5c07b",
  gray = "#808080",
}

local function hg(group, opts)
  if opts.link then
    vim.cmd("highlight default link " .. group .. " " .. opts.link)
    return
  end
  local hl = {}
  if opts.fg then hl.fg = opts.fg end
  if opts.bg then hl.bg = opts.bg end
  if opts.sp then hl.sp = opts.sp end
  if opts.bold then hl.bold = true end
  if opts.italic then hl.italic = true end
  if opts.underline then hl.underline = true end
  if opts.strikethrough then hl.strikethrough = true end
  vim.api.nvim_set_hl(0, group, hl)
end

local function set_highlights()
  -- UI
  hg("Normal", { fg = C.fg })
  hg("NormalFloat", { fg = C.fg, bg = C.bg2 })
  hg("NormalNC", { fg = C.fg })
  hg("EndOfBuffer", {})

  hg("Cursor", { bg = C.fg })
  hg("lCursor", { bg = C.fg })
  hg("CursorLine", { bg = C.bg2 })
  hg("CursorColumn", { bg = C.bg2 })
  hg("CursorLineNr", { fg = C.orange })
  hg("LineNr", { fg = C.gray })

  hg("Visual", { bg = C.bg3 })
  hg("VisualNOS", { link = "Visual" })

  hg("Search", { bg = C.orange })
  hg("CurSearch", { link = "Search" })
  hg("IncSearch", { bg = C.orange })

  hg("MatchParen", { fg = C.orange, bold = true })

  hg("Pmenu", { fg = C.fg, bg = C.bg2 })
  hg("PmenuSel", { bg = C.orange })
  hg("PmenuSbar", { bg = C.bg3 })
  hg("PmenuThumb", { bg = C.gray })

  hg("StatusLine", { fg = C.fg, bg = C.bg2 })
  hg("StatusLineNC", { fg = C.gray })
  hg("WinBar", { fg = C.fg, bg = C.bg2 })
  hg("WinBarNC", { fg = C.gray })
  hg("WinSeparator", { fg = C.bg3 })

  hg("TabLine", { fg = C.gray })
  hg("TabLineFill", {})
  hg("TabLineSel", { fg = C.orange, bold = true })

  hg("SignColumn", {})
  hg("FoldColumn", { fg = C.gray })
  hg("Folded", { fg = C.gray, bg = C.bg2 })

  hg("ColorColumn", { bg = C.bg2 })
  hg("Conceal", { fg = C.gray })

  hg("Directory", { fg = C.blue })
  hg("Title", { fg = C.orange, bold = true })

  hg("ErrorMsg", { fg = C.red, bold = true })
  hg("WarningMsg", { fg = C.orange })
  hg("MoreMsg", { fg = C.orange })
  hg("Question", { fg = C.orange })
  hg("ModeMsg", { fg = C.fg })

  hg("NonText", { fg = C.gray })
  hg("Whitespace", { fg = C.bg3 })
  hg("SpecialKey", { fg = C.gray })

  hg("SpellBad", { sp = C.red, underline = true })
  hg("SpellCap", { sp = C.teal, underline = true })
  hg("SpellLocal", { sp = C.teal, underline = true })
  hg("SpellRare", { sp = C.orange, underline = true })

  hg("QuickFixLine", { bg = C.bg2 })
  hg("WildMenu", { bg = C.orange })

  hg("DiffAdd", { bg = "#1e3a2e" })
  hg("DiffChange", { bg = "#2e2a1e" })
  hg("DiffDelete", { fg = C.red, bg = "#3a1e1e" })
  hg("DiffText", { bg = "#3a3a1e" })

  hg("DiagnosticOk", { fg = C.blue })
  hg("DiagnosticError", { fg = C.red })
  hg("DiagnosticWarn", { fg = C.orange })
  hg("DiagnosticInfo", { fg = C.teal })
  hg("DiagnosticHint", { fg = C.gray })
  hg("DiagnosticUnderlineOk", { sp = C.blue, underline = true })
  hg("DiagnosticUnderlineError", { sp = C.red, underline = true })
  hg("DiagnosticUnderlineWarn", { sp = C.orange, underline = true })
  hg("DiagnosticUnderlineInfo", { sp = C.teal, underline = true })
  hg("DiagnosticUnderlineHint", { sp = C.gray, underline = true })

  hg("LspCodeLens", { fg = C.gray })
  hg("LspCodeLensSeparator", { fg = C.gray })
  hg("LspReferenceText", { bg = C.bg3 })
  hg("LspReferenceRead", { bg = C.bg3 })
  hg("LspReferenceWrite", { bg = C.bg3 })
  hg("LspSignatureActiveParameter", { fg = C.orange, bold = true })

  hg("@lsp.type.class", { link = "@type" })
  hg("@lsp.type.comment", { link = "@comment" })
  hg("@lsp.type.decorator", { link = "@attribute" })
  hg("@lsp.type.enum", { link = "@type" })
  hg("@lsp.type.enumMember", { link = "@constant" })
  hg("@lsp.type.function", { link = "@function" })
  hg("@lsp.type.interface", { link = "@type" })
  hg("@lsp.type.macro", { link = "@function.macro" })
  hg("@lsp.type.method", { link = "@method" })
  hg("@lsp.type.namespace", { link = "@namespace" })
  hg("@lsp.type.parameter", { link = "@parameter" })
  hg("@lsp.type.property", { link = "@property" })
  hg("@lsp.type.struct", { link = "@type" })
  hg("@lsp.type.type", { link = "@type" })
  hg("@lsp.type.typeParameter", { link = "@type.definition" })
  hg("@lsp.type.variable", { link = "@variable" })

  hg("LspInlayHint", { fg = C.gray, bg = C.bg2 })

  -- Standard syntax
  hg("Comment", { fg = C.gray, italic = true })
  hg("Constant", { fg = C.orange3 })
  hg("String", { fg = C.blue })
  hg("Character", { fg = C.blue })
  hg("Number", { fg = C.orange2 })
  hg("Boolean", { fg = C.orange2 })
  hg("Float", { fg = C.orange2 })

  hg("Identifier", { fg = C.fg })
  hg("Function", { fg = C.orange })
  hg("Method", { fg = C.orange })

  hg("Statement", { fg = C.orange })
  hg("Conditional", { fg = C.orange })
  hg("Repeat", { fg = C.orange })
  hg("Label", { fg = C.orange })
  hg("Operator", { fg = C.teal })
  hg("Keyword", { fg = C.orange })
  hg("Exception", { fg = C.orange })

  hg("PreProc", { fg = C.orange })
  hg("Include", { fg = C.orange })
  hg("Define", { fg = C.orange })
  hg("Macro", { fg = C.orange })
  hg("PreCondit", { fg = C.orange })

  hg("Type", { fg = C.gold })
  hg("StorageClass", { fg = C.gold })
  hg("Structure", { fg = C.gold })
  hg("Typedef", { fg = C.gold })

  hg("Special", { fg = C.orange })
  hg("SpecialChar", { fg = C.teal })
  hg("Tag", { fg = C.orange })
  hg("Delimiter", { fg = C.fg })
  hg("SpecialComment", { fg = C.gray })
  hg("Debug", { fg = C.orange })

  hg("Underlined", { fg = C.fg, underline = true })
  hg("Ignore", { fg = C.bg })
  hg("Error", { fg = C.red })
  hg("Todo", { fg = C.gold, bold = true })

  -- Treesitter
  hg("@comment", { fg = C.gray, italic = true })
  hg("@comment.error", { fg = C.red })
  hg("@comment.warning", { fg = C.orange })
  hg("@comment.todo", { fg = C.gold, bold = true })
  hg("@comment.note", { fg = C.blue })

  hg("@error", { fg = C.red })

  hg("@preproc", { fg = C.orange })
  hg("@define", { fg = C.orange })
  hg("@operator", { fg = C.teal })

  hg("@punctuation.delimiter", { fg = C.fg })
  hg("@punctuation.bracket", { fg = C.fg })
  hg("@punctuation.special", { fg = C.teal })

  hg("@string", { fg = C.blue })
  hg("@string.regex", { fg = C.gold })
  hg("@string.escape", { fg = C.teal })
  hg("@string.special", { fg = C.teal })

  hg("@character", { fg = C.blue })
  hg("@character.special", { fg = C.teal })

  hg("@number", { fg = C.orange2 })
  hg("@boolean", { fg = C.orange2 })
  hg("@float", { fg = C.orange2 })

  hg("@function", { fg = C.orange })
  hg("@function.builtin", { fg = C.red })
  hg("@function.call", { fg = C.orange })
  hg("@function.macro", { fg = C.orange })
  hg("@function.method", { fg = C.orange })
  hg("@function.method.call", { fg = C.orange })

  hg("@parameter", { fg = C.red })
  hg("@parameter.reference", { fg = C.red })

  hg("@method", { fg = C.orange })
  hg("@method.call", { fg = C.orange })

  hg("@field", { fg = C.teal })
  hg("@property", { fg = C.teal })

  hg("@constructor", { fg = C.gold })

  hg("@conditional", { fg = C.orange })
  hg("@repeat", { fg = C.orange })
  hg("@label", { fg = C.orange })
  hg("@include", { fg = C.orange })
  hg("@keyword", { fg = C.orange })
  hg("@keyword.function", { fg = C.orange })
  hg("@keyword.operator", { fg = C.teal })
  hg("@keyword.return", { fg = C.orange })
  hg("@keyword.repeat", { fg = C.orange })

  hg("@exception", { fg = C.orange })

  hg("@type", { fg = C.gold })
  hg("@type.builtin", { fg = C.gold })
  hg("@type.definition", { fg = C.gold })
  hg("@type.qualifier", { fg = C.gold })

  hg("@storageclass", { fg = C.gold })
  hg("@attribute", { fg = C.gold })

  hg("@variable", { fg = C.red })
  hg("@variable.builtin", { fg = C.red })

  hg("@constant", { fg = C.orange3 })
  hg("@constant.builtin", { fg = C.orange3 })
  hg("@constant.macro", { fg = C.orange3 })

  hg("@namespace", { fg = C.orange })
  hg("@module", { fg = C.orange })
  hg("@symbol", { fg = C.orange })

  hg("@text", { fg = C.fg })
  hg("@text.strong", { bold = true })
  hg("@text.emphasis", { italic = true })
  hg("@text.underline", { underline = true })
  hg("@text.strike", { strikethrough = true })
  hg("@text.title", { fg = C.orange, bold = true })
  hg("@text.literal", { fg = C.blue })
  hg("@text.uri", { fg = C.teal, underline = true })
  hg("@text.math", { fg = C.orange2 })
  hg("@text.environment", { fg = C.orange })
  hg("@text.environment.name", { fg = C.teal })
  hg("@text.reference", { fg = C.teal })
  hg("@text.todo", { fg = C.gold, bold = true })
  hg("@text.note", { fg = C.blue })
  hg("@text.warning", { fg = C.orange })
  hg("@text.danger", { fg = C.red })
  hg("@text.diff.add", { fg = C.blue })
  hg("@text.diff.delete", { fg = C.red })

  hg("@markup.heading", { fg = C.orange, bold = true })
  hg("@markup.italic", { italic = true })
  hg("@markup.bold", { bold = true })
  hg("@markup.underline", { underline = true })
  hg("@markup.strikethrough", { strikethrough = true })
  hg("@markup.link", { fg = C.orange })
  hg("@markup.link.label", { fg = C.teal })
  hg("@markup.link.url", { fg = C.teal, underline = true })
  hg("@markup.raw", { fg = C.blue })
  hg("@markup.list", { fg = C.orange })
  hg("@markup.list.checked", { fg = C.blue })
  hg("@markup.list.unchecked", { fg = C.orange })
  hg("@markup.quote", { fg = C.orange3 })
  hg("@markup.math", { fg = C.orange2 })
  hg("@markup.code", { fg = C.blue })
  hg("@markup.inline", { fg = C.blue })

  hg("@tag", { fg = C.orange })
  hg("@tag.attribute", { fg = C.teal })
  hg("@tag.delimiter", { fg = C.fg })
end

vim.g.colors_name = "lucent-orng"

set_highlights()
