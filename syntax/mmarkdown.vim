" Vim Syntax File
" Language:	M-Markdown
" Filenames:	*.mmarkdown, *.mmd, *.markdown, *.md, *.txt
" Maintainer:	Matþew T. Scarbrough <matthewtatescarbrough@tutanota.com>
" Last Change:	2020 Mar 15
" Version:	0.04c
" Note:		Though this file is written from scratch, many lines may
" 		be takenfrom the $VIMRUNTIME/syntax/markdown.vim file.

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
"                 _    _        _    _    ___    ____    _   _   ____    _____   _    _   _   _                 "
"                | \  / |      | \  / |  / _ \  |  _ \  | | / / |  _ \  /  _  \ | |  | | | \ | |                "
"                |  \/  |  __  |  \/  | | |_| | | |_) ) | |/ /  | | \ \ | | | | | |/\| | |  \| |                "
"                | \  / | |__| | \  / | |  _  | |    /  |   (   | | | | | | | | | /  \ | | \ \ |                "
"                | |\/| |      | |\/| | | | | | | |\ \  | |\ \  | |_/ / | |_| | |  /\  | | |\  |                "
"                |_|  |_|      |_|  |_| |_| |_| |_| \_\ |_| \_\ |____/  \_____/ |_/  \_| |_| \_|                "
"                                                                                                               "
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "

" ===PREAMBLE===

if exists("b:current_syntax")
	finish
endif

if !exists('main_syntax')
	let main_syntax = 'mmarkdown'
endif


" ===KEYWORDS===

	" GENERAL
	" Note, the author is intended to be a penname or username
	" Type intends for ‘screenplay,’ ‘book,’ ‘notes,’ etc.
	" ‘draftdate’ and ‘date’ are pseudonyms
	" ‘type’, ‘documenttype’, and ‘document’ are interchangeable
	syn keyword mmdMetaTagsGeneral title subtitle credit author date copyright draftdate version ver type documenttype document nextgroup=mmdFormatMetaData skipwhite contained

		" Author Info
		syn keyword mmdMetaTagsAuthor name addr phone email web                                                             nextgroup=mmdFormatMetaData skipwhite contained

		" Agent Info
		syn keyword mmdMetaTagsAgent agentname agentaddr agentphone agentemail org organization organisation orgweb         nextgroup=mmdFormatMetaData skipwhite contained

	" Document Settings
	syn keyword mmdMetaTagsPaper paper margins tmargin lmargin bmargin rmargin topmargin leftmargin bottommargin rightmargin    nextgroup=mmdFormatMetaData skipwhite contained

	" The cluster...
	syn cluster mmdMetaDataParams contains=mmdMetaTagsGeneral,mmdMetaTagsAuthor,mmdMetaTagsAgent,mmdMetaTagsPaper
 

" ===ENTRANCE===

" IDK what this is
syn case ignore

" It seemed like a good idea to borrow these from Pope's file
syn match mmdValid '[<>]\c[a-z/$!]\@!'
syn match mmdValid '&\%(#\=\w*;\)\@!'

