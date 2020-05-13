" Vim Syntax File
" Language:	M-Markdown
" Filenames:	*.mmarkdown, *.mmd, *.markdown, *.md, *.txt
" Maintainer:	Matþew T. Scarbrough <matthewtatescarbrough@tutanota.com>
" Last Change:	2020 Mar 13
" Version:	0.03d
" Note:		Though this file is written from scratch, many lines may
" 		be takenfrom the $VIMRUNTIME/syntax/markdown.vim file.
" TODO:		Add FOOTNOTES, etc.

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
	syn cluster mmdFormatting contains=@mmdFormatColours,mmdFormatCode,mmdFormatItalics,mmdFormatBold,mmdFormatUnderline,mmdFormatStrikethrough

	syn cluster mmdHeaders        contains=mmdFormatH1,mmdFormatH2,mmdFormatH3,mmdFormatH4,mmdFormatH5,mmdFormatH6
	syn cluster mmdHeadersNouline contains=mmdFormatH1Nouline,mmdFormatH2Nouline,mmdFormatH3Nouline,mmdFormatH4Nouline,mmdFormatH5Nouline,mmdFormatH6Nouline
	syn cluster mmdFormatColours  contains=mmdFormatColourBlack,mmdFormatColourBlue,mmdFormatColourBrown,mmdFormatColourLightGrey,mmdFormatColourGreen,mmdFormatColourCyan,mmdFormatColourRed,mmdFormatColourMagenta,mmdFormatColourYellow,mmdFormatColourWhite,mmdFormatColourHiBlack,mmdFormatColourHiBlue,mmdFormatColourHiBrown,mmdFormatColourHiLightGrey,mmdFormatColourHiGreen,mmdFormatColourHiCyan,mmdFormatColourHiRed,mmdFormatColourHiMagenta,mmdFormatColourHiYellow,mmdFormatColourHiWhite


" ===HEADERS===

	" New-Fashioned
	syn match mmdFormatH1nouline "^.\+\n=\+$"
	syn match mmdFormatH2nouline "^.\+\n-\+$"
	syn match mmdFormatH3nouline "^.\+\n\~\+$"

		" New-Fashioned 2
		syn match mmdFormatH3nouline "^#.\+\n-\+$"
		syn match mmdFormatH4nouline "^##.\+\n-\+$"
		syn match mmdFormatH5nouline "^###.\+\n-\+$"
		syn match mmdFormatH6nouline "^####.\+\n-\+$"

		" New-Fashioned 3 (Redundant redundancy)
		syn match mmdFormatH4nouline "^#.\+\n\~\+$"
		syn match mmdFormatH5nouline "^##.\+\n\~\+$"
		syn match mmdFormatH6nouline "^###.\+\n\~\+$"

	" Old-Fashioned
	syn region mmdFormatH1 matchgroup=mmdHeadingDelimiter start="##\@!"      end="#*\s*$" keepend oneline
	syn region mmdFormatH2 matchgroup=mmdHeadingDelimiter start="###\@!"     end="#*\s*$" keepend oneline
	syn region mmdFormatH3 matchgroup=mmdHeadingDelimiter start="####\@!"    end="#*\s*$" keepend oneline
	syn region mmdFormatH4 matchgroup=mmdHeadingDelimiter start="#####\@!"   end="#*\s*$" keepend oneline
	syn region mmdFormatH5 matchgroup=mmdHeadingDelimiter start="######\@!"  end="#*\s*$" keepend oneline
	syn region mmdFormatH6 matchgroup=mmdHeadingDelimiter start="#######\@!" end="#*\s*$" keepend oneline


