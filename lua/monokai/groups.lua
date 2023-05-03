local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

M.setup = function()
  local config = require("monokai").config
  local colors = require("monokai.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    MonokaiFg0 = { fg = colors.fg0 },
    MonokaiFg1 = { fg = colors.fg1 },
    MonokaiFg2 = { fg = colors.fg2 },
    MonokaiFg3 = { fg = colors.fg3 },
    MonokaiFg4 = { fg = colors.fg4 },
    MonokaiGray = { fg = colors.gray },
    MonokaiBg0 = { fg = colors.bg0 },
    MonokaiBg1 = { fg = colors.bg1 },
    MonokaiBg2 = { fg = colors.bg2 },
    MonokaiBg3 = { fg = colors.bg3 },
    MonokaiBg4 = { fg = colors.bg4 },
    MonokaiRed = { fg = colors.red },
    MonokaiRedBold = { fg = colors.red, bold = config.bold },
    MonokaiGreen = { fg = colors.green },
    MonokaiGreenBold = { fg = colors.green, bold = config.bold },
    MonokaiYellow = { fg = colors.yellow },
    MonokaiYellowBold = { fg = colors.yellow, bold = config.bold },
    MonokaiBlue = { fg = colors.blue },
    MonokaiBlueBold = { fg = colors.blue, bold = config.bold },
    MonokaiPurple = { fg = colors.purple },
    MonokaiPurpleBold = { fg = colors.purple, bold = config.bold },
    MonokaiAqua = { fg = colors.aqua },
    MonokaiAquaBold = { fg = colors.aqua, bold = config.bold },
    MonokaiOrange = { fg = colors.orange },
    MonokaiOrangeBold = { fg = colors.orange, bold = config.bold },
    MonokaiRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    MonokaiGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    MonokaiYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    MonokaiBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    MonokaiPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    MonokaiAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    MonokaiOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    MonokaiRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    MonokaiGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    MonokaiYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    MonokaiBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    MonokaiPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    MonokaiAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    MonokaiOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "MonokaiBg2" },
    SpecialKey = { link = "MonokaiFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "MonokaiBlueBold" },
    Title = { link = "MonokaiGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "MonokaiYellowBold" },
    ModeMsg = { link = "MonokaiYellowBold" },
    Question = { link = "MonokaiOrangeBold" },
    WarningMsg = { link = "MonokaiRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "MonokaiOrange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    -- Todo         anything that needs extra attention; mostly the
    --              keywords TODO FIXME and XXX
    Todo = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "MonokaiRed" },
    Conditional = { link = "MonokaiRed" },
    Repeat = { link = "MonokaiRed" },
    Label = { link = "MonokaiRed" },
    Exception = { link = "MonokaiRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "MonokaiRed" },
    Identifier = { link = "MonokaiBlue" },
    Function = { link = "MonokaiGreenBold" },
    PreProc = { link = "MonokaiAqua" },
    Include = { link = "MonokaiAqua" },
    Define = { link = "MonokaiAqua" },
    Macro = { link = "MonokaiAqua" },
    PreCondit = { link = "MonokaiAqua" },
    Constant = { link = "MonokaiPurple" },
    Character = { link = "MonokaiPurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "MonokaiPurple" },
    Number = { link = "MonokaiPurple" },
    Float = { link = "MonokaiPurple" },
    Type = { link = "MonokaiYellow" },
    StorageClass = { link = "MonokaiOrange" },
    Structure = { link = "MonokaiAqua" },
    Typedef = { link = "MonokaiYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "MonokaiBlueUnderline" },
    SpellBad = { link = "MonokaiRedUnderline" },
    SpellLocal = { link = "MonokaiAquaUnderline" },
    SpellRare = { link = "MonokaiPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "MonokaiRed" },
    DiagnosticSignError = { link = "MonokaiRedSign" },
    DiagnosticUnderlineError = { link = "MonokaiRedUnderline" },
    DiagnosticWarn = { link = "MonokaiYellow" },
    DiagnosticSignWarn = { link = "MonokaiYellowSign" },
    DiagnosticUnderlineWarn = { link = "MonokaiYellowUnderline" },
    DiagnosticInfo = { link = "MonokaiBlue" },
    DiagnosticSignInfo = { link = "MonokaiBlueSign" },
    DiagnosticUnderlineInfo = { link = "MonokaiBlueUnderline" },
    DiagnosticHint = { link = "MonokaiAqua" },
    DiagnosticSignHint = { link = "MonokaiAquaSign" },
    DiagnosticUnderlineHint = { link = "MonokaiAquaUnderline" },
    DiagnosticFloatingError = { link = "MonokaiRed" },
    DiagnosticFloatingWarn = { link = "MonokaiOrange" },
    DiagnosticFloatingInfo = { link = "MonokaiBlue" },
    DiagnosticFloatingHint = { link = "MonokaiAqua" },
    DiagnosticVirtualTextError = { link = "MonokaiRed" },
    DiagnosticVirtualTextWarn = { link = "MonokaiYellow" },
    DiagnosticVirtualTextInfo = { link = "MonokaiBlue" },
    DiagnosticVirtualTextHint = { link = "MonokaiAqua" },
    LspReferenceRead = { link = "MonokaiYellowBold" },
    LspReferenceText = { link = "MonokaiYellowBold" },
    LspReferenceWrite = { link = "MonokaiOrangeBold" },
    LspCodeLens = { link = "MonokaiGray" },
    LspSignatureActiveParameter = { link = "Search" },

    -- nvim-treesitter
    -- See `nvim-treesitter/CONTRIBUTING.md`

    --
    -- Misc
    --
    -- @comment               ; line and block comments
    ["@comment"] = { link = "Comment" },
    -- @comment.documentation ; comments documenting code
    -- @none                  ; completely disable the highlight
    ["@none"] = { bg = "NONE", fg = "NONE" },
    -- @preproc               ; various preprocessor directives & shebangs
    ["@preproc"] = { link = "PreProc" },
    -- @define                ; preprocessor definition directives
    ["@define"] = { link = "Define" },
    -- @operator              ; symbolic operators (e.g. `+` / `*`)
    ["@operator"] = { link = "Operator" },

    --
    -- Punctuation
    --
    -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.bracket"] = { link = "Delimiter" },
    -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special"] = { link = "Delimiter" },

    --
    -- Literals
    --
    -- @string               ; string literals
    ["@string"] = { link = "String" },
    -- @string.documentation ; string documenting code (e.g. Python docstrings)
    -- @string.regex         ; regular expressions
    ["@string.regex"] = { link = "String" },
    -- @string.escape        ; escape sequences
    ["@string.escape"] = { link = "SpecialChar" },
    -- @string.special       ; other special strings (e.g. dates)
    ["@string.special"] = { link = "SpecialChar" },

    -- @character            ; character literals
    ["@character"] = { link = "Character" },
    -- @character.special    ; special characters (e.g. wildcards)
    ["@character.special"] = { link = "SpecialChar" },

    -- @boolean              ; boolean literals
    ["@boolean"] = { link = "Boolean" },
    -- @number               ; numeric literals
    ["@number"] = { link = "Number" },
    -- @float                ; floating-point number literals
    ["@float"] = { link = "Float" },

    --
    -- Functions
    --
    -- @function         ; function definitions
    ["@function"] = { link = "Function" },
    -- @function.builtin ; built-in functions
    ["@function.builtin"] = { link = "Special" },
    -- @function.call    ; function calls
    ["@function.call"] = { link = "Function" },
    -- @function.macro   ; preprocessor macros
    ["@function.macro"] = { link = "Macro" },

    -- @method           ; method definitions
    ["@method"] = { link = "Function" },
    -- @method.call      ; method calls
    ["@method.call"] = { link = "Function" },

    -- @constructor      ; constructor calls and definitions
    ["@constructor"] = { link = "Special" },
    -- @parameter        ; parameters of a function
    ["@parameter"] = { link = "Identifier" },

    --
    -- Keywords
    --
    -- @keyword             ; various keywords
    ["@keyword"] = { link = "Keyword" },
    -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    -- @keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.function"] = { link = "Keyword" },
    -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
    ["@keyword.operator"] = { link = "MonokaiRed" },
    -- @keyword.return      ; keywords like `return` and `yield`
    ["@keyword.return"] = { link = "Keyword" },

    -- @conditional         ; keywords related to conditionals (e.g. `if` / `else`)
    ["@conditional"] = { link = "Conditional" },
    -- @conditional.ternary ; ternary operator (e.g. `?` / `:`)

    -- @repeat              ; keywords related to loops (e.g. `for` / `while`)
    ["@repeat"] = { link = "Repeat" },
    -- @debug               ; keywords related to debugging
    ["@debug"] = { link = "Debug" },
    -- @label               ; GOTO and other labels (e.g. `label:` in C)
    ["@label"] = { link = "Label" },
    -- @include             ; keywords for including modules (e.g. `import` / `from` in Python)
    ["@include"] = { link = "Include" },
    -- @exception           ; keywords related to exceptions (e.g. `throw` / `catch`)
    ["@exception"] = { link = "Exception" },

    --
    -- Types
    --
    -- @type            ; type or class definitions and annotations
    ["@type"] = { link = "Type" },
    -- @type.builtin    ; built-in types
    ["@type.builtin"] = { link = "Type" },
    -- @type.definition ; type definitions (e.g. `typedef` in C)
    ["@type.definition"] = { link = "Typedef" },
    -- @type.qualifier  ; type qualifiers (e.g. `const`)
    ["@type.qualifier"] = { link = "Type" },

    -- @storageclass    ; modifiers that affect storage in memory or life-time
    ["@storageclass"] = { link = "StorageClass" },
    -- @attribute       ; attribute annotations (e.g. Python decorators)
    ["@attribute"] = { link = "PreProc" },
    -- @field           ; object and struct fields
    ["@field"] = { link = "Identifier" },
    -- @property        ; similar to `@field`
    ["@property"] = { link = "Identifier" },

    --
    -- Identifiers
    --
    -- @variable         ; various variable names
    ["@variable"] = { link = "MonokaiFg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },

    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },

    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "MonokaiFg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },

    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "MonokaiFg1" },
    -- @text.strong           ; bold text
    ["@text.strong"] = { bold = config.bold },
    -- @text.emphasis         ; text with emphasis
    ["@text.emphasis"] = { italic = config.italic.strings },
    -- @text.underline        ; underlined text
    ["@text.underline"] = { underline = config.underline },
    -- @text.strike           ; strikethrough text
    ["@text.strike"] = { strikethrough = config.strikethrough },
    -- @text.title            ; text that is part of a title
    ["@text.title"] = { link = "Title" },
    -- @text.literal          ; literal or verbatim text (e.g., inline code)
    ["@text.literal"] = { link = "String" },
    -- @text.quote            ; text quotations
    -- @text.uri              ; URIs (e.g. hyperlinks)
    ["@text.uri"] = { link = "Underlined" },
    -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
    ["@text.math"] = { link = "Special" },
    -- @text.environment      ; text environments of markup languages
    ["@text.environment"] = { link = "Macro" },
    -- @text.environment.name ; text indicating the type of an environment
    ["@text.environment.name"] = { link = "Type" },
    -- @text.reference        ; text references, footnotes, citations, etc.
    ["@text.reference"] = { link = "Constant" },

    -- @text.todo             ; todo notes
    ["@text.todo"] = { link = "Todo" },
    -- @text.note             ; info notes
    ["@text.note"] = { link = "SpecialComment" },
    -- @text.note.comment     ; XXX in comments
    ["@text.note.comment"] = { fg = colors.purple, bold = config.bold },
    -- @text.warning          ; warning notes
    ["@text.warning"] = { link = "WarningMsg" },
    -- @text.danger           ; danger/error notes
    ["@text.danger"] = { link = "ErrorMsg" },
    -- @text.danger.comment   ; FIXME in comments
    ["@text.danger.comment"] = { fg = colors.fg0, bg = colors.red, bold = config.bold },

    -- @text.diff.add         ; added text (for diff files)
    ["@text.diff.add"] = { link = "diffAdded" },
    -- @text.diff.delete      ; deleted text (for diff files)
    ["@text.diff.delete"] = { link = "diffRemoved" },

    --
    -- Tags
    --
    -- @tag           ; XML tag names
    ["@tag"] = { link = "Tag" },
    -- @tag.attribute ; XML tag attributes
    ["@tag.attribute"] = { link = "Identifier" },
    -- @tag.delimiter ; XML tag delimiters
    ["@tag.delimiter"] = { link = "Delimiter" },

    --
    -- Conceal
    --
    -- @conceal ; for captures that are only used for concealing

    --
    -- Spell
    --
    -- @spell   ; for defining regions to be spellchecked
    -- @nospell ; for defining regions that should NOT be spellchecked

    -- Treesitter
    -- See `:help treesitter`
    -- Those are not part of the nvim-treesitter
    ["@punctuation"] = { link = "Delimiter" },
    ["@macro"] = { link = "Macro" },
    ["@structure"] = { link = "Structure" },

    -- Semantic token
    -- See `:help lsp-semantic-highlight`
    ["@lsp.type.class"] = { link = "@constructor" },
    ["@lsp.type.comment"] = {}, -- do not overwrite comments
    ["@lsp.type.decorator"] = { link = "@parameter" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@constructor" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- gitcommit
    gitcommitSelectedFile = { link = "MonokaiGreen" },
    gitcommitDiscardedFile = { link = "MonokaiRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "MonokaiGreenSign" },
    GitSignsChange = { link = "MonokaiAquaSign" },
    GitSignsDelete = { link = "MonokaiRedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = colors.neutral_aqua },
    NvimTreeRootFolder = { fg = colors.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = colors.light2 },
    NvimTreeExecFile = { fg = colors.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = colors.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = colors.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.neutral_purple },
    NvimTreeIndentMarker = { fg = colors.dark3 },
    NvimTreeGitDirty = { fg = colors.neutral_yellow },
    NvimTreeGitStaged = { fg = colors.neutral_yellow },
    NvimTreeGitMerge = { fg = colors.neutral_purple },
    NvimTreeGitRenamed = { fg = colors.neutral_purple },
    NvimTreeGitNew = { fg = colors.neutral_yellow },
    NvimTreeGitDeleted = { fg = colors.neutral_red },
    NvimTreeWindowPicker = { bg = colors.faded_aqua },
    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = { link = "MonokaiRedSign" },
    -- vim-startify
    StartifyBracket = { link = "MonokaiFg3" },
    StartifyFile = { link = "MonokaiFg1" },
    StartifyNumber = { link = "MonokaiBlue" },
    StartifyPath = { link = "MonokaiGray" },
    StartifySlash = { link = "MonokaiGray" },
    StartifySection = { link = "MonokaiYellow" },
    StartifySpecial = { link = "MonokaiBg2" },
    StartifyHeader = { link = "MonokaiOrange" },
    StartifyFooter = { link = "MonokaiBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "MonokaiAqua" },
    DirvishArg = { link = "MonokaiYellow" },
    -- netrw
    netrwDir = { link = "MonokaiAqua" },
    netrwClassify = { link = "MonokaiAqua" },
    netrwLink = { link = "MonokaiGray" },
    netrwSymLink = { link = "MonokaiFg1" },
    netrwExe = { link = "MonokaiYellow" },
    netrwComment = { link = "MonokaiGray" },
    netrwList = { link = "MonokaiBlue" },
    netrwHelpCmd = { link = "MonokaiAqua" },
    netrwCmdSep = { link = "MonokaiFg3" },
    netrwVersion = { link = "MonokaiGreen" },
    -- nerdtree
    NERDTreeDir = { link = "MonokaiAqua" },
    NERDTreeDirSlash = { link = "MonokaiAqua" },
    NERDTreeOpenable = { link = "MonokaiOrange" },
    NERDTreeClosable = { link = "MonokaiOrange" },
    NERDTreeFile = { link = "MonokaiFg1" },
    NERDTreeExecFile = { link = "MonokaiYellow" },
    NERDTreeUp = { link = "MonokaiGray" },
    NERDTreeCWD = { link = "MonokaiGreen" },
    NERDTreeHelp = { link = "MonokaiFg1" },
    NERDTreeToggleOn = { link = "MonokaiGreen" },
    NERDTreeToggleOff = { link = "MonokaiRed" },
    -- coc.nvim
    CocErrorSign = { link = "MonokaiRedSign" },
    CocWarningSign = { link = "MonokaiOrangeSign" },
    CocInfoSign = { link = "MonokaiBlueSign" },
    CocHintSign = { link = "MonokaiAquaSign" },
    CocErrorFloat = { link = "MonokaiRed" },
    CocWarningFloat = { link = "MonokaiOrange" },
    CocInfoFloat = { link = "MonokaiBlue" },
    CocHintFloat = { link = "MonokaiAqua" },
    CocDiagnosticsError = { link = "MonokaiRed" },
    CocDiagnosticsWarning = { link = "MonokaiOrange" },
    CocDiagnosticsInfo = { link = "MonokaiBlue" },
    CocDiagnosticsHint = { link = "MonokaiAqua" },
    CocSelectedText = { link = "MonokaiRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "MonokaiGray" },
    CocErrorHighlight = { link = "MonokaiRedUnderline" },
    CocWarningHighlight = { link = "MonokaiOrangeUnderline" },
    CocInfoHighlight = { link = "MonokaiBlueUnderline" },
    CocHintHighlight = { link = "MonokaiAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "MonokaiFg1" },
    TelescopeSelection = { link = "MonokaiOrangeBold" },
    TelescopeSelectionCaret = { link = "MonokaiRed" },
    TelescopeMultiSelection = { link = "MonokaiGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "MonokaiBlue" },
    TelescopePromptPrefix = { link = "MonokaiRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "MonokaiFg0" },
    CmpItemAbbrDeprecated = { link = "MonokaiFg1" },
    CmpItemAbbrMatch = { link = "MonokaiBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "MonokaiBlueUnderline" },
    CmpItemMenu = { link = "MonokaiGray" },
    CmpItemKindText = { link = "MonokaiOrange" },
    CmpItemKindVariable = { link = "MonokaiOrange" },
    CmpItemKindMethod = { link = "MonokaiBlue" },
    CmpItemKindFunction = { link = "MonokaiBlue" },
    CmpItemKindConstructor = { link = "MonokaiYellow" },
    CmpItemKindUnit = { link = "MonokaiBlue" },
    CmpItemKindField = { link = "MonokaiBlue" },
    CmpItemKindClass = { link = "MonokaiYellow" },
    CmpItemKindInterface = { link = "MonokaiYellow" },
    CmpItemKindModule = { link = "MonokaiBlue" },
    CmpItemKindProperty = { link = "MonokaiBlue" },
    CmpItemKindValue = { link = "MonokaiOrange" },
    CmpItemKindEnum = { link = "MonokaiYellow" },
    CmpItemKindOperator = { link = "MonokaiYellow" },
    CmpItemKindKeyword = { link = "MonokaiPurple" },
    CmpItemKindEvent = { link = "MonokaiPurple" },
    CmpItemKindReference = { link = "MonokaiPurple" },
    CmpItemKindColor = { link = "MonokaiPurple" },
    CmpItemKindSnippet = { link = "MonokaiGreen" },
    CmpItemKindFile = { link = "MonokaiBlue" },
    CmpItemKindFolder = { link = "MonokaiBlue" },
    CmpItemKindEnumMember = { link = "MonokaiAqua" },
    CmpItemKindConstant = { link = "MonokaiOrange" },
    CmpItemKindStruct = { link = "MonokaiYellow" },
    CmpItemKindTypeParameter = { link = "MonokaiYellow" },
    diffAdded = { link = "MonokaiGreen" },
    diffRemoved = { link = "MonokaiRed" },
    diffChanged = { link = "MonokaiAqua" },
    diffFile = { link = "MonokaiOrange" },
    diffNewFile = { link = "MonokaiYellow" },
    diffOldFile = { link = "MonokaiOrange" },
    diffLine = { link = "MonokaiBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "MonokaiBlue" },
    NavicIconsModule = { link = "MonokaiOrange" },
    NavicIconsNamespace = { link = "MonokaiBlue" },
    NavicIconsPackage = { link = "MonokaiAqua" },
    NavicIconsClass = { link = "MonokaiYellow" },
    NavicIconsMethod = { link = "MonokaiBlue" },
    NavicIconsProperty = { link = "MonokaiAqua" },
    NavicIconsField = { link = "MonokaiPurple" },
    NavicIconsConstructor = { link = "MonokaiBlue" },
    NavicIconsEnum = { link = "MonokaiPurple" },
    NavicIconsInterface = { link = "MonokaiGreen" },
    NavicIconsFunction = { link = "MonokaiBlue" },
    NavicIconsVariable = { link = "MonokaiPurple" },
    NavicIconsConstant = { link = "MonokaiOrange" },
    NavicIconsString = { link = "MonokaiGreen" },
    NavicIconsNumber = { link = "MonokaiOrange" },
    NavicIconsBoolean = { link = "MonokaiOrange" },
    NavicIconsArray = { link = "MonokaiOrange" },
    NavicIconsObject = { link = "MonokaiOrange" },
    NavicIconsKey = { link = "MonokaiAqua" },
    NavicIconsNull = { link = "MonokaiOrange" },
    NavicIconsEnumMember = { link = "MonokaiYellow" },
    NavicIconsStruct = { link = "MonokaiPurple" },
    NavicIconsEvent = { link = "MonokaiYellow" },
    NavicIconsOperator = { link = "MonokaiRed" },
    NavicIconsTypeParameter = { link = "MonokaiRed" },
    NavicText = { link = "MonokaiWhite" },
    NavicSeparator = { link = "MonokaiWhite" },
    -- html
    htmlTag = { link = "MonokaiAquaBold" },
    htmlEndTag = { link = "MonokaiAquaBold" },
    htmlTagName = { link = "MonokaiBlue" },
    htmlArg = { link = "MonokaiOrange" },
    htmlTagN = { link = "MonokaiFg1" },
    htmlSpecialTagName = { link = "MonokaiBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "MonokaiRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, italic = true },
    -- xml
    xmlTag = { link = "MonokaiAquaBold" },
    xmlEndTag = { link = "MonokaiAquaBold" },
    xmlTagName = { link = "MonokaiBlue" },
    xmlEqual = { link = "MonokaiBlue" },
    docbkKeyword = { link = "MonokaiAquaBold" },
    xmlDocTypeDecl = { link = "MonokaiGray" },
    xmlDocTypeKeyword = { link = "MonokaiPurple" },
    xmlCdataStart = { link = "MonokaiGray" },
    xmlCdataCdata = { link = "MonokaiPurple" },
    dtdFunction = { link = "MonokaiGray" },
    dtdTagName = { link = "MonokaiPurple" },
    xmlAttrib = { link = "MonokaiOrange" },
    xmlProcessingDelim = { link = "MonokaiGray" },
    dtdParamEntityPunct = { link = "MonokaiGray" },
    dtdParamEntityDPunct = { link = "MonokaiGray" },
    xmlAttribPunct = { link = "MonokaiGray" },
    xmlEntity = { link = "MonokaiRed" },
    xmlEntityPunct = { link = "MonokaiRed" },
    -- clojure
    clojureKeyword = { link = "MonokaiBlue" },
    clojureCond = { link = "MonokaiOrange" },
    clojureSpecial = { link = "MonokaiOrange" },
    clojureDefine = { link = "MonokaiOrange" },
    clojureFunc = { link = "MonokaiYellow" },
    clojureRepeat = { link = "MonokaiYellow" },
    clojureCharacter = { link = "MonokaiAqua" },
    clojureStringEscape = { link = "MonokaiAqua" },
    clojureException = { link = "MonokaiRed" },
    clojureRegexp = { link = "MonokaiAqua" },
    clojureRegexpEscape = { link = "MonokaiAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "MonokaiFg3" },
    clojureAnonArg = { link = "MonokaiYellow" },
    clojureVariable = { link = "MonokaiBlue" },
    clojureMacro = { link = "MonokaiOrange" },
    clojureMeta = { link = "MonokaiYellow" },
    clojureDeref = { link = "MonokaiYellow" },
    clojureQuote = { link = "MonokaiYellow" },
    clojureUnquote = { link = "MonokaiYellow" },
    -- C
    cOperator = { link = "MonokaiPurple" },
    cppOperator = { link = "MonokaiPurple" },
    cStructure = { link = "MonokaiOrange" },
    -- python
    pythonBuiltin = { link = "MonokaiOrange" },
    pythonBuiltinObj = { link = "MonokaiOrange" },
    pythonBuiltinFunc = { link = "MonokaiOrange" },
    pythonFunction = { link = "MonokaiAqua" },
    pythonDecorator = { link = "MonokaiRed" },
    pythonInclude = { link = "MonokaiBlue" },
    pythonImport = { link = "MonokaiBlue" },
    pythonRun = { link = "MonokaiBlue" },
    pythonCoding = { link = "MonokaiBlue" },
    pythonOperator = { link = "MonokaiRed" },
    pythonException = { link = "MonokaiRed" },
    pythonExceptions = { link = "MonokaiPurple" },
    pythonBoolean = { link = "MonokaiPurple" },
    pythonDot = { link = "MonokaiFg3" },
    pythonConditional = { link = "MonokaiRed" },
    pythonRepeat = { link = "MonokaiRed" },
    pythonDottedName = { link = "MonokaiGreenBold" },
    -- CSS
    cssBraces = { link = "MonokaiBlue" },
    cssFunctionName = { link = "MonokaiYellow" },
    cssIdentifier = { link = "MonokaiOrange" },
    cssClassName = { link = "MonokaiGreen" },
    cssColor = { link = "MonokaiBlue" },
    cssSelectorOp = { link = "MonokaiBlue" },
    cssSelectorOp2 = { link = "MonokaiBlue" },
    cssImportant = { link = "MonokaiGreen" },
    cssVendor = { link = "MonokaiFg1" },
    cssTextProp = { link = "MonokaiAqua" },
    cssAnimationProp = { link = "MonokaiAqua" },
    cssUIProp = { link = "MonokaiYellow" },
    cssTransformProp = { link = "MonokaiAqua" },
    cssTransitionProp = { link = "MonokaiAqua" },
    cssPrintProp = { link = "MonokaiAqua" },
    cssPositioningProp = { link = "MonokaiYellow" },
    cssBoxProp = { link = "MonokaiAqua" },
    cssFontDescriptorProp = { link = "MonokaiAqua" },
    cssFlexibleBoxProp = { link = "MonokaiAqua" },
    cssBorderOutlineProp = { link = "MonokaiAqua" },
    cssBackgroundProp = { link = "MonokaiAqua" },
    cssMarginProp = { link = "MonokaiAqua" },
    cssListProp = { link = "MonokaiAqua" },
    cssTableProp = { link = "MonokaiAqua" },
    cssFontProp = { link = "MonokaiAqua" },
    cssPaddingProp = { link = "MonokaiAqua" },
    cssDimensionProp = { link = "MonokaiAqua" },
    cssRenderProp = { link = "MonokaiAqua" },
    cssColorProp = { link = "MonokaiAqua" },
    cssGeneratedContentProp = { link = "MonokaiAqua" },
    -- javascript
    javaScriptBraces = { link = "MonokaiFg1" },
    javaScriptFunction = { link = "MonokaiAqua" },
    javaScriptIdentifier = { link = "MonokaiRed" },
    javaScriptMember = { link = "MonokaiBlue" },
    javaScriptNumber = { link = "MonokaiPurple" },
    javaScriptNull = { link = "MonokaiPurple" },
    javaScriptParens = { link = "MonokaiFg3" },
    -- typescript
    typescriptReserved = { link = "MonokaiAqua" },
    typescriptLabel = { link = "MonokaiAqua" },
    typescriptFuncKeyword = { link = "MonokaiAqua" },
    typescriptIdentifier = { link = "MonokaiOrange" },
    typescriptBraces = { link = "MonokaiFg1" },
    typescriptEndColons = { link = "MonokaiFg1" },
    typescriptDOMObjects = { link = "MonokaiFg1" },
    typescriptAjaxMethods = { link = "MonokaiFg1" },
    typescriptLogicSymbols = { link = "MonokaiFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "MonokaiFg1" },
    typescriptParens = { link = "MonokaiFg3" },
    typescriptOpSymbols = { link = "MonokaiFg3" },
    typescriptHtmlElemProperties = { link = "MonokaiFg1" },
    typescriptNull = { link = "MonokaiPurple" },
    typescriptInterpolationDelimiter = { link = "MonokaiAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "MonokaiAqua" },
    purescriptModuleName = { link = "MonokaiFg1" },
    purescriptWhere = { link = "MonokaiAqua" },
    purescriptDelimiter = { link = "MonokaiFg4" },
    purescriptType = { link = "MonokaiFg1" },
    purescriptImportKeyword = { link = "MonokaiAqua" },
    purescriptHidingKeyword = { link = "MonokaiAqua" },
    purescriptAsKeyword = { link = "MonokaiAqua" },
    purescriptStructure = { link = "MonokaiAqua" },
    purescriptOperator = { link = "MonokaiBlue" },
    purescriptTypeVar = { link = "MonokaiFg1" },
    purescriptConstructor = { link = "MonokaiFg1" },
    purescriptFunction = { link = "MonokaiFg1" },
    purescriptConditional = { link = "MonokaiOrange" },
    purescriptBacktick = { link = "MonokaiOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "MonokaiFg3" },
    coffeeSpecialOp = { link = "MonokaiFg3" },
    coffeeCurly = { link = "MonokaiOrange" },
    coffeeParen = { link = "MonokaiFg3" },
    coffeeBracket = { link = "MonokaiOrange" },
    -- ruby
    rubyStringDelimiter = { link = "MonokaiGreen" },
    rubyInterpolationDelimiter = { link = "MonokaiAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "MonokaiRed" },
    objcDirective = { link = "MonokaiBlue" },
    -- go
    goDirective = { link = "MonokaiAqua" },
    goConstants = { link = "MonokaiPurple" },
    goDeclaration = { link = "MonokaiRed" },
    goDeclType = { link = "MonokaiBlue" },
    goBuiltins = { link = "MonokaiOrange" },
    -- lua
    luaIn = { link = "MonokaiRed" },
    luaFunction = { link = "MonokaiAqua" },
    luaTable = { link = "MonokaiOrange" },
    -- moonscript
    moonSpecialOp = { link = "MonokaiFg3" },
    moonExtendedOp = { link = "MonokaiFg3" },
    moonFunction = { link = "MonokaiFg3" },
    moonObject = { link = "MonokaiYellow" },
    -- java
    javaAnnotation = { link = "MonokaiBlue" },
    javaDocTags = { link = "MonokaiAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "MonokaiFg3" },
    javaParen1 = { link = "MonokaiFg3" },
    javaParen2 = { link = "MonokaiFg3" },
    javaParen3 = { link = "MonokaiFg3" },
    javaParen4 = { link = "MonokaiFg3" },
    javaParen5 = { link = "MonokaiFg3" },
    javaOperator = { link = "MonokaiOrange" },
    javaVarArg = { link = "MonokaiGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "MonokaiGreen" },
    elixirInterpolationDelimiter = { link = "MonokaiAqua" },
    elixirModuleDeclaration = { link = "MonokaiYellow" },
    -- scala
    scalaNameDefinition = { link = "MonokaiFg1" },
    scalaCaseFollowing = { link = "MonokaiFg1" },
    scalaCapitalWord = { link = "MonokaiFg1" },
    scalaTypeExtension = { link = "MonokaiFg1" },
    scalaKeyword = { link = "MonokaiRed" },
    scalaKeywordModifier = { link = "MonokaiRed" },
    scalaSpecial = { link = "MonokaiAqua" },
    scalaOperator = { link = "MonokaiFg1" },
    scalaTypeDeclaration = { link = "MonokaiYellow" },
    scalaTypeTypePostDeclaration = { link = "MonokaiYellow" },
    scalaInstanceDeclaration = { link = "MonokaiFg1" },
    scalaInterpolation = { link = "MonokaiAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "MonokaiGreenBold" },
    markdownH2 = { link = "MonokaiGreenBold" },
    markdownH3 = { link = "MonokaiYellowBold" },
    markdownH4 = { link = "MonokaiYellowBold" },
    markdownH5 = { link = "MonokaiYellow" },
    markdownH6 = { link = "MonokaiYellow" },
    markdownCode = { link = "MonokaiAqua" },
    markdownCodeBlock = { link = "MonokaiAqua" },
    markdownCodeDelimiter = { link = "MonokaiAqua" },
    markdownBlockquote = { link = "MonokaiGray" },
    markdownListMarker = { link = "MonokaiGray" },
    markdownOrderedListMarker = { link = "MonokaiGray" },
    markdownRule = { link = "MonokaiGray" },
    markdownHeadingRule = { link = "MonokaiGray" },
    markdownUrlDelimiter = { link = "MonokaiFg3" },
    markdownLinkDelimiter = { link = "MonokaiFg3" },
    markdownLinkTextDelimiter = { link = "MonokaiFg3" },
    markdownHeadingDelimiter = { link = "MonokaiOrange" },
    markdownUrl = { link = "MonokaiPurple" },
    markdownUrlTitleDelimiter = { link = "MonokaiGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "MonokaiBlue" },
    haskellIdentifier = { link = "MonokaiAqua" },
    haskellSeparator = { link = "MonokaiFg4" },
    haskellDelimiter = { link = "MonokaiOrange" },
    haskellOperators = { link = "MonokaiPurple" },
    haskellBacktick = { link = "MonokaiOrange" },
    haskellStatement = { link = "MonokaiPurple" },
    haskellConditional = { link = "MonokaiPurple" },
    haskellLet = { link = "MonokaiRed" },
    haskellDefault = { link = "MonokaiRed" },
    haskellWhere = { link = "MonokaiRed" },
    haskellBottom = { link = "MonokaiRedBold" },
    haskellImportKeywords = { link = "MonokaiPurpleBold" },
    haskellDeclKeyword = { link = "MonokaiOrange" },
    haskellDecl = { link = "MonokaiOrange" },
    haskellDeriving = { link = "MonokaiPurple" },
    haskellAssocType = { link = "MonokaiAqua" },
    haskellNumber = { link = "MonokaiAqua" },
    haskellPragma = { link = "MonokaiRedBold" },
    haskellTH = { link = "MonokaiAquaBold" },
    haskellForeignKeywords = { link = "MonokaiGreen" },
    haskellKeyword = { link = "MonokaiRed" },
    haskellFloat = { link = "MonokaiAqua" },
    haskellInfix = { link = "MonokaiPurple" },
    haskellQuote = { link = "MonokaiGreenBold" },
    haskellShebang = { link = "MonokaiYellowBold" },
    haskellLiquid = { link = "MonokaiPurpleBold" },
    haskellQuasiQuoted = { link = "MonokaiBlueBold" },
    haskellRecursiveDo = { link = "MonokaiPurple" },
    haskellQuotedType = { link = "MonokaiRed" },
    haskellPreProc = { link = "MonokaiFg4" },
    haskellTypeRoles = { link = "MonokaiRedBold" },
    haskellTypeForall = { link = "MonokaiRed" },
    haskellPatternKeyword = { link = "MonokaiBlue" },
    -- json
    jsonKeyword = { link = "MonokaiGreen" },
    jsonQuote = { link = "MonokaiGreen" },
    jsonBraces = { link = "MonokaiFg1" },
    jsonString = { link = "MonokaiFg1" },
    -- mail
    mailQuoted1 = { link = "MonokaiAqua" },
    mailQuoted2 = { link = "MonokaiPurple" },
    mailQuoted3 = { link = "MonokaiYellow" },
    mailQuoted4 = { link = "MonokaiGreen" },
    mailQuoted5 = { link = "MonokaiRed" },
    mailQuoted6 = { link = "MonokaiOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "MonokaiFg1" },
    csEndColon = { link = "MonokaiFg1" },
    csLogicSymbols = { link = "MonokaiFg1" },
    csParens = { link = "MonokaiFg3" },
    csOpSymbols = { link = "MonokaiFg3" },
    csInterpolationDelimiter = { link = "MonokaiFg3" },
    csInterpolationAlignDel = { link = "MonokaiAquaBold" },
    csInterpolationFormat = { link = "MonokaiAqua" },
    csInterpolationFormatDel = { link = "MonokaiAquaBold" },
    -- rust btw
    rustSigil = { link = "MonokaiOrange" },
    rustEscape = { link = "MonokaiAqua" },
    rustStringContinuation = { link = "MonokaiAqua" },
    rustEnum = { link = "MonokaiAqua" },
    rustStructure = { link = "MonokaiAqua" },
    rustModPathSep = { link = "MonokaiFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "MonokaiAqua" },
    -- ocaml
    ocamlOperator = { link = "MonokaiFg1" },
    ocamlKeyChar = { link = "MonokaiOrange" },
    ocamlArrow = { link = "MonokaiOrange" },
    ocamlInfixOpKeyword = { link = "MonokaiRed" },
    ocamlConstructor = { link = "MonokaiOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "MonokaiFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "MonokaiFg1" },
    LspSagaAutoPreview = { link = "MonokaiOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "MonokaiAqua" },
    LspSagaDefPreviewBorder = { link = "MonokaiBlue" },
    LspSagaHoverBorder = { link = "MonokaiOrange" },
    LspSagaRenameBorder = { link = "MonokaiBlue" },
    LspSagaDiagnosticSource = { link = "MonokaiOrange" },
    LspSagaDiagnosticBorder = { link = "MonokaiPurple" },
    LspSagaDiagnosticHeader = { link = "MonokaiGreen" },
    LspSagaSignatureHelpBorder = { link = "MonokaiGreen" },
    SagaShadow = { link = "MonokaiBg0" },

    -- dashboard-nvim
    DashboardShortCut = { link = "MonokaiOrange" },
    DashboardHeader = { link = "MonokaiAqua" },
    DashboardCenter = { link = "MonokaiYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "MonokaiAqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "MonokaiFg1" },
    CarbonExe = { link = "MonokaiYellow" },
    CarbonSymlink = { link = "MonokaiAqua" },
    CarbonBrokenSymlink = { link = "MonokaiRed" },
    CarbonIndicator = { link = "MonokaiGray" },
    CarbonDanger = { link = "MonokaiRed" },
    CarbonPending = { link = "MonokaiYellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "MonokaiBlue" },
    NotifyDEBUGIcon = { link = "MonokaiBlue" },
    NotifyDEBUGTitle = { link = "MonokaiBlue" },
    NotifyERRORBorder = { link = "MonokaiRed" },
    NotifyERRORIcon = { link = "MonokaiRed" },
    NotifyERRORTitle = { link = "MonokaiRed" },
    NotifyINFOBorder = { link = "MonokaiAqua" },
    NotifyINFOIcon = { link = "MonokaiAqua" },
    NotifyINFOTitle = { link = "MonokaiAqua" },
    NotifyTRACEBorder = { link = "MonokaiGreen" },
    NotifyTRACEIcon = { link = "MonokaiGreen" },
    NotifyTRACETitle = { link = "MonokaiGreen" },
    NotifyWARNBorder = { link = "MonokaiYellow" },
    NotifyWARNIcon = { link = "MonokaiYellow" },
    NotifyWARNTitle = { link = "MonokaiYellow" },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = colors.red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.blue },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.cyan },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