" Leave unformatted till further notice
"""""""""syn match mmdLineStart "^[<@]\@!" nextgroup=@mmdEntrnance

	syn cluster mmdBlocks     contains=@mmdHeaders,@mmdHeadersNouline,mmdBlockCode,mmdBlockQuote,mmdBlockList,mmdBlockListNumbered,mmdFormatRules
	syn cluster mmdInline     contains=mmdInlineCode,mmdInlineItalics,mmdInlineBold,mmdInlineUnderline,mmdInlineStrikethrough
	syn cluster mmdFormatting contains=@mmdFormatColours,mmdFormatCode,mmdFormatComment,mmdFormatItalics,mmdFormatBold,mmdFormatUnderline,mmdFormatStrikethrough,mmdFormatItalicsBold,mmdFormatItalicsUnderline,mmdFormatItalicsStrike,mmdFormatBoldUnderline,mmdFormatBoldStrike,mmdFormatUnderlineStrike,mmdFormatAll,mmdFormatItalicsUnderlineStrike,mmdFormatBoldUnderlineStrike,mmdFormatAllPlus,mmdFormatEscape

	syn cluster mmdHeaders        contains=mmdFormatH1,mmdFormatH2,mmdFormatH3,mmdFormatH4,mmdFormatH5,mmdFormatH6
	syn cluster mmdHeadersNouline contains=mmdFormatH1Nouline,mmdFormatH2Nouline,mmdFormatH3Nouline,mmdFormatH4Nouline,mmdFormatH5Nouline,mmdFormatH6Nouline
	syn cluster mmdFormatColours  contains=mmdFormatColourBlack,mmdFormatColourBlue,mmdFormatColourBrown,mmdFormatColourLightGrey,mmdFormatColourGreen,mmdFormatColourCyan,mmdFormatColourRed,mmdFormatColourMagenta,mmdFormatColourYellow,mmdFormatColourWhite,mmdFormatColourHiBlack,mmdFormatColourHiBlue,mmdFormatColourHiBrown,mmdFormatColourHiLightGrey,mmdFormatColourHiGreen,mmdFormatColourHiCyan,mmdFormatColourHiRed,mmdFormatColourHiMagenta,mmdFormatColourHiYellow,mmdFormatColourHiWhite


" ===HEADERS===

	" New-Fashioned
	syn match mmdFormatH1nouline "^.\+\n=\+$"
	syn match mmdFormatH1nouline "^.\+\n\s\+=\+$"
	syn match mmdFormatH2nouline "^.\+\n-\+$"
	syn match mmdFormatH2nouline "^.\+\n\s\+-\+$"
	syn match mmdFormatH3nouline "^.\+\n\~\+$"
	syn match mmdFormatH3nouline "^.\+\n\s\+\~\+$"

		" New-Fashioned 2
		syn match mmdFormatH3nouline "^#.\+\n-\+$"
		syn match mmdFormatH3nouline "^#.\+\n\s\+-\+$"
		syn match mmdFormatH4nouline "^##.\+\n-\+$"
		syn match mmdFormatH4nouline "^##.\+\n\s\+-\+$"
		syn match mmdFormatH5nouline "^###.\+\n-\+$"
		syn match mmdFormatH5nouline "^###.\+\n\s\+-\+$"
		syn match mmdFormatH6nouline "^####.\+\n-\+$"
		syn match mmdFormatH6nouline "^####.\+\n\s\+-\+$"

		" New-Fashioned 3 (Redundant redundancy)
		syn match mmdFormatH4nouline "^#.\+\n\~\+$"
		syn match mmdFormatH4nouline "^#.\+\n\s\+\~\+$"
		syn match mmdFormatH5nouline "^##.\+\n\~\+$"
		syn match mmdFormatH5nouline "^##.\+\n\s\+\~\+$"
		syn match mmdFormatH6nouline "^###.\+\n\~\+$"
		syn match mmdFormatH6nouline "^###.\+\n\s\+\~\+$"

	" Old-Fashioned
	syn region mmdFormatH1 matchgroup=mmdHeadingDelimiter start="##\@!"          end="#*\s*$"     keepend oneline
	syn region mmdFormatH2 matchgroup=mmdHeadingDelimiter start="###\@!"         end="#*\s*$"     keepend oneline
	syn region mmdFormatH3 matchgroup=mmdHeadingDelimiter start="####\@!"        end="#*\s*$"     keepend oneline
	syn region mmdFormatH4 matchgroup=mmdHeadingDelimiter start="#####\@!"       end="#*\s*$"     keepend oneline
	syn region mmdFormatH5 matchgroup=mmdHeadingDelimiter start="######\@!"      end="#*\s*$"     keepend oneline
	syn region mmdFormatH6 matchgroup=mmdHeadingDelimiter start="#######\@!"     end="#*\s*$"     keepend oneline


" ===FORMATTING===

	" Escape Sequences
	syn match mmdFormatEscape "\\[][\\`*_{}()<>#+.!-~%]"
	syn match mmdFormatEscape "\\r\|\\n\|\\t"

	" Colours
	" TODO: add a customisable colouring system & more streamlined
	
		" Foreground
		syn region mmdFormatColourBlack     matchgroup=mmdColoursDelimiter start=+\\black"\|\\black{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourBlue      matchgroup=mmdColoursDelimiter start=+\\blue"\|\\blue{+                   matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourBrown     matchgroup=mmdColoursDelimiter start=+\\brown"\|\\brown{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourGreen     matchgroup=mmdColoursDelimiter start=+\\green"\|\\green{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourCyan      matchgroup=mmdColoursDelimiter start=+\\cyan"\|\\cyan{+                   matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourRed       matchgroup=mmdColoursDelimiter start=+\\red"\|\\red{+                     matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourMagenta   matchgroup=mmdColoursDelimiter start=+\\magenta"\|\\magenta{+             matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourYellow    matchgroup=mmdColoursDelimiter start=+\\yellow"\|\\yellow{+               matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourWhite     matchgroup=mmdColoursDelimiter start=+\\white"\|\\white{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourLightGrey matchgroup=mmdColoursDelimiter start=+\\grey"\|\\grey{\|\\gray"\|\\gray{+ matchgroup=mmdColoursDelimiter end=+"\|}+

		" Background (highlighting)
		syn region mmdFormatColourHiBlack     matchgroup=mmdColoursDelimiter start=+\\hiblack"\|\\hiblack{+                     matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiBlue      matchgroup=mmdColoursDelimiter start=+\\hiblue"\|\\hiblue{+                   matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiBrown     matchgroup=mmdColoursDelimiter start=+\\hibrown"\|\\hibrown{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiGreen     matchgroup=mmdColoursDelimiter start=+\\higreen"\|\\higreen{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiCyan      matchgroup=mmdColoursDelimiter start=+\\hicyan"\|\\hicyan{+                   matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiRed       matchgroup=mmdColoursDelimiter start=+\\hired"\|\\hired{+                     matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiMagenta   matchgroup=mmdColoursDelimiter start=+\\himagenta"\|\\himagenta{+             matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiYellow    matchgroup=mmdColoursDelimiter start=+\\hiyellow"\|\\hiyellow{+               matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiWhite     matchgroup=mmdColoursDelimiter start=+\\hiwhite"\|\\hiwhite{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiLightGrey matchgroup=mmdColoursDelimiter start=+\\higrey"\|\\higrey{\|\\higray"\|\\higray{+ matchgroup=mmdColoursDelimiter end=+"\|}+

	" Comments
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="/\*"           matchgroup=mmdCommentDelimiter   end="\*/"  keepend
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="//"            matchgroup=mmdCommentDelimiter   end="\s*$" keepend
	""""""""syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="%"             matchgroup=mmdCommentDelimiter   end="\s*$" keepend

	" Meta Data Pre Proc
	syn match mmdFormatMetaProc "^//"  nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaProc "^%%"  nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaProc "^%"   nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaData ".\+$" contained contains=mmdFormatComment

	" Code
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="^\s\s\s\s\|^\t"     matchgroup=mmdFaceDelimiter    end="\s*$" keepend   contains=@mmdInline
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="`"                matchgroup=mmdFaceDelimiter      end="`"    keepend   contains=@mmdInline

	" Font Faces

		" Italics
		syn region mmdFormatItalics       matchgroup=mmdFaceDelimiter start="\S\@<=\*\|\*\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\*\|\*\S\@="     keepend contains=@mmdInline

		" Bold
		syn region mmdFormatBold          matchgroup=mmdFaceDelimiter start="\S\@<=\*\*\|\*\*\S\@=" matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=@mmdInline

		" Underline
		syn region mmdFormatUnderline     matchgroup=mmdFaceDelimiter start="\S\@<=_\|_\S\@="       matchgroup=mmdFaceDelimiter end="\S\@<=_\|_\S\@="       keepend contains=@mmdInline

		" Strikethrough
		syn region mmdFormatStrikethrough matchgroup=mmdFaceDelimiter start="\S\@<=\~\|\~\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\~\|\~\S\@="     keepend contains=@mmdInline

		" Permutations
		"""" Due to how Vim works, this is the only Order they will
		"""" work in, that I care to test, after the previous and these
		
		syn region mmdFormatItalicsBold            matchgroup=mmdFaceDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@="       matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\*\|\*\*\*\S\@="       keepend
		syn region mmdFormatItalicsUnderline       matchgroup=mmdFaceDelimiter start="\S\@<=_\*\|_\*\S\@="             matchgroup=mmdFaceDelimiter end="\S\@<=\*_\|\*_\S\@="             keepend
		syn region mmdFormatItalicsStrike          matchgroup=mmdFaceDelimiter start="\S\@<=\~\*\|\~\*\S\@="           matchgroup=mmdFaceDelimiter end="\S\@<=\*\~\|\*\~\S\@="           keepend
		syn region mmdFormatBoldUnderline          matchgroup=mmdFaceDelimiter start="\S\@<=_\*\*\|_\*\*\S\@="         matchgroup=mmdFaceDelimiter end="\S\@<=\*\*_\|\*\*_\S\@="         keepend
		syn region mmdFormatBoldStrike             matchgroup=mmdFaceDelimiter start="\S\@<=\~\*\*\|\~\*\*\S\@="       matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\~\|\*\*\~\S\@="       keepend
		syn region mmdFormatUnderlineStrike        matchgroup=mmdFaceDelimiter start="\S\@<=_\~\|_\~\S\@="             matchgroup=mmdFaceDelimiter end="\S\@<=\~_\|\~_\S\@="             keepend
		syn region mmdFormatAll                    matchgroup=mmdFaceDelimiter start="\S\@<=_\*\*\*\|_\*\*\*\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\*_\|\*\*\*_\S\@="     keepend
		syn region mmdFormatItalicsUnderlineStrike matchgroup=mmdFaceDelimiter start="\S\@<=_\~\*\|_\~\*\S\@="         matchgroup=mmdFaceDelimiter end="\S\@<=\*\~_\|\*\~_\S\@="         keepend
		syn region mmdFormatBoldUnderlineStrike    matchgroup=mmdFaceDelimiter start="\S\@<=_\~\*\*\|_\~\*\*\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\~_\|\*\*\~_\S\@="     keepend
		syn region mmdFormatAllPlus                matchgroup=mmdFaceDelimiter start="\S\@<=_\~\*\*\*\|_\~\*\*\*\S\@=" matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\*\~_\|\*\*\*\~_\S\@=" keepend

		" Inline Formatting
		" NOTE: Formatting that is meant for certain cirumstances
		""""""""syn match mmdInlineComments      "/\*.*\*/"   keepend contained
		""""""""syn match mmdInlineCode          "`.*`"       keepend contained
		""""""""syn match mmdInlineItalics       "\*.*\*"     keepend contained
		""""""""syn match mmdInlineBold          "\*\*.*\*\*" keepend contained
		""""""""syn match mmdInlineUnedrline     "_.*_"       keepend contained
		""""""""syn match mmdInlineStrikethrough "\~\~.*\~\~" keepend contained


	" Block Quote
	syn region mmdFormatBlockQuote    matchgroup=mmdCommentDelimiter start="^>\|^\s\s\s\s>\|^\t>"                matchgroup=mmdCommentDelimiter   end="\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>>\|^\s\s\s\s>>\|^\t>>"             matchgroup=mmdCommentDelimiter   end="\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>\s>\|^\s\s\s\s>\s\|^\t>\s"         matchgroup=mmdCommentDelimiter   end="\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>\s>\s\|^\s\s\s\s>\s>\s\|^\t>\s>\s" matchgroup=mmdCommentDelimiter   end="\s*$"   keepend contains=@mmdInline

	" Lists
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[-*+~]\s"                      matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[-*+~]\s"                   matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting

	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.\s" matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting

	" Links
	syn region mmdFormatLink          matchgroup=mmdFaceDelimiter start="<"                matchgroup=mmdFaceDelimiter end=">"      keepend
	syn region mmdFormatLink          matchgroup=mmdLinkDelimiter start=+(+                matchgroup=mmdLinkDelimiter end=+)\|)\]+ keepend contained
	syn region mmdFormatHyperLink     matchgroup=mmdLinkDelimiter start="\["               matchgroup=mmdLinkDelimiter end="\]"     nextgroup=mmdFormatLink,mmdFormatHyperLink contains=@mmdInline,mmdFormatHyperLink,mmdFormatPseudonym
	syn region mmdFormatHyperLink     matchgroup=mmdLinkDelimiter start="\!\["             matchgroup=mmdLinkDelimiter end="\]"     keepend nextgroup=mmdFormatLink,mmdFormatHyperLink contains=@mmdInline,mmdFormatHyperLink,mmdFormatPseudonym
	syn region mmdFormatPseudonym     matchgroup=mmdLinkDelimiter start=+"+                matchgroup=mmdLinkDelimiter end=+"+      keepend contained

	" Footnotes/References
	syn match mmdFormatReferenceMark "\[[0-9A-Za-z[:alnum:]]*\]\|\[[0-9A-Za-z[:alnum:]]*\]"
	syn match mmdFormatReferenceMark "\[^[0-9A-Za-z[:alnum:]]*\]\|\[^[0-9A-Za-z[:alnum:]]*\]"
	syn match mmdFormatReferenceMark "\[[0-9A-Za-z[:alnum:]]*\]:\s\|\[[0-9A-Za-z[:alnum:]]*\]:\s"
	syn match mmdFormatReferenceMark "\[^[0-9A-Za-z[:alnum:]]*\]:\s\|\[^[0-9A-Za-z[:alnum:]]*\]:\s"

	" Rules
	syn region mmdFormatRules start="^-\s-\s-" end=".*\s*$"    keepend
	syn region mmdFormatRules start="^=\s=\s=" end=".*\s*$"    keepend
	syn region mmdFormatRules start="^\~\s\~\s\~" end=".*\s*$" keepend

	
" ===HILIGHTING===

	" HEADERS

		" Delimiter
		hi def link mmdHeadingDelimiter         Delimiter

		" New-Fashioned
		hi def mmdFormatH1nouline cterm=bold           ctermfg=magenta
		hi def mmdFormatH2nouline cterm=bold           ctermfg=yellow
		hi def mmdFormatH3nouline cterm=bold           ctermfg=cyan
		hi def mmdFormatH4nouline cterm=bold           ctermfg=lightred
		hi def mmdFormatH5nouline cterm=bold           ctermfg=green
		hi def mmdFormatH6nouline cterm=bold           ctermfg=darkyellow

		" Old-Fashioned
		hi def mmdFormatH1        cterm=bold,underline ctermfg=magenta
		hi def mmdFormatH2        cterm=bold,underline ctermfg=yellow
		hi def mmdFormatH3        cterm=bold,underline ctermfg=cyan
		hi def mmdFormatH4        cterm=bold,underline ctermfg=lightred
		hi def mmdFormatH5        cterm=bold,underline ctermfg=green
		hi def mmdFormatH6        cterm=bold,underline ctermfg=darkyellow

	
	" FORMATTING

		" Rules
		hi def mmdFormatRules cterm=strikethrough,bold

		" Colours
			
			" Delimiter
			hi def link mmdColoursDelimiter Delimiter

			" Formatting

				" Foreground
				hi def mmdFormatColourBlack       ctermfg=black        ctermbg=white
				hi def mmdFormatColourBlue        ctermfg=blue
				hi def mmdFormatColourBrown       ctermfg=darkyellow   
				hi def mmdFormatColourLightGrey   ctermfg=lightgrey
				hi def mmdFormatColourGreen       ctermfg=green
				hi def mmdFormatColourCyan        ctermfg=cyan
				hi def mmdFormatColourRed         ctermfg=red
				hi def mmdFormatColourMagenta     ctermfg=magenta
				hi def mmdFormatColourYellow      ctermfg=yellow
				hi def mmdFormatColourWhite       ctermfg=white        ctermbg=black

				" Background (Highlighting)
				hi def mmdFormatColourHiBlack     ctermbg=black        ctermfg=yellow
				hi def mmdFormatColourHiBlue      ctermbg=blue
				hi def mmdFormatColourHiBrown     ctermbg=darkyellow   
				hi def mmdFormatColourHiLightGrey ctermbg=lightgrey
				hi def mmdFormatColourHiGreen     ctermbg=green
				hi def mmdFormatColourHiCyan      ctermbg=cyan
				hi def mmdFormatColourHiRed       ctermbg=red
				hi def mmdFormatColourHiMagenta   ctermbg=magenta
				hi def mmdFormatColourHiYellow    ctermbg=yellow
				hi def mmdFormatColourHiWhite     ctermbg=white        ctermfg=black

			" Font Faces

				" Delimiter
				hi def link mmdCommentDelimiter   Comment
				hi def link mmdFaceDelimiter      Delimiter
				hi def      mmdLinkDelimiter      ctermfg=darkyellow

				" Inline
				hi def link mmdFormatComment      Comment
				hi def mmdFormatMetaProc          cterm=bold           ctermfg=cyan
				hi def link mmdFormatMetaDataParams mmdFormatMetaProc
				hi def link mmdFormatMetaData     Preproc
				hi def mmdFormatCode              ctermfg=cyan         ctermbg=darkblue

					" Meta
					hi def link mmdMetaTagsGeneral mmdFormatMetaProc
					hi def link mmdMetaTagsAuthor  mmdFormatMetaProc
					hi def link mmdMetaTagsAgent   mmdFormatMetaProc
					hi def link mmdMetaTagsPaper   mmdFormatMetaProc

					" Italics
					hi def mmdFormatItalics                        cterm=italic
						hi def mmdFormatItalicsBold            cterm=italic,bold
						hi def mmdFormatItalicsUnderline       cterm=italic,underline
						hi def mmdFormatItalicsUnderlineStrike cterm=italic,underline,strikethrough
						hi def mmdFormatItalicsStrike          cterm=italic,strikethrough

					" Bold
					hi def mmdFormatBold                           cterm=bold
						hi def mmdFormatBoldUnderline          cterm=bold,underline
						hi def mmdFormatBoldUnderlineStrike    cterm=bold,underline,strikethrough
						hi def mmdFormatBoldStrike             cterm=bold,strikethrough

					" Underline
					hi def mmdFormatUnderline                      cterm=underline
						hi def mmdFormatUnderlineStrike        cterm=underline,strikethrough

					" Strikethrough
					hi def mmdFormatStrikethrough                  cterm=strikethrough

					" All
					hi def mmdFormatAll                            cterm=italic,bold,underline
					hi def mmdFormatAllPlus                        cterm=italic,bold,underline,strikethrough

					" Inline
					hi def link mmdInlineComments      mmdFormatComment
					hi def link mmdInlineCode          mmdFormatCode
					hi def link mmdInlineItalics       mmdFormatItalics
					hi def link mmdInlineBold          mmdFormatBold
					hi def link mmdInlineUnedrline     mmdFormatUnderline
					hi def link mmdInlineStrikethrough mmdFormatStrikethrough

				" Others
				hi def mmdFormatItalicsStrike
				hi def mmdFormatBoldStrike
				hi def mmdFormatUnderlineStrike

				" Block Quotes
				hi def mmdFormatBlockQuote                             ctermfg=white                             ctermbg=darkmagenta
				hi def mmdFormatBlockQuote2                            ctermfg=lightgreen                        ctermbg=darkmagenta

				" Links
				hi def link mmdFormatLink                              Underlined
                                hi def mmdFormatHyperLink                              ctermfg=darkyellow
                                hi def mmdFormatPseudonym                              ctermfg=lightgreen

				" References
				hi def mmdFormatReferenceMark                          ctermfg=lightgreen

				" Escape Chars
				hi def mmdFormatEscape                                 ctermfg=yellow


let b:current_syntax = "mmarkdown"