" ===FORMATTING===

	" Colours
	" TODO: add a customisable colouring system & more streamlined
	
		" Foreground
		syn region mmdFormatColourBlack     matchgroup=mmdColoursDelimiter start=+\\black"\|\\black{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourBlue      matchgroup=mmdColoursDelimiter start=+\\blue"\|\\blue{+                   matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourBrown     matchgroup=mmdColoursDelimiter start=+\\brown"\|\\brown{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourGreen     matchgroup=mmdColoursDelimiter start=+\\green"\|\\green{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourCyan      matchgroup=mmdColoursDelimiter start=+\\cyan"\|\\cyan{+                   matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourRed       matchgroup=mmdColoursDelimiter start=+\\red"\|\\red{+                     matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourMagenta   matchgroup=mmdColoursDelimiter start=+\\magenta"\|\\magenta{+             matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourYellow    matchgroup=mmdColoursDelimiter start=+\\yellow"\|\\yellow{+               matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourWhite     matchgroup=mmdColoursDelimiter start=+\\white"\|\\white{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourLightGrey matchgroup=mmdColoursDelimiter start=+\\grey"\|\\grey{\|\\gray"\|\\gray{+ matchgroup=mmdColoursDelimiter end=+"\|}+ keepend

		" Background (highlighting)
		syn region mmdFormatColourHiBlack     matchgroup=mmdColoursDelimiter start=+\\hiblack"\|\\hiblack{+                     matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiBlue      matchgroup=mmdColoursDelimiter start=+\\hibl[ue]"\|\\hibl[ue]{+                   matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiBrown     matchgroup=mmdColoursDelimiter start=+\\hibr[own]"\|\\hibr[own]{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiGreen     matchgroup=mmdColoursDelimiter start=+\\higr[een]"\|\\higr[een]{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiCyan      matchgroup=mmdColoursDelimiter start=+\\hicy[an]"\|\\hicy[an]{+                   matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiRed       matchgroup=mmdColoursDelimiter start=+\\hir[ed]"\|\\hir[ed]{+                     matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiMagenta   matchgroup=mmdColoursDelimiter start=+\\him[agenta]"\|\\him[agenta]{+             matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiYellow    matchgroup=mmdColoursDelimiter start=+\\hiy[ellow]"\|\\hiy[ellow]{+               matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiWhite     matchgroup=mmdColoursDelimiter start=+\\hiwh[ite]"\|\\hiwh[ite]{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend
		syn region mmdFormatColourHiLightGrey matchgroup=mmdColoursDelimiter start=+\\higrey"\|\\higrey{\|\\higray"\|\\higray{+ matchgroup=mmdColoursDelimiter end=+"\|}+ keepend

	" Comments
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="/\*"           matchgroup=mmdCommentDelimiter   end="\*/"      keepend
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="//"            matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="%"             matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend

	" Meta Data Pre Proc
	syn match mmdFormatMetaProc "^//"  nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaProc "^%%"  nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaProc "^%"   nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaData ".\+$" contained contains=mmdFormatComment

	" Code
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="^\s\s\s\s\|^\t"     matchgroup=mmdFaceDelimiter    end="#*\s*$"   keepend   contains=@mmdInline
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="`"                matchgroup=mmdFaceDelimiter      end="`"        keepend   contains=@mmdInline

	" Font Faces

		" Italics
		syn region mmdFormatItalics       matchgroup=mmdFaceDelimiter start="\S\@<=\*\|\*\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\*\|\*\S\@="     keepend contains=@mmdInline
			"syn region mmdFormatItalicsBold      matchgroup=mmdFaceDelimiter start="\*\*\*"         matchgroup=mmdFaceDelimiter end="\*\*\*"         keepend contains=@mmdInline
			"syn region mmdFormatItalicsUnderline matchgroup=mmdFaceDelimiter start="_\*"            matchgroup=mmdFaceDelimiter end="\*_"            keepend contains=@mmdInline
			"syn region mmdFormatItalicsStrike    matchgroup=mmdFaceDelimiter start="\~\*"           matchgroup=mmdFaceDelimiter end="\*\~"           keepend contains=@mmdInline

		" Bold
		syn region mmdFormatBold          matchgroup=mmdFaceDelimiter start="\S\@<=\*\*\|\*\*\S\@=" matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=@mmdInline
			"syn region mmdFormatBoldUnderline    matchgroup=mmdFaceDelimiter start="_\*\*"          matchgroup=mmdFaceDelimiter end="\*\*_"          keepend contains=@mmdInline
			"syn region mmdFormatBoldStrike       matchgroup=mmdFaceDelimiter start="\~\*\*"         matchgroup=mmdFaceDelimiter end="\*\*\~"         keepend contains=@mmdInline

		" Underline
		syn region mmdFormatUnderline     matchgroup=mmdFaceDelimiter start="\S\@<=_\|_\S\@="       matchgroup=mmdFaceDelimiter end="\S\@<=_\|_\S\@="       keepend contains=@mmdInline
			"syn region mmdFormatUnderlineStrike  matchgroup=mmdFaceDelimiter start="_\~"            matchgroup=mmdFaceDelimiter end="\~_"            keepend contains=@mmdInline

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
	syn region mmdFormatBlockQuote    matchgroup=mmdCommentDelimiter start="^>\|^\s\s\s\s>\|^\t>"                matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>>\|^\s\s\s\s>>\|^\t>>"             matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>\s>\|^\s\s\s\s>\s\|^\t>\s"         matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>\s>\s\|^\s\s\s\s>\s>\s\|^\t>\s>\s" matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend contains=@mmdInline

	" Lists
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[-*+~]\s"                      matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[-*+~]\s"                   matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\t*[-*+~]\s"                   matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.\s" matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\t*[[0-9A-Za-z[:alnum:]]*\.\s" matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline

	" Links
	syn region mmdFormatLink          matchgroup=mmdFaceDelimiter start="<"                matchgroup=mmdFaceDelimiter end=">"  keepend
	syn region mmdFormatLink          matchgroup=mmdLinkDelimiter start=+(+                matchgroup=mmdLinkDelimiter end=+)+  keepend contained
	syn region mmdFormatHyperLink     matchgroup=mmdLinkDelimiter start="\[\|\!\[\|\[\!\[" matchgroup=mmdLinkDelimiter end="\]" keepend nextgroup=mmdFormatLink contains=@mmdInline,@mmdFormatting,mmdFormatPseudonym
	syn region mmdFormatPseudonym     matchgroup=mmdLinkDelimiter start=+"+                matchgroup=mmdLinkDelimiter end=+"+  keepend contained

	" Escape Sequences
	syn match mmdFormatEscape "\\[][\\`*_{}()<>#+.!-~%]"
	syn match mmdFormatEscape "\\r\|\\n\|\\t"

	" Rules
	syn match mmdFormatRules "^-\s-\s-"
	syn match mmdFormatRules "^=\s=\s="
	syn match mmdFormatRules "^\~\s\~\s\~"
	syn match mmdFormatRules "^-\s-\s-\s-"
	syn match mmdFormatRules "^=\s=\s=\s="
	syn match mmdFormatRules "^\~\s\~\s\~\s\~"

	
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
                                hi def mmdFormatPseudonym                              ctermfg=darkyellow

				" Escape Chars
				hi def mmdFormatEscape                                 ctermfg=yellow


let b:current_syntax = "mmarkdown"
