local M = {}

function M.setup(options)
  local c = require("quantum.palette").get_palette(options.palette)
  local template = {}

  template.builtins = {
    ColorColumn = { bg = c.bg_dark },
    Conceal = { fg = c.fg_alt },
    CurSearch = { fg = c.bg, bg = c.ui_purple },
    Cursor = { fg = c.bg, bg = c.cyan },
    CursorColumn = { bg = c.bg_sec },
    CursorLine = { bg = "#044c02" },
    Directory = { fg = c.blue },
    DiffAdd = { bg = c.diff_green },
    DiffChange = { bg = c.diff_yellow },
    DiffDelete = { fg = c.fg_alt, bg = c.diff_red },
    DiffText = { bg = c.diff_text },
    EndOfBuffer = { fg = options.hide_end_of_buffer and c.bg or c.guides },
    ErrorMsg = { fg = c.ui_red },
    VertSplit = { fg = c.border },
    Folded = { fg = c.fg_sec, bg = c.fold },
    FoldColumn = { fg = c.comment },
    SignColumn = { fg = c.fg_gutter, bg = c.bg },
    IncSearch = { fg = c.bg, bg = c.ui_purple },
    LineNr = { fg = "#aeb7ae" },
    CursorLineNr = { fg = c.blue },
    -- CursorLineSign = { bg = c.bg_sec },
    -- CursorLineFold = { fg = c.comment, bg = c.bg_sec },
    MatchParen = { fg = c.fg, bg = c.bracket_match },
    ModeMsg = { fg = c.ui_cyan },
    MsgArea = { fg = c.fg_sec },
    MoreMsg = { fg = c.ui_cyan },
    NonText = { fg = c.guides },
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg_dark },
    FloatBorder = { fg = c.border, bg = c.bg },
    Pmenu = { fg = c.fg_sec, bg = c.bg_dark },
    PmenuSel = { bg = c.selection },
    PmenuSbar = { bg = c.fg_gutter },
    PmenuThumb = { bg = c.comment },
    Question = { fg = c.ui_cyan },
    QuickFixLine = { bg = c.selection },
    Search = { bg = c.bg_purple },
    SpecialKey = { fg = c.comment, italic = true },
    SpellBad = { bg = c.bg_red, undercurl = true, sp = c.ui_red },
    SpellCap = { bg = c.bg_yellow, undercurl = true, sp = c.ui_yellow },
    SpellLocal = { bg = c.bg_cyan, undercurl = true, sp = c.ui_cyan },
    SpellRare = { bg = c.bg_cyan, undercurl = true, sp = c.ui_cyan },
    StatusLine = { fg = c.fg_alt, bg = c.bg_alt },
    StatusLineNC = { fg = c.bracket_match, bg = c.bg_alt },
    TabLine = { fg = c.fg_alt, bg = c.bg_alt },
    TabLineFill = { fg = c.fg_alt, bg = c.bg_alt },
    TabLineSel = { fg = c.fg, bg = c.bg },
    Terminal = { fg = c.fg, bg = c.bg },
    Title = { fg = c.ui_cyan, bold = true },
    Visual = { bg = "#586857" },
    VisualNOS = {},
    WarningMsg = { fg = c.ui_yellow },
    WildMenu = { fg = c.bg, bg = c.selection },
    WinBar = { fg = c.fg_alt },
  }

  template.syntax = {
    Comment = { fg = c.comment, italic = options.style.italics.comments },
    Constant = { fg = c.orange },
    String = { fg = c.blue },
    Character = { fg = c.blue },
    Number = { fg = c.orange },
    Boolean = { fg = c.orange },
    Float = { fg = c.orange },
    Identifier = { fg = c.cyan, italic = options.style.italics.variables },
    Function = { fg = c.green, italic = options.style.italics.functions },
    Statement = { fg = c.magenta },
    Conditional = { fg = c.magenta },
    Repeat = { fg = c.magenta },
    Label = { fg = c.magenta },
    Operator = { fg = c.magenta },
    Keyword = { fg = c.magenta, italic = options.style.italics.keywords },
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
    Tag = { fg = c.ui_green, bold = true },
    Delimiter = { fg = c.fg_alt },
    SpecialComment = { fg = c.fg_alt, bold = true },
    Debug = { fg = c.ui_yellow, bold = true },
    Underlined = { underline = true },
    Ignore = {},
    Error = { fg = c.ui_red, bold = true },
    Todo = { fg = c.ui_cyan, bold = true },
  }

  template.lsp = {
    LspReferenceText = { bg = c.bg_green },
    LspReferenceRead = { bg = c.bg_cyan },
    LspReferenceWrite = { bg = c.bg_green },
    LspCodeLens = { fg = c.fg_alt, underline = true },

    DiagnosticError = { fg = c.ui_red },
    DiagnosticWarn = { fg = c.ui_yellow },
    DiagnosticInfo = { fg = c.ui_cyan },
    DiagnosticHint = { fg = c.ui_green },

    DiagnosticVirtualTextError = { fg = c.ui_red },
    DiagnosticVirtualTextWarn = { fg = c.ui_yellow },
    DiagnosticVirtualTextInfo = { fg = c.ui_cyan },
    DiagnosticVirtualTextHint = { fg = c.ui_green },

    DiagnosticUnderlineError = { undercurl = true, sp = c.ui_red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.ui_yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.ui_cyan },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.ui_green },
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
    TSTagAttribute = { link = "Type" }, -- TSProperty
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
    GitSignsCurrentLineBlame = { fg = c.bracket_match },
    GitSignsAddInline = { fg = c.bg, bg = c.git_green },
    GitSignsChangeInline = { bg = c.git_yellow },
    GitSignsDeleteInline = { fg = c.bg, bg = c.git_red },
    GitSignsDeleteLn = { bg = c.diff_red },

    -- kyazdani42/nvim-tree.lua
    NvimTreeIndentMarker = { fg = c.bracket_match },
    NvimTreeGitDirty = { fg = c.git_yellow },
    NvimTreeGitNew = { fg = c.git_green },
    NvimTreeGitDeleted = { fg = c.git_red },
    NvimTreeNormal = { fg = c.fg_sec, bg = c.bg_dark },
    NvimTreeCursorLine = { bg = c.selection },
    NvimTreeStatusLineNC = { bg = c.bg_dark },
    NvimTreeCursorColumn = { bg = c.bg },
    NvimTreeVertSplit = { fg = c.border, bg = c.bg_dark },

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.comment, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.cyan, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, bold = true },
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
    CmpBorderedWindow_Normal = { bg = c.bg_dark },
    CmpBorderedWindow_CursorLine = { bg = c.bg_alt },

    -- lukas-reineke/indent-blankline.nvim
    IndentBlanklineChar = { fg = c.bg_alt },
    IndentBlanklineContextChar = { fg = c.bracket_match },
    IndentBlanklineContextStart = { underline = true, sp = c.bracket_match },

    -- nvim-telescope/telescope.nvim
    TelescopeSelection = { bg = c.selection },
    TelescopeBorder = { fg = c.border },
    TelescopeTitle = { fg = c.fg_sec, bg = c.border },
    TelescopeMatching = { fg = c.cyan, bold = true },
    TelescopePromptCounter = { fg = c.comment },
    TelescopeResultsDiffAdd = { fg = c.git_green },
    TelescopeResultsDiffDelete = { fg = c.git_red },
    TelescopeResultsDiffChange = { fg = c.git_yellow },
    TelescopeResultsDiffUntracked = { fg = c.git_green },

    -- nvim-treesitter/playground
    TSPlaygroundFocus = { bg = c.guides },

    -- glepnir/dashboard-nvim
    DashboardHeader = { fg = c.comment },
    DashboardCenter = { fg = c.comment },
    DashboardShortcut = { fg = c.ui_green },
    DashboardFooter = { fg = c.comment },

    -- folke/trouble.nvim
    TroubleCount = { bg = c.bg_alt },
    TroubleIndent = { fg = c.bg_alt },
    TroubleText = { fg = c.fg_sec },
    TroubleNormal = { fg = c.fg_sec, bg = c.bg_dark },

    -- SmiteshP/nvim-navic
    NavicIconsFile = { fg = c.fg_alt },
    NavicIconsModule = { fg = c.fg_alt },
    NavicIconsNamespace = { fg = c.fg_alt },
    NavicIconsPackage = { fg = c.fg_alt },
    NavicIconsClass = { fg = c.ui_yellow },
    NavicIconsMethod = { fg = c.ui_purple },
    NavicIconsProperty = { fg = c.fg_alt },
    NavicIconsField = { fg = c.ui_cyan },
    NavicIconsConstructor = { fg = c.ui_purple },
    NavicIconsEnum = { fg = c.ui_yellow },
    NavicIconsInterface = { fg = c.ui_cyan },
    NavicIconsFunction = { fg = c.ui_purple },
    NavicIconsVariable = { fg = c.ui_cyan },
    NavicIconsConstant = { fg = c.fg_alt },
    NavicIconsString = { fg = c.fg_alt },
    NavicIconsNumber = { fg = c.fg_alt },
    NavicIconsBoolean = { fg = c.fg_alt },
    NavicIconsArray = { fg = c.fg_alt },
    NavicIconsObject = { fg = c.fg_alt },
    NavicIconsKey = { fg = c.fg_alt },
    NavicIconsNull = { fg = c.fg_alt },
    NavicIconsEnumMember = { fg = c.ui_yellow },
    NavicIconsStruct = { fg = c.fg_alt },
    NavicIconsEvent = { fg = c.ui_yellow },
    NavicIconsOperator = { fg = c.fg_alt },
    NavicIconsTypeParameter = { fg = c.fg_alt },
    NavicText = { fg = c.fg_alt },
  }

  return template
end

return M
