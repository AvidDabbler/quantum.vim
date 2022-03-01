local M = {}

function M.setup(options)
  local c = require("quantum.palette")
  local template = {}

  template.builtins = {
    ColorColumn = { bg = c.bg_dark },
    Conceal = { fg = c.fg_alt },
    Cursor = { fg = c.bg, bg = c.ui_cyan },
    CursorColumn = { bg = c.bg_sec },
    CursorLine = { bg = c.bg_sec },
    Directory = { fg = c.blue },
    DiffAdd = { bg = c.diff_green },
    DiffChange = { bg = c.diff_yellow },
    DiffDelete = { fg = c.fg_alt, bg = c.diff_red },
    DiffText = { bg = c.diff_text },
    EndOfBuffer = { fg = options.hide_end_of_buffer and c.bg or c.guides },
    ErrorMsg = { fg = c.ui_red },
    VertSplit = { fg = c.bg_black },
    Folded = { fg = c.fg_sec, bg = c.fold },
    FoldColumn = { fg = c.comment },
    SignColumn = { fg = c.fg_gutter, bg = c.bg },
    IncSearch = { fg = c.fg, bg = c.ui_purple },
    LineNr = { fg = c.fg_gutter },
    CursorLineNr = { fg = c.fg_sec },
    MatchParen = { fg = c.fg, bg = c.search },
    ModeMsg = { fg = c.ui_cyan },
    MsgArea = { fg = c.fg_sec },
    MoreMsg = { fg = c.ui_cyan },
    NonText = { fg = c.guides },
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg_dark },
    FloatBorder = { fg = c.bg_black, bg = c.bg_dark },
    Pmenu = { fg = c.fg_sec, bg = c.bg_dark },
    PmenuSel = { bg = c.bg_alt },
    PmenuSbar = { bg = c.fg_gutter },
    PmenuThumb = { bg = c.comment },
    Question = { fg = c.ui_cyan },
    QuickFixLine = { bg = c.bg_alt },
    Search = { bg = c.bg_purple },
    SpecialKey = { fg = c.comment, gui = "italic" },
    SpellBad = { bg = c.bg_red, gui = "undercurl", sp = c.ui_red },
    SpellCap = { bg = c.bg_yellow, gui = "undercurl", sp = c.ui_yellow },
    SpellLocal = { bg = c.bg_cyan, gui = "undercurl", sp = c.ui_cyan },
    SpellRare = { bg = c.bg_cyan, gui = "undercurl", sp = c.ui_cyan },
    StatusLine = { fg = c.fg_sec, bg = c.bg_dark },
    StatusLineNC = { fg = c.comment, bg = c.bg_dark },
    TabLine = { fg = c.fg_alt, bg = c.bg_dark },
    TabLineFill = { fg = c.fg_alt, bg = c.bg_dark },
    TabLineSel = { fg = c.fg, bg = c.bg_dark },
    Terminal = { fg = c.fg, bg = c.bg },
    Title = { fg = c.ui_cyan, style = "bold" },
    Visual = { bg = c.selection },
    VisualNOS = {},
    WarningMsg = { fg = c.ui_yellow },
    WildMenu = { fg = c.bg, bg = c.bg_alt },
  }

  template.syntax = {
    Comment = { fg = c.comment, gui = options.style.comments },
    Constant = { fg = c.orange },
    String = { fg = c.blue },
    Character = { fg = c.blue },
    Number = { fg = c.orange },
    Boolean = { fg = c.orange },
    Float = { fg = c.orange },
    Identifier = { fg = c.cyan, gui = options.style.variables },
    Function = { fg = c.green, gui = options.style.functions },
    Statement = { fg = c.magenta },
    Conditional = { fg = c.magenta },
    Repeat = { fg = c.magenta },
    Label = { fg = c.magenta },
    Operator = { fg = c.magenta },
    Keyword = { fg = c.magenta, gui = options.style.keywords },
    Exception = { fg = c.magenta },
    PreProc = { fg = c.magenta },
    Include = { fg = c.magenta },
    Define = { fg = c.magenta },
    Macro = { fg = c.magenta },
    PreCondit = { fg = c.magenta },
    Type = { fg = c.purple },
    StorageClass = { fg = c.purple },
    Structure = { fg = c.purple },
    Typedef = { fg = c.purple },
    Special = { fg = c.orange },
    SpecialChar = { fg = c.orange },
    Tag = { fg = c.ui_green, gui = "bold" },
    Delimiter = { fg = c.fg_alt },
    SpecialComment = { fg = c.fg_alt, gui = "bold" },
    Debug = { fg = c.ui_yellow, gui = "bold" },
    Underlined = { gui = "underline" },
    Ignore = {},
    Error = { fg = c.ui_red, gui = "bold" },
    Todo = { fg = c.ui_cyan, gui = "bold" },
  }

  template.lsp = {
    LspReferenceText = { bg = c.bg_green },
    LspReferenceRead = { bg = c.bg_cyan },
    LspReferenceWrite = { bg = c.bg_green },

    DiagnosticError = { fg = c.ui_red },
    DiagnosticWarn = { fg = c.ui_yellow },
    DiagnosticInfo = { fg = c.ui_cyan },
    DiagnosticHint = { fg = c.ui_green },

    DiagnosticVirtualTextError = { fg = c.ui_red },
    DiagnosticVirtualTextWarn = { fg = c.ui_yellow },
    DiagnosticVirtualTextInfo = { fg = c.ui_cyan },
    DiagnosticVirtualTextHint = { fg = c.ui_green },

    DiagnosticUnderlineError = { gui = "undercurl", sp = c.ui_red },
    DiagnosticUnderlineWarn = { gui = "undercurl", sp = c.ui_yellow },
    DiagnosticUnderlineInfo = { gui = "undercurl", sp = c.ui_cyan },
    DiagnosticUnderlineHint = { gui = "undercurl", sp = c.ui_green },
  }

  template.treesitter = {
    -- TSPunctDelimiter = { link = "Delimiter" },
    -- TSPunctBracket = { link = "Delimiter" },
    -- TSPunctSpecial = { link = "Delimiter" },
    -- TSConstant = { link = "Constant" },
    -- TSConstBuiltin = { link = "Special" },
    -- TSConstMacro = { link = "Define" },
    -- TSString = { link = "String" },
    -- TSStringRegex = { link = "String" },
    -- TSStringEscape = { link = "SpecialChar" },
    -- TSStringSpecial = { link = "SpecialChar" },
    -- TSCharacter = { link = "Character" },
    -- TSNumber = { link = "Number" },
    -- TSBoolean = { link = "Boolean" },
    -- TSFloat = { link = "Float" },
    -- TSFunction = { link = "Function" },
    -- TSFuncBuiltin = { link = "Special" },
    TSFuncMacro = { link = "Function" }, -- Macro
    -- TSParameter = { link = "Identifier" },
    -- TSParameterReference = { link = "TSParameter" },
    -- TSMethod = { link = "Function" },
    -- TSField = { link = "Identifier" },
    -- TSProperty = { link = "Identifier" },
    TSConstructor = { link = "Type" }, -- Special
    -- TSAnnotation = { link = "PreProc" },
    -- TSAttribute = { link = "PreProc" },
    TSNamespace = { link = "Type" }, -- Include
    -- TSSymbol = { link = "Identifier" },
    -- TSConditional = { link = "Conditional" },
    -- TSRepeat = { link = "Repeat" },
    -- TSLabel = { link = "Label" },
    -- TSOperator = { link = "Operator" },
    -- TSKeyword = { link = "Keyword" },
    -- TSKeywordFunction = { link = "Keyword" },
    -- TSKeywordOperator = { link = "TSOperator" },
    -- TSKeywordReturn = { link = "TSKeyword" },
    -- TSException = { link = "Exception" },
    -- TSType = { link = "Type" },
    -- TSTypeBuiltin = { link = "Type" },
    -- TSInclude = { link = "Include" },
    -- TSVariableBuiltin = { link = "Special" },
    -- TSText = { link = "TSNone" },
    -- TSStrong term=bold cterm=bold  = { link = "gui=bold" },
    -- TSEmphasis term=italic cterm=italic  = { link = "gui=italic" },
    -- TSUnderline term=underline cterm=underline  = { link = "gui=underline" },
    -- TSStrike term=strikethrough cterm=strikethrough  = { link = "gui=strikethrough" },
    -- TSMath = { link = "Special" },
    -- TSTextReference = { link = "Constant" },
    -- TSEnvironment = { link = "Macro" },
    -- TSEnvironmentName = { link = "Type" },
    -- TSTitle = { link = "Title" },
    -- TSLiteral = { link = "String" },
    -- TSURI = { link = "Underline" },
    -- TSComment = { link = "Comment" },
    TSNote = { fg = c.bg, bg = c.ui_cyan },
    TSWarning = { fg = c.bg, bg = c.ui_yellow },
    TSDanger = { fg = c.bg, bg = c.ui_red },
    -- TSTag = { link = "Label" },
    -- TSTagDelimiter = { link = "Delimiter" },
    -- TSTagAttribute = { link = "TSProperty" },
  }

  template.others = {
    -- diff
    diffAdded = { fg = c.git_green },
    diffRemoved = { fg = c.git_red },
    diffChanged = { fg = c.git_yellow },

    -- markdown
    markdownCode = { fg = c.cyan },
    markdownCodeBlock = { fg = c.cyan },
  }

  template.plugins = {
    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = c.git_green },
    GitSignsDelete = { fg = c.git_red },
    GitSignsChange = { fg = c.git_yellow },
    GitSignsCurrentLineBlame = { fg = c.search },

    -- kyazdani42/nvim-tree.lua
    NvimTreeIndentMarker = { fg = c.bg_sec },
    NvimTreeGitDirty = { fg = c.git_yellow },
    NvimTreeGitNew = { fg = c.git_green },
    NvimTreeGitDeleted = { fg = c.git_red },
    NvimTreeNormal = { fg = c.fg_sec, bg = c.bg_dark },
    NvimTreeCursorLine = { bg = c.bg },
    NvimTreeStatusLineNC = { bg = c.bg_dark },
    NvimTreeCursorColumn = { bg = c.bg },
    NvimTreeVertSplit = { fg = c.bg_dark, bg = c.bg_dark },

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = c.fg_sec },
    CmpItemAbbrDeprecated = { fg = c.comment, gui = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.fg, gui = "bold" },
    CmpItemAbbrMatchFuzzy = { fg = c.ui_green, gui = "bold" },
    CmpItemMenu = { fg = c.comment },
    CmpItemKindDefault = { fg = c.fg_alt },
    CmpItemKindMethod = { fg = c.ui_purple },
    CmpItemKindFunction = { fg = c.ui_purple },
    CmpItemKindConstructor = { fg = c.ui_purple },
    CmpItemKindVariable = { fg = c.ui_cyan },
    CmpItemKindField = { fg = c.ui_cyan },
    CmpItemKindInterface = { fg = c.ui_cyan },
    CmpItemKindClass = { fg = c.ui_yellow },
    CmpItemKindEvent = { fg = c.ui_yellow },
    CmpItemKindValue = { fg = c.ui_yellow },
    CmpItemKindEnum = { fg = c.ui_yellow },
    CmpItemKindEnumMember = { fg = c.ui_yellow },

    -- lukas-reineke/indent-blankline.nvim
    IndentBlanklineChar = { fg = c.bg_alt },
    IndentBlanklineContextChar = { fg = c.search },
    IndentBlanklineContextStart = { gui = "underline", sp = c.search },

    -- nvim-telescope/telescope.nvim
    TelescopeSelection = { bg = c.bg_alt },
    TelescopeBorder = { fg = c.bg_black },
    TelescopeTitle = { fg = c.fg_sec, bg = c.bg_black },
    TelescopeMatching = { fg = c.ui_green, gui = "bold" },

    -- nvim-treesitter/playground
    TSPlaygroundFocus = { fg = c.guides },

    -- glepnir/dashboard-nvim
    DashboardHeader = { fg = c.comment },
    DashboardCenter = { fg = c.comment },
    DashboardShortcut = { fg = c.ui_green },
    DashboardFooter = { fg = c.comment },

    -- folke/trouble.nvim
    TroubleCount = { bg = c.bg_alt },
    TroubleIndent = { fg = c.bg_alt },
    TroubleText = { fg = c.fg_sec },
  }

  return template
end

return M
